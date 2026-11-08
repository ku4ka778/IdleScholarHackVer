package city

import (
	"context"
	"time"
	"fmt"
	"log"
	"math/rand"
	"github.com/jackc/pgx/v5/pgxpool"
	"IdleScholar_BD/internal/game"
	citypb "IdleScholar_BD/gen/city"
)

type Server struct {
	citypb.UnimplementedCityServiceServer
	db *pgxpool.Pool
}

func NewServer(db *pgxpool.Pool) *Server {
	return &Server{db: db}
}

func (s *Server) GetCity(ctx context.Context, req *citypb.GetCityRequest) (*citypb.GetCityResponse, error) {
	if req.CharacterId == 0 {
		return &citypb.GetCityResponse{Success: false, Message: "Character ID required"}, nil
	}

	var cityID int32
	var cityLevel int32
	err := s.db.QueryRow(ctx, `SELECT id, level FROM city WHERE character_id = $1`, req.CharacterId).Scan(&cityID, &cityLevel)
	if err != nil {
		return &citypb.GetCityResponse{Success: false, Message: "City not found"}, nil
	}

	rows, _ := s.db.Query(ctx, `SELECT resource_type, amount FROM city_resource WHERE city_id = $1 ORDER BY resource_type`, cityID)
	var resources []*citypb.ResourceEntry
	if rows != nil {
		for rows.Next() {
			var rtype string
			var amount int64
			if err := rows.Scan(&rtype, &amount); err == nil {
				resources = append(resources, &citypb.ResourceEntry{ResourceType: rtype, Amount: amount})
			}
		}
		rows.Close()
	}

	upgrades := make(map[string]int32)
	upRows, _ := s.db.Query(ctx, `SELECT upgrade_code, level FROM city_upgrade WHERE city_id = $1`, cityID)
	if upRows != nil {
		for upRows.Next() {
			var code string
			var lvl int32
			if err := upRows.Scan(&code, &lvl); err == nil {
				upgrades[code] = lvl
			}
		}
		upRows.Close()
	}

	return &citypb.GetCityResponse{
		Success:   true,
		Message:   "OK",
		CityId:    cityID,
		Level:     cityLevel,
		Resources: resources,
		Upgrades:  upgrades,
	}, nil
}

func (s *Server) UpgradeBuilding(ctx context.Context, req *citypb.UpgradeBuildingRequest) (*citypb.UpgradeBuildingResponse, error) {
	tx, err := s.db.Begin(ctx)
	if err != nil {
		return &citypb.UpgradeBuildingResponse{Success: false, Message: "DB error"}, nil
	}
	defer tx.Rollback(ctx)

	var cityID int32
	err = tx.QueryRow(ctx, `SELECT id FROM city WHERE character_id = $1`, req.CharacterId).Scan(&cityID)
	if err != nil {
		return &citypb.UpgradeBuildingResponse{Success: false, Message: "City not found"}, nil
	}

	var currentLevel int32
	err = tx.QueryRow(ctx, `SELECT level FROM city_upgrade WHERE city_id = $1 AND upgrade_code = $2`, cityID, req.UpgradeCode).Scan(&currentLevel)
	if err != nil {
		currentLevel = 0
	}

	nextLevel := currentLevel + 1
	woodCost := nextLevel * 50
	stoneCost := nextLevel * 30

	var woodHave, stoneHave int64
	tx.QueryRow(ctx, `SELECT COALESCE(amount, 0) FROM city_resource WHERE city_id = $1 AND resource_type = 'twig'`, cityID).Scan(&woodHave)
	tx.QueryRow(ctx, `SELECT COALESCE(amount, 0) FROM city_resource WHERE city_id = $1 AND resource_type = 'stone'`, cityID).Scan(&stoneHave)

	if woodHave < int64(woodCost) || stoneHave < int64(stoneCost) {
		return &citypb.UpgradeBuildingResponse{Success: false, Message: "Not enough resources"}, nil
	}

	tx.Exec(ctx, `UPDATE city_resource SET amount = amount - $1 WHERE city_id = $2 AND resource_type = 'twig'`, woodCost, cityID)
	tx.Exec(ctx, `UPDATE city_resource SET amount = amount - $1 WHERE city_id = $2 AND resource_type = 'stone'`, stoneCost, cityID)

	_, err = tx.Exec(ctx, `
		INSERT INTO city_upgrade (city_id, upgrade_code, level) 
		VALUES ($1, $2, $3)
		ON CONFLICT (city_id, upgrade_code) 
		DO UPDATE SET level = EXCLUDED.level`,
		cityID, req.UpgradeCode, nextLevel,
	)
	if err != nil {
		return &citypb.UpgradeBuildingResponse{Success: false, Message: "Failed to save upgrade"}, nil
	}

	tx.Commit(ctx)

	return &citypb.UpgradeBuildingResponse{
		Success:  true,
		Message:  "Upgrade purchased",
		NewLevel: nextLevel,
	}, nil
}

func (s *Server) GetFoodRecipes(ctx context.Context, req *citypb.GetFoodRecipesRequest) (*citypb.GetFoodRecipesResponse, error) {
	var goldPct, expPct, luckPct int
	err := s.db.QueryRow(ctx, `SELECT COALESCE(active_food_gold_pct, 0), COALESCE(active_food_exp_pct, 0), COALESCE(active_food_luck_pct, 0) FROM "character" WHERE id = $1`, req.CharacterId).Scan(&goldPct, &expPct, &luckPct)
	if err != nil {
		return &citypb.GetFoodRecipesResponse{Success: false}, nil
	}

	rows, err := s.db.Query(ctx, `SELECT id, code, name, description, tier, cost_resource, cost_amount, buff_gold_pct, buff_exp_pct, buff_luck_pct FROM food_recipe ORDER BY tier`)
	if err != nil {
		return &citypb.GetFoodRecipesResponse{Success: false}, nil
	}
	defer rows.Close()

	var recipes []*citypb.FoodRecipe
	for rows.Next() {
		r := &citypb.FoodRecipe{}
		rows.Scan(&r.Id, &r.Code, &r.Name, &r.Description, &r.Tier, &r.CostResource, &r.CostAmount, &r.BuffGoldPct, &r.BuffExpPct, &r.BuffLuckPct)
		recipes = append(recipes, r)
	}

	return &citypb.GetFoodRecipesResponse{
		Success:           true,
		Recipes:           recipes,
		ActiveFoodGoldPct: int32(goldPct),
		ActiveFoodExpPct:  int32(expPct),
		ActiveFoodLuckPct: int32(luckPct),
	}, nil
}

func (s *Server) BuyFood(ctx context.Context, req *citypb.BuyFoodRequest) (*citypb.BuyFoodResponse, error) {
	tx, err := s.db.Begin(ctx)
	if err != nil {
		return &citypb.BuyFoodResponse{Success: false, Message: "DB error"}, nil
	}
	defer tx.Rollback(ctx)

	var costRes string
	var costAmt, buffG, buffE, buffL int
	err = tx.QueryRow(ctx, `SELECT cost_resource, cost_amount, buff_gold_pct, buff_exp_pct, buff_luck_pct FROM food_recipe WHERE code = $1`, req.FoodCode).Scan(&costRes, &costAmt, &buffG, &buffE, &buffL)
	if err != nil {
		return &citypb.BuyFoodResponse{Success: false, Message: "Recipe not found"}, nil
	}

	var cityID int
	tx.QueryRow(ctx, `SELECT id FROM city WHERE character_id = $1`, req.CharacterId).Scan(&cityID)
	
	var haveAmt int64
	tx.QueryRow(ctx, `SELECT COALESCE(amount, 0) FROM city_resource WHERE city_id = $1 AND resource_type = $2`, cityID, costRes).Scan(&haveAmt)

	if haveAmt < int64(costAmt) {
		return &citypb.BuyFoodResponse{Success: false, Message: "Not enough resources"}, nil
	}

	tx.Exec(ctx, `UPDATE city_resource SET amount = amount - $1 WHERE city_id = $2 AND resource_type = $3`, costAmt, cityID, costRes)
	
	_, err = tx.Exec(ctx, `
		UPDATE "character" 
		SET active_food_code = $1, active_food_gold_pct = $2, active_food_exp_pct = $3, active_food_luck_pct = $4 
		WHERE id = $5`,
		req.FoodCode, buffG, buffE, buffL, req.CharacterId,
	)
	if err != nil {
		return &citypb.BuyFoodResponse{Success: false, Message: "Failed to apply buff"}, nil
	}

	tx.Commit(ctx)
	return &citypb.BuyFoodResponse{Success: true, Message: "Buff applied for next expedition"}, nil
}

func (s *Server) GetPotionRecipes(ctx context.Context, req *citypb.GetPotionRecipesRequest) (*citypb.GetPotionRecipesResponse, error) {
	rows, err := s.db.Query(ctx, `SELECT id, code, name, description, tier, cost_resource, cost_amount, cost_gold, reward_gold, reward_exp, reward_resource, reward_resource_amount FROM potion_recipe ORDER BY tier`)
	if err != nil {
		return &citypb.GetPotionRecipesResponse{Success: false}, nil
	}
	defer rows.Close()

	var recipes []*citypb.PotionRecipe
	for rows.Next() {
		r := &citypb.PotionRecipe{}
		var res *string
		rows.Scan(&r.Id, &r.Code, &r.Name, &r.Description, &r.Tier, &r.CostResource, &r.CostAmount, &r.CostGold, &r.RewardGold, &r.RewardExp, &res, &r.RewardResourceAmount)
		if res != nil {
			r.RewardResource = *res
		}
		recipes = append(recipes, r)
	}

	return &citypb.GetPotionRecipesResponse{Success: true, Recipes: recipes}, nil
}

func (s *Server) DrinkPotion(ctx context.Context, req *citypb.DrinkPotionRequest) (*citypb.DrinkPotionResponse, error) {
	tx, err := s.db.Begin(ctx)
	if err != nil {
		return &citypb.DrinkPotionResponse{Success: false, Message: "DB error"}, nil
	}
	defer tx.Rollback(ctx)

	var costRes, rewardRes string
	var costAmt, costGold, rewGold, rewExp, rewResAmt int
	var res *string

	err = tx.QueryRow(ctx, `SELECT cost_resource, cost_amount, cost_gold, reward_gold, reward_exp, reward_resource, reward_resource_amount FROM potion_recipe WHERE code = $1`, req.PotionCode).Scan(&costRes, &costAmt, &costGold, &rewGold, &rewExp, &res, &rewResAmt)
	if err != nil {
		return &citypb.DrinkPotionResponse{Success: false, Message: "Recipe not found"}, nil
	}
	if res != nil {
		rewardRes = *res
	}

	var cityID int
	tx.QueryRow(ctx, `SELECT id FROM city WHERE character_id = $1`, req.CharacterId).Scan(&cityID)
	
	var haveAmt, haveGold int64
	tx.QueryRow(ctx, `SELECT COALESCE(amount, 0) FROM city_resource WHERE city_id = $1 AND resource_type = $2`, cityID, costRes).Scan(&haveAmt)
	tx.QueryRow(ctx, `SELECT gold FROM "character" WHERE id = $1`, req.CharacterId).Scan(&haveGold)

	if haveAmt < int64(costAmt) || haveGold < int64(costGold) {
		return &citypb.DrinkPotionResponse{Success: false, Message: "Not enough resources or gold"}, nil
	}

	tx.Exec(ctx, `UPDATE city_resource SET amount = amount - $1 WHERE city_id = $2 AND resource_type = $3`, costAmt, cityID, costRes)
	tx.Exec(ctx, `UPDATE "character" SET gold = gold - $1 WHERE id = $2`, costGold, req.CharacterId)

	tx.Exec(ctx, `UPDATE "character" SET gold = gold + $1, experience = experience + $2 WHERE id = $3`, rewGold, rewExp, req.CharacterId)
	
	if rewardRes != "" && rewResAmt > 0 {
		tx.Exec(ctx, `INSERT INTO city_resource (city_id, resource_type, amount) VALUES ($1, $2, $3) 
			ON CONFLICT (city_id, resource_type) DO UPDATE SET amount = city_resource.amount + EXCLUDED.amount`, 
			cityID, rewardRes, rewResAmt)
	}

	tx.Commit(ctx)
	return &citypb.DrinkPotionResponse{Success: true, Message: "Potion consumed"}, nil
}

func (s *Server) StartBarracks(ctx context.Context, req *citypb.StartBarracksRequest) (*citypb.StartBarracksResponse, error) {
	var endTime int64
	err := s.db.QueryRow(ctx, `SELECT barracks_end FROM "character" WHERE id = $1`, req.CharacterId).Scan(&endTime)
	if err != nil {
		return &citypb.StartBarracksResponse{Success: false, Message: "Character not found"}, nil
	}

	now := time.Now().Unix()
	if endTime > now {
		return &citypb.StartBarracksResponse{Success: false, Message: "Barracks already in progress"}, nil
	}

	newEndTime := now + 8*3600

	_, err = s.db.Exec(ctx, `UPDATE "character" SET barracks_start = $1, barracks_end = $2 WHERE id = $3`, now, newEndTime, req.CharacterId)
	if err != nil {
		return &citypb.StartBarracksResponse{Success: false, Message: "DB error"}, nil
	}

	return &citypb.StartBarracksResponse{
		Success: true,
		Message: "Barracks started",
		EndTime: newEndTime,
	}, nil
}

func (s *Server) ClaimBarracks(ctx context.Context, req *citypb.ClaimBarracksRequest) (*citypb.ClaimBarracksResponse, error) {
	var start, end int64
	err := s.db.QueryRow(ctx, `SELECT barracks_start, barracks_end FROM "character" WHERE id = $1`, req.CharacterId).Scan(&start, &end)
	if err != nil {
		return &citypb.ClaimBarracksResponse{Success: false, Message: "Character not found"}, nil
	}

	now := time.Now().Unix()
	if end == 0 || now < end {
		return &citypb.ClaimBarracksResponse{Success: false, Message: "Barracks not finished yet"}, nil
	}

	var level int
	err = s.db.QueryRow(ctx, `SELECT COALESCE(level, 1) FROM city_upgrade WHERE city_id = (SELECT id FROM city WHERE character_id = $1) AND upgrade_code = 'barracks'`, req.CharacterId).Scan(&level)
	if err != nil {
		level = 1
	}

	goldEarned := int64(level) * 100

	_, err = s.db.Exec(ctx, `
		UPDATE "character" 
		SET gold = gold + $1, barracks_start = 0, barracks_end = 0 
		WHERE id = $2`, goldEarned, req.CharacterId)
	
	if err != nil {
		return &citypb.ClaimBarracksResponse{Success: false, Message: "DB error"}, nil
	}

	return &citypb.ClaimBarracksResponse{
		Success:    true,
		Message:    "Rewards claimed",
		GoldEarned: goldEarned,
	}, nil
}

func (s *Server) GetRaidLogs(ctx context.Context, req *citypb.GetRaidLogsRequest) (*citypb.GetRaidLogsResponse, error) {
	rows, err := s.db.Query(ctx, `
		SELECT id, raid_power, wall_defense, resources_lost, created_at::text 
		FROM raid_logs WHERE character_id = $1 
		ORDER BY created_at DESC LIMIT 20`, req.CharacterId)
	if err != nil {
		return &citypb.GetRaidLogsResponse{Success: false}, nil
	}
	defer rows.Close()

	var logs []*citypb.RaidLog
	for rows.Next() {
		l := &citypb.RaidLog{}
		rows.Scan(&l.Id, &l.RaidPower, &l.WallDefense, &l.ResourcesLost, &l.CreatedAt)
		logs = append(logs, l)
	}
	return &citypb.GetRaidLogsResponse{Success: true, Logs: logs}, nil
}

func (s *Server) GetLeaderboard(ctx context.Context, req *citypb.GetLeaderboardRequest) (*citypb.GetLeaderboardResponse, error) {
	orderBy := "level DESC, experience DESC"
	if req.SortBy == "time" {
		orderBy = "total_expedition_time DESC"
	}

	query := fmt.Sprintf(`
		SELECT id, COALESCE(name, 'Unknown'), COALESCE(level, 1), COALESCE(total_expedition_time, 0), COALESCE(class_type, 'warrior')
		FROM "character" 
		ORDER BY %s 
		LIMIT 50`, orderBy)

	rows, err := s.db.Query(ctx, query)
	if err != nil {
		log.Printf("Leaderboard query error: %v", err) 
		return &citypb.GetLeaderboardResponse{Success: false}, nil
	}
	defer rows.Close()

	var entries []*citypb.LeaderboardEntry
	rank := 1
	for rows.Next() {
		e := &citypb.LeaderboardEntry{Rank: int32(rank)}
		
		err := rows.Scan(&e.CharacterId, &e.Name, &e.Level, &e.TotalTime, &e.ClassType)
		if err != nil {
			log.Printf("Leaderboard scan error: %v", err)
			continue 
		}
		
		entries = append(entries, e)
		rank++
	}

	return &citypb.GetLeaderboardResponse{Success: true, Entries: entries}, nil
}

func (s *Server) SearchPlayer(ctx context.Context, req *citypb.SearchPlayerRequest) (*citypb.SearchPlayerResponse, error) {
	var id, level int32
	var name, classType string
	var clanID *int32

	err := s.db.QueryRow(ctx, `SELECT id, name, level, class_type, clan_id FROM "character" WHERE name = $1`, req.Name).Scan(&id, &name, &level, &classType, &clanID)
	if err != nil {
		return &citypb.SearchPlayerResponse{Success: false}, nil
	}

	var cID int32 = 0
	if clanID != nil { cID = *clanID }

	return &citypb.SearchPlayerResponse{
		Success: true, CharacterId: id, Name: name, Level: level, ClassType: classType, ClanId: cID,
	}, nil
}

func (s *Server) AddFriend(ctx context.Context, req *citypb.AddFriendRequest) (*citypb.AddFriendResponse, error) {
	if req.CharacterId == req.TargetId {
		return &citypb.AddFriendResponse{Success: false, Message: "You cannot add yourself"}, nil
	}

	_, err := s.db.Exec(ctx, `
		INSERT INTO friendships (requester_id, receiver_id, status) 
		VALUES ($1, $2, 'pending')
		ON CONFLICT (requester_id, receiver_id) DO NOTHING`,
		req.CharacterId, req.TargetId)

	if err != nil {
		return &citypb.AddFriendResponse{Success: false, Message: "Error"}, nil
	}
	return &citypb.AddFriendResponse{Success: true, Message: "Request sent"}, nil
}

func (s *Server) GetFriends(ctx context.Context, req *citypb.GetFriendsRequest) (*citypb.GetFriendsResponse, error) {
	rows, err := s.db.Query(ctx, `
		SELECT c.id, c.name, c.level, f.status,
		       CASE WHEN f.receiver_id = $1 THEN 'incoming' ELSE 'outgoing' END as direction
		FROM friendships f
		JOIN "character" c ON (c.id = f.requester_id OR c.id = f.receiver_id) AND c.id != $1
		WHERE f.requester_id = $1 OR f.receiver_id = $1`, req.CharacterId)

	if err != nil {
		return &citypb.GetFriendsResponse{Success: false}, nil
	}
	defer rows.Close()

	var friends []*citypb.FriendEntry
	for rows.Next() {
		f := &citypb.FriendEntry{}
		var direction string
		rows.Scan(&f.CharacterId, &f.Name, &f.Level, &f.Status, &direction)
		
		if f.Status == "pending" {
			f.Status = direction
		}
		friends = append(friends, f)
	}

	return &citypb.GetFriendsResponse{Success: true, Friends: friends}, nil
}

func (s *Server) AcceptFriend(ctx context.Context, req *citypb.AcceptFriendRequest) (*citypb.AcceptFriendResponse, error) {
	_, err := s.db.Exec(ctx, `
		UPDATE friendships SET status = 'accepted' 
		WHERE requester_id = $1 AND receiver_id = $2 AND status = 'pending'`,
		req.RequesterId, req.CharacterId)

	if err != nil {
		return &citypb.AcceptFriendResponse{Success: false, Message: "Error"}, nil
	}
	return &citypb.AcceptFriendResponse{Success: true, Message: "Accepted"}, nil
}

func (s *Server) CreateClan(ctx context.Context, req *citypb.CreateClanRequest) (*citypb.CreateClanResponse, error) {
	var currentGold int64
	var currentClanID *int32
	s.db.QueryRow(ctx, `SELECT gold, clan_id FROM "character" WHERE id = $1`, req.CharacterId).Scan(&currentGold, &currentClanID)

	if currentClanID != nil {
		return &citypb.CreateClanResponse{Success: false, Message: "You are already in a clan"}, nil
	}
	if currentGold < 1000 {
		return &citypb.CreateClanResponse{Success: false, Message: "Not enough gold (1000 required)"}, nil
	}

	tx, err := s.db.Begin(ctx)
	if err != nil {
		return &citypb.CreateClanResponse{Success: false, Message: "DB error"}, nil
	}
	defer tx.Rollback(ctx)

	var clanID int32
	err = tx.QueryRow(ctx, `INSERT INTO clans (name, leader_id) VALUES ($1, $2) RETURNING id`, req.ClanName, req.CharacterId).Scan(&clanID)
	if err != nil {
		return &citypb.CreateClanResponse{Success: false, Message: "Clan name already taken"}, nil
	}

	tx.Exec(ctx, `UPDATE "character" SET gold = gold - 1000, clan_id = $1 WHERE id = $2`, clanID, req.CharacterId)
	
	if err := tx.Commit(ctx); err != nil {
		return &citypb.CreateClanResponse{Success: false, Message: "Commit failed"}, nil
	}

	return &citypb.CreateClanResponse{Success: true, Message: "Clan created"}, nil
}

func (s *Server) JoinClan(ctx context.Context, req *citypb.JoinClanRequest) (*citypb.JoinClanResponse, error) {
	var currentClanID *int32
	s.db.QueryRow(ctx, `SELECT clan_id FROM "character" WHERE id = $1`, req.CharacterId).Scan(&currentClanID)

	if currentClanID != nil {
		return &citypb.JoinClanResponse{Success: false, Message: "You are already in a clan"}, nil
	}

	_, err := s.db.Exec(ctx, `UPDATE "character" SET clan_id = $1 WHERE id = $2`, req.ClanId, req.CharacterId)
	if err != nil {
		return &citypb.JoinClanResponse{Success: false, Message: "Clan not found"}, nil
	}

	return &citypb.JoinClanResponse{Success: true, Message: "Clan joined"}, nil
}

func (s *Server) GetClanInfo(ctx context.Context, req *citypb.GetClanInfoRequest) (*citypb.GetClanInfoResponse, error) {
	var name, leaderName string
	var bankGold int64
	var activeBuff string
	var buffExpires int64

	err := s.db.QueryRow(ctx, `
		SELECT c.name, l.name, c.bank_gold, COALESCE(c.active_buff, ''), COALESCE(c.buff_expires_at, 0)
		FROM clans c 
		JOIN "character" l ON l.id = c.leader_id 
		WHERE c.id = $1`, req.ClanId).Scan(&name, &leaderName, &bankGold, &activeBuff, &buffExpires)

	if err != nil {
		return &citypb.GetClanInfoResponse{Success: false}, nil
	}

	rows, _ := s.db.Query(ctx, `SELECT id, name, level FROM "character" WHERE clan_id = $1`, req.ClanId)
	defer rows.Close()

	var members []*citypb.FriendEntry
	for rows.Next() {
		m := &citypb.FriendEntry{Status: "member"}
		rows.Scan(&m.CharacterId, &m.Name, &m.Level)
		members = append(members, m)
	}

	return &citypb.GetClanInfoResponse{
		Success: true, Name: name, LeaderName: leaderName, 
		BankGold: bankGold, ActiveBuff: activeBuff, BuffExpiresAt: buffExpires,
		Members: members,
	}, nil
}

func (s *Server) SearchClan(ctx context.Context, req *citypb.SearchClanRequest) (*citypb.SearchClanResponse, error) {
	var clanID int32
	var name, leaderName string
	var memberCount int32
	var totalLevels int64

	err := s.db.QueryRow(ctx, `
		SELECT c.id, c.name, l.name,
		       (SELECT COUNT(*) FROM "character" WHERE clan_id = c.id),
		       (SELECT COALESCE(SUM(level), 0) FROM "character" WHERE clan_id = c.id)
		FROM clans c
		JOIN "character" l ON l.id = c.leader_id
		WHERE LOWER(c.name) = LOWER($1)`, req.Name).Scan(&clanID, &name, &leaderName, &memberCount, &totalLevels)

	if err != nil {
		return &citypb.SearchClanResponse{Success: false}, nil
	}

	return &citypb.SearchClanResponse{
		Success: true, ClanId: clanID, Name: name, LeaderName: leaderName,
		MemberCount: memberCount, TotalLevels: totalLevels,
	}, nil
}

func (s *Server) GetClanLeaderboard(ctx context.Context, req *citypb.GetClanLeaderboardRequest) (*citypb.GetClanLeaderboardResponse, error) {
	rows, err := s.db.Query(ctx, `
		SELECT c.id, c.name,
		       COUNT(ch.id) as member_count,
		       COALESCE(SUM(ch.level), 0) as total_levels
		FROM clans c
		LEFT JOIN "character" ch ON ch.clan_id = c.id
		GROUP BY c.id, c.name
		ORDER BY total_levels DESC, member_count DESC
		LIMIT 20`)

	if err != nil {
		return &citypb.GetClanLeaderboardResponse{Success: false}, nil
	}
	defer rows.Close()

	var clans []*citypb.ClanEntry
	for rows.Next() {
		c := &citypb.ClanEntry{}
		rows.Scan(&c.ClanId, &c.Name, &c.MemberCount, &c.TotalLevels)
		clans = append(clans, c)
	}

	return &citypb.GetClanLeaderboardResponse{Success: true, Clans: clans}, nil
}

func (s *Server) CreateCoopGroup(ctx context.Context, req *citypb.CreateCoopGroupRequest) (*citypb.CreateCoopGroupResponse, error) {
	tx, err := s.db.Begin(ctx)
	if err != nil {
		return &citypb.CreateCoopGroupResponse{Success: false, Message: "DB error"}, nil
	}
	defer tx.Rollback(ctx)

	var currentGroup *int32
	tx.QueryRow(ctx, `SELECT coop_group_id FROM "character" WHERE id = $1`, req.CharacterId).Scan(&currentGroup)
	if currentGroup != nil {
		return &citypb.CreateCoopGroupResponse{Success: false, Message: "You are already in a group"}, nil
	}

	var groupID int32
	err = tx.QueryRow(ctx, `INSERT INTO coop_groups (leader_id) VALUES ($1) RETURNING id`, req.CharacterId).Scan(&groupID)
	if err != nil {
		return &citypb.CreateCoopGroupResponse{Success: false, Message: "Failed to create group"}, nil
	}

	_, err = tx.Exec(ctx, `UPDATE "character" SET coop_group_id = $1 WHERE id = $2`, groupID, req.CharacterId)
	if err != nil {
		return &citypb.CreateCoopGroupResponse{Success: false, Message: "Failed to join group"}, nil
	}

	tx.Commit(ctx)
	return &citypb.CreateCoopGroupResponse{Success: true, Message: "Group created", GroupId: groupID}, nil
}

func (s *Server) JoinCoopGroup(ctx context.Context, req *citypb.JoinCoopGroupRequest) (*citypb.JoinCoopGroupResponse, error) {
	var groupID int32
	err := s.db.QueryRow(ctx, `SELECT coop_group_id FROM "character" WHERE id = $1`, req.LeaderId).Scan(&groupID)
	if err != nil || groupID == 0 {
		return &citypb.JoinCoopGroupResponse{Success: false, Message: "Leader is not in a group"}, nil
	}

	_, err = s.db.Exec(ctx, `UPDATE "character" SET coop_group_id = $1 WHERE id = $2`, groupID, req.CharacterId)
	if err != nil {
		return &citypb.JoinCoopGroupResponse{Success: false, Message: "Failed to join"}, nil
	}

	return &citypb.JoinCoopGroupResponse{Success: true, Message: "Joined group"}, nil
}

func (s *Server) LeaveCoopGroup(ctx context.Context, req *citypb.LeaveCoopGroupRequest) (*citypb.LeaveCoopGroupResponse, error) {
	var groupID *int32
	s.db.QueryRow(ctx, `SELECT coop_group_id FROM "character" WHERE id = $1`, req.CharacterId).Scan(&groupID)

	if groupID != nil {
		var leaderID int32
		s.db.QueryRow(ctx, `SELECT leader_id FROM coop_groups WHERE id = $1`, *groupID).Scan(&leaderID)

		if leaderID == req.CharacterId {
			s.db.Exec(ctx, `UPDATE "character" SET coop_group_id = NULL WHERE coop_group_id = $1`, *groupID)
			s.db.Exec(ctx, `DELETE FROM coop_groups WHERE id = $1`, *groupID)
		} else {
			s.db.Exec(ctx, `UPDATE "character" SET coop_group_id = NULL WHERE id = $1`, req.CharacterId)
		}
	}

	return &citypb.LeaveCoopGroupResponse{Success: true, Message: "Left group"}, nil
}

func (s *Server) GetCoopGroup(ctx context.Context, req *citypb.GetCoopGroupRequest) (*citypb.GetCoopGroupResponse, error) {
	var groupID *int32
	err := s.db.QueryRow(ctx, `SELECT coop_group_id FROM "character" WHERE id = $1`, req.CharacterId).Scan(&groupID)
	if err != nil || groupID == nil {
		return &citypb.GetCoopGroupResponse{Success: true, InGroup: false}, nil
	}

	var leaderID int32
	s.db.QueryRow(ctx, `SELECT leader_id FROM coop_groups WHERE id = $1`, *groupID).Scan(&leaderID)

	rows, _ := s.db.Query(ctx, `SELECT id, name, level, is_ready FROM "character" WHERE coop_group_id = $1`, *groupID)
	defer rows.Close()

	var members []*citypb.CoopMember
	for rows.Next() {
		m := &citypb.CoopMember{}
		rows.Scan(&m.CharacterId, &m.Name, &m.Level, &m.IsReady)
		members = append(members, m)
	}

	return &citypb.GetCoopGroupResponse{
		Success:  true,
		InGroup:  true,
		GroupId:  *groupID,
		LeaderId: leaderID,
		Members:  members,
	}, nil
}

func (s *Server) SetReady(ctx context.Context, req *citypb.SetReadyRequest) (*citypb.SetReadyResponse, error) {
	_, err := s.db.Exec(ctx, `UPDATE "character" SET is_ready = $1 WHERE id = $2`, req.IsReady, req.CharacterId)
	if err != nil {
		return &citypb.SetReadyResponse{Success: false, Message: "DB error"}, nil
	}
	return &citypb.SetReadyResponse{Success: true, Message: "Status updated"}, nil
}

func (s *Server) DepositClanGold(ctx context.Context, req *citypb.DepositClanGoldRequest) (*citypb.DepositClanGoldResponse, error) {
	if req.Amount <= 0 {
		return &citypb.DepositClanGoldResponse{Success: false, Message: "Invalid amount"}, nil
	}

	tx, err := s.db.Begin(ctx)
	if err != nil {
		return &citypb.DepositClanGoldResponse{Success: false, Message: "DB error"}, nil
	}
	defer tx.Rollback(ctx)

	var playerGold int64
	var clanID *int32
	err = tx.QueryRow(ctx, `SELECT gold, clan_id FROM "character" WHERE id = $1`, req.CharacterId).Scan(&playerGold, &clanID)
	if err != nil || clanID == nil {
		return &citypb.DepositClanGoldResponse{Success: false, Message: "You are not in a clan"}, nil
	}

	if playerGold < req.Amount {
		return &citypb.DepositClanGoldResponse{Success: false, Message: "Not enough gold"}, nil
	}

	_, err = tx.Exec(ctx, `UPDATE "character" SET gold = gold - $1 WHERE id = $2`, req.Amount, req.CharacterId)
	if err != nil {
		return &citypb.DepositClanGoldResponse{Success: false, Message: "Failed to deduct gold"}, nil
	}

	_, err = tx.Exec(ctx, `UPDATE clans SET bank_gold = bank_gold + $1 WHERE id = $2`, req.Amount, *clanID)
	if err != nil {
		return &citypb.DepositClanGoldResponse{Success: false, Message: "Failed to add to bank"}, nil
	}

	tx.Commit(ctx)
	tx.Exec(ctx, `UPDATE "character" SET total_clan_deposits = total_clan_deposits + $1 WHERE id = $2`, req.Amount, req.CharacterId)
	return &citypb.DepositClanGoldResponse{Success: true, Message: "Gold deposited"}, nil
}

func (s *Server) BuyClanBuff(ctx context.Context, req *citypb.BuyClanBuffRequest) (*citypb.BuyClanBuffResponse, error) {
	var clanID *int32
	s.db.QueryRow(ctx, `SELECT clan_id FROM "character" WHERE id = $1`, req.CharacterId).Scan(&clanID)
	if clanID == nil {
		return &citypb.BuyClanBuffResponse{Success: false, Message: "You are not in a clan"}, nil
	}

	var cost int64 = 10000
	var buffName string = "exp_boost"
	var expires int64 = 0
	
	switch req.BuffCode {
	case "exp_boost":
		cost = 10000
		buffName = "exp_boost"
		expires = time.Now().Unix() + 86400
	case "gold_boost":
		cost = 15000 
		buffName = "gold_boost"
		expires = time.Now().Unix() + 86400
	default:
		return &citypb.BuyClanBuffResponse{Success: false, Message: "Unknown buff"}, nil
	}

	tx, err := s.db.Begin(ctx)
	if err != nil {
		return &citypb.BuyClanBuffResponse{Success: false, Message: "DB error"}, nil
	}
	defer tx.Rollback(ctx)

	var bankGold int64
	err = tx.QueryRow(ctx, `SELECT bank_gold FROM clans WHERE id = $1 FOR UPDATE`, *clanID).Scan(&bankGold)
	if err != nil || bankGold < cost {
		return &citypb.BuyClanBuffResponse{Success: false, Message: "Not enough gold in clan bank"}, nil
	}

	_, err = tx.Exec(ctx, `
		UPDATE clans 
		SET bank_gold = bank_gold - $1, active_buff = $2, buff_expires_at = $3 
		WHERE id = $4`,
		cost, buffName, expires, *clanID)
	if err != nil {
		return &citypb.BuyClanBuffResponse{Success: false, Message: "DB error"}, nil
	}

	tx.Commit(ctx)
	return &citypb.BuyClanBuffResponse{Success: true, Message: "Buff activated"}, nil
}

func (s *Server) GetPlayerProfile(ctx context.Context, req *citypb.GetPlayerProfileRequest) (*citypb.GetPlayerProfileResponse, error) {
	var id, level, str, dex, intel, luck int32
	var name, classType string
	var clanID *int32
	var clanName *string

	err := s.db.QueryRow(ctx, `
		SELECT c.id, c.name, c.level, c.class_type, c.clan_id, cl.name,
		       c.strength, c.dexterity, c.intelligence, c.luck
		FROM "character" c
		LEFT JOIN clans cl ON cl.id = c.clan_id
		WHERE c.id = $1`, req.CharacterId).Scan(
		&id, &name, &level, &classType, &clanID, &clanName,
		&str, &dex, &intel, &luck,
	)

	if err != nil {
		return &citypb.GetPlayerProfileResponse{Success: false}, nil
	}

	var cID int32 = 0
	var cName string = "No"
	if clanID != nil { cID = *clanID }
	if clanName != nil { cName = *clanName }

	rows, _ := s.db.Query(ctx, `
		SELECT i.slot, i.name, i.attack, i.defense, i.luck
		FROM character_item ci
		JOIN item i ON i.code = ci.item_code
		WHERE ci.character_id = $1 AND ci.equipped = true`, req.CharacterId)
	defer rows.Close()

	var items []*citypb.PlayerEquipItem
	if rows != nil {
		for rows.Next() {
			item := &citypb.PlayerEquipItem{}
			rows.Scan(&item.Slot, &item.Name, &item.Attack, &item.Defense, &item.Luck)
			items = append(items, item)
		}
	}

	return &citypb.GetPlayerProfileResponse{
		Success: true, 
		CharacterId: id, 
		Name: name, 
		Level: level, 
		ClassType: classType, 
		ClanId: cID, 
		ClanName: cName,
		Strength: str,
		Dexterity: dex,
		Intelligence: intel,
		Luck: luck,
		EquippedItems: items,
	}, nil
}

func (s *Server) FindRaidTarget(ctx context.Context, req *citypb.FindRaidTargetRequest) (*citypb.FindRaidTargetResponse, error) {
	var myLevel int
	var myCityID int
	s.db.QueryRow(ctx, `SELECT c.level, city.id FROM "character" c JOIN city ON city.character_id = c.id WHERE c.id = $1`, req.CharacterId).Scan(&myLevel, &myCityID)

	myZone := myLevel / 10

	query := `
		SELECT c.id, c.name, c.level, COALESCE(cu.level, 0) as wall_lvl, c.gold
		FROM "character" c
		LEFT JOIN city ON city.character_id = c.id
		LEFT JOIN city_upgrade cu ON cu.city_id = city.id AND cu.upgrade_code = 'wall'
		WHERE c.id != $1 AND (c.level / 10) = $2
		ORDER BY RANDOM()
		LIMIT 1`

	var targetID, targetLevel, targetWall int32
	var targetName string
	var targetGold int64

	err := s.db.QueryRow(ctx, query, req.CharacterId, myZone).Scan(&targetID, &targetName, &targetLevel, &targetWall, &targetGold)
	if err != nil {
		return &citypb.FindRaidTargetResponse{Success: false}, nil
	}

	return &citypb.FindRaidTargetResponse{
		Success: true, TargetId: targetID, TargetName: targetName, TargetLevel: targetLevel, TargetWallLevel: targetWall, TargetGold: targetGold,
	}, nil
}

func (s *Server) AttackPlayer(ctx context.Context, req *citypb.AttackPlayerRequest) (*citypb.AttackPlayerResponse, error) {
	var myWall, enemyWall int32
	s.db.QueryRow(ctx, `
		SELECT COALESCE(cu.level, 0) FROM city_upgrade cu 
		JOIN city ON city.id = cu.city_id 
		WHERE city.character_id = $1 AND cu.upgrade_code = 'wall'`, req.CharacterId).Scan(&myWall)
	
	s.db.QueryRow(ctx, `
		SELECT COALESCE(cu.level, 0) FROM city_upgrade cu 
		JOIN city ON city.id = cu.city_id 
		WHERE city.character_id = $1 AND cu.upgrade_code = 'wall'`, req.TargetId).Scan(&enemyWall)

	victory := myWall > enemyWall
	
	if myWall == enemyWall {
		victory = rand.Intn(100) < 50
	}

	var goldStolen int64 = 0
	message := "Lose"

	if victory {
		var targetGold int64
		s.db.QueryRow(ctx, `SELECT gold FROM "character" WHERE id = $1`, req.TargetId).Scan(&targetGold)
		
		goldStolen = targetGold / 10
		if goldStolen > 1000 { goldStolen = 1000 }

		if goldStolen > 0 {
			tx, _ := s.db.Begin(ctx)
			defer tx.Rollback(ctx)
			tx.Exec(ctx, `UPDATE "character" SET gold = gold - $1 WHERE id = $2`, goldStolen, req.TargetId)
			tx.Exec(ctx, `UPDATE "character" SET gold = gold + $1 WHERE id = $2`, goldStolen, req.CharacterId)
			tx.Commit(ctx)
		}
		
		s.db.Exec(ctx, `UPDATE "character" SET total_pvp_wins = total_pvp_wins + 1 WHERE id = $1`, req.CharacterId)
		
		game.CheckAchievements(ctx, s.db, req.CharacterId)
		
		message = "Win"
	} else {
		var myGold int64
		s.db.QueryRow(ctx, `SELECT gold FROM "character" WHERE id = $1`, req.CharacterId).Scan(&myGold)
		goldStolen = myGold / 20 
		s.db.Exec(ctx, `UPDATE "character" SET gold = gold - $1 WHERE id = $2`, goldStolen, req.CharacterId)
		message = "Lose"
	}

	return &citypb.AttackPlayerResponse{
		Success: true, Message: message, Victory: victory, GoldStolen: goldStolen, MyWallLevel: myWall, EnemyWallLevel: enemyWall,
	}, nil
}

func (s *Server) GetAchievements(ctx context.Context, req *citypb.GetAchievementsRequest) (*citypb.GetAchievementsResponse, error) {
	rows, _ := s.db.Query(ctx, `
		SELECT a.code, a.name, a.description, a.tier, COALESCE(ca.is_completed, false)
		FROM achievements a
		LEFT JOIN character_achievements ca ON ca.achievement_id = a.id AND ca.character_id = $1
		ORDER BY a.tier, a.id`, req.CharacterId)
	defer rows.Close()

	var list []*citypb.AchievementEntry
	for rows.Next() {
		a := &citypb.AchievementEntry{}
		rows.Scan(&a.Code, &a.Name, &a.Description, &a.Tier, &a.IsCompleted)
		list = append(list, a)
	}
	return &citypb.GetAchievementsResponse{Success: true, Achievements: list}, nil
}

func (s *Server) CheatGiveAll(ctx context.Context, req *citypb.CheatGiveAllRequest) (*citypb.CheatGiveAllResponse, error) {
	if req.CharacterId == 0 {
		return &citypb.CheatGiveAllResponse{Success: false, Message: "Invalid ID"}, nil
	}

	tx, err := s.db.Begin(ctx)
	if err != nil {
		return &citypb.CheatGiveAllResponse{Success: false, Message: "DB error"}, nil
	}
	defer tx.Rollback(ctx)

	var cityID int32
	tx.QueryRow(ctx, `SELECT id FROM city WHERE character_id = $1`, req.CharacterId).Scan(&cityID)

	_, err = tx.Exec(ctx, `UPDATE "character" SET level = $1, gold = gold + $2, talentpoint = talentpoint + 100 WHERE id = $3`, req.Level, req.Gold, req.CharacterId)
	if err != nil {
		return &citypb.CheatGiveAllResponse{Success: false, Message: "Failed to update character"}, nil
	}

	rows, _ := tx.Query(ctx, `SELECT code FROM item WHERE slot = 'material'`)
	var materials []string
	for rows.Next() {
		var code string
		rows.Scan(&code)
		materials = append(materials, code)
	}
	rows.Close()

	for _, mat := range materials {
		tx.Exec(ctx, `INSERT INTO city_resource (city_id, resource_type, amount) 
			VALUES ($1, $2, 10000) 
			ON CONFLICT (city_id, resource_type) DO UPDATE SET amount = 10000`, cityID, mat)
	}

	itemRows, _ := tx.Query(ctx, `SELECT code FROM item WHERE slot != 'material'`)
	var items []string
	for itemRows.Next() {
		var code string
		itemRows.Scan(&code)
		items = append(items, code)
	}
	itemRows.Close()

	for _, itemCode := range items {
		tx.Exec(ctx, `INSERT INTO character_item (character_id, item_code, equipped) VALUES ($1, $2, false)`, req.CharacterId, itemCode)
	}

	tx.Exec(ctx, `
		INSERT INTO city_upgrade (city_id, upgrade_code, level) 
		VALUES ($1, 'gold_mine', 10), ($1, 'library', 10), ($1, 'warehouse', 10), ($1, 'barracks', 10), ($1, 'wall', 10)
		ON CONFLICT (city_id, upgrade_code) DO UPDATE SET level = 10`, cityID)

	tx.Commit(ctx)

	return &citypb.CheatGiveAllResponse{Success: true, Message: "Cheats! Level: " + fmt.Sprintf("%d", req.Level)}, nil
}
