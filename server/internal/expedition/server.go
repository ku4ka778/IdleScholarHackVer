package expedition

import (
	"context"
	"encoding/json"
	"fmt"
	"log"
	"math"
	"math/rand"
	"time"

	"github.com/jackc/pgx/v5/pgxpool"
	expeditionpb "IdleScholar_BD/gen/expedition"
	"IdleScholar_BD/internal/game"
)

type Server struct {
	expeditionpb.UnimplementedExpeditionServiceServer
	db *pgxpool.Pool
}

func NewServer(db *pgxpool.Pool) *Server {
	return &Server{db: db}
}

func (s *Server) StartExpedition(ctx context.Context, req *expeditionpb.StartExpeditionRequest) (*expeditionpb.StartExpeditionResponse, error) {
	if req.CharacterId == 0 || req.DurationMinutes <= 0 {
		return &expeditionpb.StartExpeditionResponse{Success: false, Message: "Invalid request"}, nil
	}

	var currentEnd int64
	var baseStr, baseDex, baseInt, baseLuck, playerLevel int
	var itemAtk, itemDef, itemLuck int
	var coopGroupID *int32

	err := s.db.QueryRow(ctx, `SELECT expeditionend, strength, dexterity, intelligence, luck, level FROM "character" WHERE id = $1`, req.CharacterId).Scan(
		&currentEnd, &baseStr, &baseDex, &baseInt, &baseLuck, &playerLevel,
	)
	if err != nil {
		return &expeditionpb.StartExpeditionResponse{Success: false, Message: "Character not found"}, nil
	}

	requiredLevel := int(req.ActivityLevel) * 10
	if playerLevel < requiredLevel {
		return &expeditionpb.StartExpeditionResponse{
			Success: false,
			Message: fmt.Sprintf("Requires level %d to enter this location", requiredLevel),
		}, nil
	}

	s.db.QueryRow(ctx, `SELECT coop_group_id FROM "character" WHERE id = $1`, req.CharacterId).Scan(&coopGroupID)

	if coopGroupID != nil {
		var leaderID int32
		s.db.QueryRow(ctx, `SELECT leader_id FROM coop_groups WHERE id = $1`, *coopGroupID).Scan(&leaderID)

		if leaderID == req.CharacterId {
			var minLevel int
			s.db.QueryRow(ctx, `SELECT COALESCE(MIN(level), 1) FROM "character" WHERE coop_group_id = $1`, *coopGroupID).Scan(&minLevel)

			if minLevel < requiredLevel {
				return &expeditionpb.StartExpeditionResponse{
					Success: false,
					Message: fmt.Sprintf("Самый слабый участник группы (Ур. %d) не подходит для этой локации (Нужен Ур. %d)", minLevel, requiredLevel),
				}, nil
			}
		}
	}

	_ = s.db.QueryRow(ctx, `
		SELECT COALESCE(SUM(i.attack), 0), COALESCE(SUM(i.luck), 0), COALESCE(SUM(i.defense), 0)
		FROM character_item ci
		JOIN item i ON i.code = ci.item_code
		WHERE ci.character_id = $1 AND ci.equipped = true`, req.CharacterId,
	).Scan(&itemAtk, &itemLuck, &itemDef)

	var talentsRaw []byte
	s.db.QueryRow(ctx, `SELECT talents FROM "character" WHERE id = $1`, req.CharacterId).Scan(&talentsRaw)
	talentsMap := make(map[string]int32)
	if len(talentsRaw) > 0 {
		json.Unmarshal(talentsRaw, &talentsMap)
	}
	bonuses := game.CalculateTalents(talentsMap)

	now := time.Now().Unix()
	if currentEnd > now {
		return &expeditionpb.StartExpeditionResponse{Success: false, Message: "Expedition already in progress"}, nil
	}

	strBonusAtk := baseStr / 5
	totalAtk := itemAtk + strBonusAtk + bonuses.PassiveStrength/5 + bonuses.PassiveDexterity/2
	totalLuck := baseLuck + itemLuck + bonuses.PassiveLuck
	totalDef := itemDef + bonuses.PassiveStrength/2

	dexCycleReduction := baseDex/10 + int(bonuses.CycleSpeedBonus)
	if dexCycleReduction > 30 {
		dexCycleReduction = 30
	}

	intExpBonusPct := ((baseInt + bonuses.PassiveIntelligence) / 5) * 2

	goldBonusPct := int32(math.Sqrt(float64(totalAtk)) * 2)
	luckBonusPct := int32(math.Sqrt(float64(totalLuck)) * 2)
	penaltyRedPct := int32((float64(totalDef) / (float64(totalDef) + 100.0)) * 100)

	durationSeconds := int64(req.DurationMinutes * 60)
	newEnd := now + durationSeconds

	domainsJSON, _ := json.Marshal(req.AllowedDomains)
	appsJSON, _ := json.Marshal(req.AllowedApps)

	_, err = s.db.Exec(ctx,
		`UPDATE "character" SET
			expeditionstart = $1, expeditionend = $2, last_heartbeat = $1,
			last_processed_time = $1,
			activity_type = $3, activity_level = $4,
			allowed_domains = $5, allowed_apps = $6
		WHERE id = $7`,
		now, newEnd, req.ActivityType, req.ActivityLevel, domainsJSON, appsJSON, req.CharacterId,
	)
	if err != nil {
		log.Printf("StartExpedition DB error: %v", err)
		return &expeditionpb.StartExpeditionResponse{Success: false, Message: "DB error"}, nil
	}

	if coopGroupID != nil {
		var leaderID int32
		s.db.QueryRow(ctx, `SELECT leader_id FROM coop_groups WHERE id = $1`, *coopGroupID).Scan(&leaderID)
		if leaderID == req.CharacterId {
			s.db.Exec(ctx, `
				UPDATE "character"
				SET expeditionstart = $1, expeditionend = $2, last_processed_time = $1,
				    last_heartbeat = $1, activity_type = $3, activity_level = $4
				WHERE coop_group_id = $5 AND id != $6`,
				now, newEnd, req.ActivityType, req.ActivityLevel, *coopGroupID, req.CharacterId)
			log.Printf("COOP: Leader %d started expedition for group %d", req.CharacterId, *coopGroupID)
		}
	}

	return &expeditionpb.StartExpeditionResponse{
		Success:             true,
		Message:             "Expedition started",
		ExpeditionEndUnix:   newEnd,
		TotalGoldBonusPct:   goldBonusPct,
		TotalLuckBonusPct:   luckBonusPct,
		PenaltyReductionPct: penaltyRedPct,
		StrBonusAtk:         int32(strBonusAtk),
		DexCycleReduction:   int32(dexCycleReduction),
		IntExpBonusPct:      int32(intExpBonusPct),
	}, nil
}

func (s *Server) StopExpedition(ctx context.Context, req *expeditionpb.StopExpeditionRequest) (*expeditionpb.StopExpeditionResponse, error) {
	if req.CharacterId == 0 {
		return &expeditionpb.StopExpeditionResponse{Success: false, Message: "Invalid request"}, nil
	}

	var start, end int64
	var stacks int
	err := s.db.QueryRow(ctx, `SELECT expeditionstart, expeditionend, penalty_stacks FROM "character" WHERE id = $1`, req.CharacterId).Scan(&start, &end, &stacks)

	now := time.Now().Unix()
	penaltyApplied := false

	if err == nil && end > now && (now-start) >= 60 {
		newStacks := stacks + 1
		newExpires := newStacks
		if newExpires > 5 {
			newExpires = 5
		}

		_, err = s.db.Exec(ctx, `
			UPDATE "character"
			SET expeditionstart = 0, expeditionend = 0, last_processed_time = $1,
			    penalty_stacks = $2, penalty_expires = $3,
				active_food_code = NULL, active_food_gold_pct = 0, active_food_exp_pct = 0, active_food_luck_pct = 0
			WHERE id = $4`,
			now, newStacks, newExpires, req.CharacterId,
		)
		penaltyApplied = true
		log.Printf("PENALTY: Character %d stopped early. Stacks: %d, Expires: %d", req.CharacterId, newStacks, newExpires)
	} else {
		_, err = s.db.Exec(ctx, `
			UPDATE "character"
			SET expeditionstart = 0, expeditionend = 0, last_processed_time = $1,
		 	active_food_code = NULL, active_food_gold_pct = 0, active_food_exp_pct = 0, active_food_luck_pct = 0
			WHERE id = $2`,
			now, req.CharacterId,
		)
	}

	if err != nil {
		return &expeditionpb.StopExpeditionResponse{Success: false, Message: "DB error"}, nil
	}

	_, _, _, _, _ = s.processTick(ctx, req.CharacterId)

	game.CheckAchievements(ctx, s.db, req.CharacterId)

	return &expeditionpb.StopExpeditionResponse{
		Success:        true,
		Message:        "Expedition stopped",
		PenaltyApplied: penaltyApplied,
	}, nil
}

func (s *Server) FinishExpedition(ctx context.Context, req *expeditionpb.FinishExpeditionRequest) (*expeditionpb.FinishExpeditionResponse, error) {
	gold, exp, items, newLevel, err := s.processTick(ctx, req.CharacterId)
	if err != nil {
		return &expeditionpb.FinishExpeditionResponse{Success: false, Message: "Error processing rewards"}, nil
	}

	var start, end int64
	var actType, actLevel int
	err = s.db.QueryRow(ctx, `SELECT expeditionstart, expeditionend, activity_type, activity_level FROM "character" WHERE id = $1`, req.CharacterId).Scan(&start, &end, &actType, &actLevel)

	now := time.Now().Unix()

	if err == nil && end > 0 && now >= end && (end-start) >= 600 {
		_, _ = s.db.Exec(ctx, `
			UPDATE "character"
			SET penalty_expires = GREATEST(penalty_expires - 1, 0)
			WHERE id = $1`, req.CharacterId)

		_, _ = s.db.Exec(ctx, `
			UPDATE "character"
			SET penalty_stacks = CASE WHEN penalty_expires <= 0 THEN 0 ELSE penalty_stacks END
			WHERE id = $1`, req.CharacterId)
	}

	var talentsRaw []byte
	s.db.QueryRow(ctx, `SELECT talents FROM "character" WHERE id = $1`, req.CharacterId).Scan(&talentsRaw)
	talentsMap := make(map[string]int32)
	if len(talentsRaw) > 0 {
		json.Unmarshal(talentsRaw, &talentsMap)
	}
	bonuses := game.CalculateTalents(talentsMap)

	if bonuses.DoubleGoldChance > 0 && rand.Float64() < bonuses.DoubleGoldChance {
		log.Printf("DOUBLE GOLD: Character %d doubled gold (%d -> %d)", req.CharacterId, gold, gold*2)
		gold *= 2
	}

	echoTriggered := false
	echoDefeated := false
	var echoGoldLoss, echoExpLoss int64

	if actType == 0 && actLevel == 1 {
		echoTriggered = rand.Intn(100) < 20

		if echoTriggered {
			var echoLostItems []string
			echoGoldLoss, echoExpLoss, echoLostItems = s.processEcho(ctx, req.CharacterId, gold, exp, items, bonuses.EchoSaveChance)

			if echoGoldLoss > 0 || echoExpLoss > 0 || len(echoLostItems) > 0 {
				gold -= echoGoldLoss
				exp -= echoExpLoss

				for _, itemCode := range echoLostItems {
					res, _ := s.db.Exec(ctx, `DELETE FROM character_item WHERE id = (SELECT id FROM character_item WHERE character_id = $1 AND item_code = $2 LIMIT 1)`, req.CharacterId, itemCode)
					if res.RowsAffected() == 0 {
						s.db.Exec(ctx, `UPDATE city_resource SET amount = GREATEST(amount - 1, 0) WHERE city_id = (SELECT id FROM city WHERE character_id = $1) AND resource_type = $2`, req.CharacterId, itemCode)
					}
				}
				echoDefeated = false
			} else {
				echoDefeated = true
				s.db.Exec(ctx, `UPDATE "character" SET total_echo_wins = total_echo_wins + 1 WHERE id = $1`, req.CharacterId)
			}
		}
	}

	blizzardTriggered := false
	var blizzardGoldLoss, blizzardResLoss int64

	var activeFood string
	s.db.QueryRow(ctx, `SELECT COALESCE(active_food_code, '') FROM "character" WHERE id = $1`, req.CharacterId).Scan(&activeFood)

	if actType == 0 && actLevel == 2 && activeFood == "" {
		if rand.Intn(100) < 15 {
			blizzardTriggered = true
			blizzardGoldLoss = gold * 30 / 100
			gold -= blizzardGoldLoss

			s.db.Exec(ctx, `
				UPDATE city_resource
				SET amount = amount - (amount * 30 / 100)
				WHERE city_id = (SELECT id FROM city WHERE character_id = $1)
				AND resource_type IN ('frost_ore', 'ice_crystal', 'snow_leather', 'frozen_wood')`,
				req.CharacterId)

			log.Printf("BLIZZARD: Character %d lost %d Gold and 30%% of resources!", req.CharacterId, blizzardGoldLoss)
			
			s.db.Exec(ctx, `UPDATE "character" SET total_blizzards_survived = total_blizzards_survived + 1 WHERE id = $1`, req.CharacterId)
		}
	}
	resonanceTriggered := false
	resonancePositive := false
	var resonanceMultiplier float64 = 1.0

	if actType == 0 && actLevel == 4 {
		if rand.Intn(100) < 20 {
			resonanceTriggered = true

			var playerLuck int
			s.db.QueryRow(ctx, `SELECT luck FROM "character" WHERE id = $1`, req.CharacterId).Scan(&playerLuck)
			successChance := 50 + ((playerLuck + bonuses.PassiveLuck) / 2)
			if successChance > 95 {
				successChance = 95
			}

			if rand.Intn(100) < successChance {
				resonancePositive = true
				resonanceMultiplier = 3.0
				s.db.Exec(ctx, `UPDATE "character" SET total_resonance_pos = total_resonance_pos + 1 WHERE id = $1`, req.CharacterId)
			} else {
				resonancePositive = false
				resonanceMultiplier = 0.5
			}

			gold = int64(float64(gold) * resonanceMultiplier)
			exp = int64(float64(exp) * resonanceMultiplier)

			log.Printf("RESONANCE: Character %d. Positive: %v. Multiplier: %.1f", req.CharacterId, resonancePositive, resonanceMultiplier)
		}
	}

	raidTriggered, raidLost := s.processRaid(ctx, req.CharacterId, bonuses)

	focusMinutes := (end - start) / 60
	if focusMinutes < 0 { focusMinutes = 0 }

	_, err = s.db.Exec(ctx, `
		UPDATE "character" 
		SET expeditionstart = 0, expeditionend = 0, 
		    active_food_code = NULL, active_food_gold_pct = 0, active_food_exp_pct = 0, active_food_luck_pct = 0, 
		    total_expeditions = total_expeditions + 1,
		    total_focus_minutes = total_focus_minutes + $1
		WHERE id = $2`, 
		focusMinutes, req.CharacterId)
	
	if err != nil {
		return &expeditionpb.FinishExpeditionResponse{Success: false, Message: "DB error"}, nil
	}

	achGold, achExp, _ := game.CheckAchievements(ctx, s.db, req.CharacterId)
	gold += achGold
	exp += achExp
	
	return &expeditionpb.FinishExpeditionResponse{
		Success:              true,
		Message:              "Expedition completed",
		GoldGained:           gold,
		ExpGained:            exp,
		ItemsGained:          items,
		NewLevel:             newLevel,
		EchoTriggered:        echoTriggered,
		EchoDefeated:         echoDefeated,
		EchoGoldLost:         echoGoldLoss,
		EchoExpLost:          echoExpLoss,
		BlizzardTriggered:    blizzardTriggered,
		BlizzardGoldLost:     blizzardGoldLoss,
		BlizzardResourceLost: blizzardResLoss,
		RaidTriggered:        raidTriggered,
		RaidResourcesLost:    raidLost,
		ResonanceTriggered:   resonanceTriggered,
		ResonancePositive:    resonancePositive,
	}, nil
}

func (s *Server) GetExpeditionStatus(ctx context.Context, req *expeditionpb.GetExpeditionStatusRequest) (*expeditionpb.GetExpeditionStatusResponse, error) {
	var start, end int64
	var activityType, activityLevel int
	var stacks, expires int

	err := s.db.QueryRow(ctx,
		`SELECT expeditionstart, expeditionend, activity_type, activity_level, penalty_stacks, penalty_expires
		 FROM "character" WHERE id = $1`,
		req.CharacterId,
	).Scan(&start, &end, &activityType, &activityLevel, &stacks, &expires)

	now := time.Now().Unix()

	if err == nil && start == 0 {
		var coopGroupID *int32
		s.db.QueryRow(ctx, `SELECT coop_group_id FROM "character" WHERE id = $1`, req.CharacterId).Scan(&coopGroupID)
		if coopGroupID != nil {
			var lStart, lEnd int64
			var lActType, lActLevel int
			s.db.QueryRow(ctx, `
				SELECT c.expeditionstart, c.expeditionend, c.activity_type, c.activity_level
				FROM "character" c
				JOIN coop_groups g ON g.id = c.coop_group_id
				WHERE c.id = g.leader_id AND c.expeditionend > $1`, now).Scan(&lStart, &lEnd, &lActType, &lActLevel)

			if lEnd > now {
				s.db.Exec(ctx, `UPDATE "character" SET expeditionstart = $1, expeditionend = $2, last_processed_time = $1, activity_type = $3, activity_level = $4 WHERE id = $5`, lStart, lEnd, lActType, lActLevel, req.CharacterId)
				start, end, activityType, activityLevel = lStart, lEnd, lActType, lActLevel
				log.Printf("COOP: Character %d synced with leader's expedition", req.CharacterId)
			}
		}
	}

	if err != nil || start == 0 {
		return &expeditionpb.GetExpeditionStatusResponse{
			Success:        true,
			IsActive:       false,
			PenaltyStacks:  int32(stacks),
			PenaltyExpires: int32(expires),
		}, nil
	}

	if end > now {
		return &expeditionpb.GetExpeditionStatusResponse{
			Success:          true,
			IsActive:         true,
			RemainingSeconds: end - now,
			ActivityType:     int32(activityType),
			ActivityLevel:    int32(activityLevel),
			PenaltyStacks:    int32(stacks),
			PenaltyExpires:   int32(expires),
		}, nil
	}

	finishResp, err := s.FinishExpedition(ctx, &expeditionpb.FinishExpeditionRequest{CharacterId: req.CharacterId})
	if err != nil || !finishResp.Success {
		return &expeditionpb.GetExpeditionStatusResponse{Success: false, IsActive: false}, nil
	}

	_ = s.db.QueryRow(ctx, `SELECT penalty_stacks, penalty_expires FROM "character" WHERE id = $1`, req.CharacterId).Scan(&stacks, &expires)

	return &expeditionpb.GetExpeditionStatusResponse{
		Success:        true,
		IsActive:       false,
		JustFinished:   true,
		GoldGained:     finishResp.GoldGained,
		ExpGained:      finishResp.ExpGained,
		ItemsGained:    finishResp.ItemsGained,
		PenaltyStacks:  int32(stacks),
		PenaltyExpires: int32(expires),
	}, nil
}

func (s *Server) SendHeartbeat(ctx context.Context, req *expeditionpb.HeartbeatRequest) (*expeditionpb.HeartbeatResponse, error) {
	var end, lastHeartbeat int64
	err := s.db.QueryRow(ctx,
		`SELECT expeditionend, last_heartbeat FROM "character" WHERE id = $1`,
		req.CharacterId,
	).Scan(&end, &lastHeartbeat)

	if err != nil {
		return &expeditionpb.HeartbeatResponse{Success: false, IsActive: false, Message: "Character not found"}, nil
	}

	now := time.Now().Unix()

	if end <= now {
		gold, exp, items, newLevel, _ := s.processTick(ctx, req.CharacterId)
		return &expeditionpb.HeartbeatResponse{
			Success:     true,
			IsActive:    false,
			GoldGained:  gold,
			ExpGained:   exp,
			ItemsGained: items,
			NewLevel:    newLevel,
		}, nil
	}

	if now-lastHeartbeat > 60 {
		gold, exp, items, newLevel, _ := s.processTick(ctx, req.CharacterId)

		reducedGold := gold / 2
		reducedExp := exp / 2

		_, err = s.db.Exec(ctx, `
			UPDATE "character"
			SET penalty_stacks = penalty_stacks + 1,
			    penalty_expires = LEAST(penalty_expires + 1, 5)
			WHERE id = $1`, req.CharacterId)
		if err != nil {
			log.Printf("Heartbeat penalty error: %v", err)
		}

		_, err = s.db.Exec(ctx, `UPDATE "character" SET expeditionend = $1, expeditionstart = 0 WHERE id = $2`, now, req.CharacterId)
		if err != nil {
			log.Printf("Heartbeat reset error: %v", err)
		}

		return &expeditionpb.HeartbeatResponse{
			Success:     true,
			IsActive:    false,
			Message:     "FOCUS_LOST",
			GoldGained:  reducedGold,
			ExpGained:   reducedExp,
			ItemsGained: items,
			NewLevel:    newLevel,
		}, nil
	}

	gold, exp, items, newLevel, _ := s.processTick(ctx, req.CharacterId)

	_, err = s.db.Exec(ctx, `UPDATE "character" SET last_heartbeat = $1 WHERE id = $2`, now, req.CharacterId)
	if err != nil {
		log.Printf("Heartbeat update error: %v", err)
		return &expeditionpb.HeartbeatResponse{Success: false, IsActive: true, Message: "DB error"}, nil
	}

	return &expeditionpb.HeartbeatResponse{
		Success:     true,
		IsActive:    true,
		GoldGained:  gold,
		ExpGained:   exp,
		ItemsGained: items,
		NewLevel:    newLevel,
	}, nil
}

func (s *Server) processTick(ctx context.Context, charID int32) (int64, int64, []string, int32, error) {
	var start, end, lastProcessed, lastHb int64
	var actType, actLevel, playerLevel, playerLuck, playerStr, playerDex, playerInt, penaltyStacks, penaltyExpires int
	var playerClass string
	var itemAtk, itemDef, itemLuck int
	var currentExp int64
	var isPaused bool
	var foodG, foodE, foodL int

	err := s.db.QueryRow(ctx, `
		SELECT c.expeditionstart, c.expeditionend, c.last_processed_time, c.last_heartbeat,
		       c.activity_type, c.activity_level, c.level, c.luck, c.class_type,
		       c.strength, c.dexterity, c.intelligence,
		       c.penalty_stacks, c.penalty_expires, c.experience, c.is_paused,
		       COALESCE(SUM(i.attack), 0), COALESCE(SUM(i.defense), 0), COALESCE(SUM(i.luck), 0)
		FROM "character" c
		LEFT JOIN character_item ci ON ci.character_id = c.id AND ci.equipped = true
		LEFT JOIN item i ON i.code = ci.item_code
		WHERE c.id = $1
		GROUP BY c.id`, charID,
	).Scan(&start, &end, &lastProcessed, &lastHb,
		&actType, &actLevel, &playerLevel, &playerLuck, &playerClass,
		&playerStr, &playerDex, &playerInt,
		&penaltyStacks, &penaltyExpires, &currentExp, &isPaused,
		&itemAtk, &itemDef, &itemLuck)

	if err != nil {
		return 0, 0, nil, 0, err
	}

	s.db.QueryRow(ctx, `SELECT COALESCE(active_food_gold_pct, 0), COALESCE(active_food_exp_pct, 0), COALESCE(active_food_luck_pct, 0) FROM "character" WHERE id = $1`, charID).Scan(&foodG, &foodE, &foodL)

	if isPaused {
		return 0, 0, nil, int32(playerLevel), nil
	}

	now := time.Now().Unix()
	if start == 0 || now < lastProcessed {
		return 0, 0, nil, int32(playerLevel), nil
	}

	effectiveTime := now
	if end < now {
		effectiveTime = end
	}

	var talentsRaw []byte
	s.db.QueryRow(ctx, `SELECT talents FROM "character" WHERE id = $1`, charID).Scan(&talentsRaw)
	talentsMap := make(map[string]int32)
	if len(talentsRaw) > 0 {
		json.Unmarshal(talentsRaw, &talentsMap)
	}
	bonuses := game.CalculateTalents(talentsMap)
	dexCycleReduction := playerDex/10 + int(bonuses.CycleSpeedBonus)
	if dexCycleReduction > 30 {
		dexCycleReduction = 30
	}
	cycleSeconds := int64(60 - dexCycleReduction)
	if cycleSeconds < 10 {
		cycleSeconds = 10
	}

	minutesPassed := (effectiveTime - lastProcessed) / cycleSeconds
	if minutesPassed <= 0 {
		return 0, 0, nil, int32(playerLevel), nil
	}

	strBonusAtk := (playerStr + bonuses.PassiveStrength) / 5
	totalAttack := itemAtk + strBonusAtk + bonuses.PassiveDexterity/2
	totalLuck := playerLuck + itemLuck + bonuses.PassiveLuck
	totalDefense := itemDef + bonuses.PassiveStrength/2

	intExpBonusPct := int64(((playerInt + bonuses.PassiveIntelligence) / 5) * 2)

	if actType == 0 && actLevel == 3 {
		var metalCount int
		s.db.QueryRow(ctx, `
			SELECT COUNT(*) FROM character_item ci
			JOIN item i ON i.code = ci.item_code
			WHERE ci.character_id = $1 AND ci.equipped = true
			AND (i.code LIKE '%iron%' OR i.code LIKE '%silver%')`, charID).Scan(&metalCount)

		if metalCount > 0 {
			corrosionReduction := 1.0 - (float64(metalCount) * 0.20)
			if corrosionReduction < 0.3 {
				corrosionReduction = 0.3
			}

			totalAttack = int(float64(totalAttack) * corrosionReduction)
			totalDefense = int(float64(totalDefense) * corrosionReduction)
		}
	}

	penalty := game.ComputePenalty(penaltyStacks, penaltyExpires, totalDefense)

	if bonuses.PenaltyReduction > 0 {
		reduction := bonuses.PenaltyReduction
		if reduction > 0.15 {
			reduction = 0.15
		}
		penalty = penalty * (1.0 - reduction)
	}

	if bonuses.DebuffReduction > 0 {
		reduction := bonuses.DebuffReduction
		if reduction > 0.5 {
			reduction = 0.5
		}
		penalty = penalty * (1.0 - reduction)
	}

	var goldMineLvl, libraryLvl, warehouseLvl, barracksLvl int
	var cityID int
	s.db.QueryRow(ctx, `SELECT id FROM city WHERE character_id = $1`, charID).Scan(&cityID)

	if cityID != 0 {
		s.db.QueryRow(ctx, `SELECT COALESCE(level, 0) FROM city_upgrade WHERE city_id = $1 AND upgrade_code = 'gold_mine'`, cityID).Scan(&goldMineLvl)
		s.db.QueryRow(ctx, `SELECT COALESCE(level, 0) FROM city_upgrade WHERE city_id = $1 AND upgrade_code = 'library'`, cityID).Scan(&libraryLvl)
		s.db.QueryRow(ctx, `SELECT COALESCE(level, 0) FROM city_upgrade WHERE city_id = $1 AND upgrade_code = 'warehouse'`, cityID).Scan(&warehouseLvl)
		s.db.QueryRow(ctx, `SELECT COALESCE(level, 0) FROM city_upgrade WHERE city_id = $1 AND upgrade_code = 'barracks'`, cityID).Scan(&barracksLvl)
	}

	var clanBuff string
	var clanBuffExpires int64
	s.db.QueryRow(ctx, `
		SELECT COALESCE(c.active_buff, ''), COALESCE(c.buff_expires_at, 0)
		FROM "character" ch
		JOIN clans c ON c.id = ch.clan_id
		WHERE ch.id = $1`, charID).Scan(&clanBuff, &clanBuffExpires)

	clanExpBonus := 0.0
	clanGoldBonus := 0.0
	if clanBuffExpires > now {
		if clanBuff == "exp_boost" {
			clanExpBonus = 0.20
		} else if clanBuff == "gold_boost" {
			clanGoldBonus = 0.20
		}
	}

	barracksDiscount := float64(barracksLvl) * 0.01
	if barracksDiscount > 0.5 {
		barracksDiscount = 0.5
	}
	penalty = penalty * (1.0 - barracksDiscount)

	goldMultiplier := 1.0 + float64(goldMineLvl)*0.05
	expMultiplier := 1.0 + float64(libraryLvl)*0.05 + bonuses.ExpMultiplier
	dropMultiplier := 1.0 + float64(warehouseLvl)*0.10
	dropMultiplier += bonuses.LootMultiplier

	var totalGold, totalExp int64
	lootMap := make(map[string]int)

	totalLuck += (totalLuck * foodL) / 100

	for i := int64(1); i <= minutesPassed; i++ {
		cycle := int((lastProcessed - start) / cycleSeconds + i)

		baseGold := game.ComputeGoldPerCycle(cycle, actType, actLevel, playerLevel, totalAttack, penalty)
		goldWithFood := int64(float64(baseGold) * goldMultiplier)
		goldWithFood += (goldWithFood * int64(foodG)) / 100
		goldWithFood += int64(float64(goldWithFood) * clanGoldBonus)
		goldWithFood += int64(float64(goldWithFood) * bonuses.BarracksGoldBonus)
		totalGold += goldWithFood

		baseExp := game.ComputeExpPerCycle(int(goldWithFood), intExpBonusPct)
		expWithFood := int64(float64(baseExp) * expMultiplier)
		expWithFood += (expWithFood * int64(foodE)) / 100
		expWithFood += int64(float64(expWithFood) * clanExpBonus)
		expWithFood += int64(goldMineLvl * 10)

		if bonuses.DoubleExpBonus {
			expWithFood *= 2
		}

		if bonuses.ExpToResources > 0 {
			resGain := int64(float64(expWithFood) * bonuses.ExpToResources)
			if resGain > 0 && cityID != 0 {
				_, _ = s.db.Exec(ctx, `INSERT INTO city_resource (city_id, resource_type, amount) VALUES ($1, 'scholar_scroll', $2)
					ON CONFLICT (city_id, resource_type) DO UPDATE SET amount = city_resource.amount + EXCLUDED.amount`,
					cityID, resGain)
			}
		}

		totalExp += expWithFood

		shortExpBonus := 1.0
		if bonuses.ShortExpLootChance > 0 && (end-start) <= 300 {
			shortExpBonus = 1.0 + bonuses.ShortExpLootChance
		}

				loot := game.RollLoot(game.ActivityType(actType), actLevel, playerClass, totalLuck)
		for _, item := range loot {
			qty := float64(item.Quantity) * dropMultiplier * shortExpBonus

			if bonuses.RareLootChance > 0 && rand.Float64() < bonuses.RareLootChance {
				qty *= 1.5
			}

			if bonuses.DoubleLootChance > 0 && rand.Float64() < bonuses.DoubleLootChance {
				qty *= 2.0
			}

			boostedQty := int(qty)
			if boostedQty < 1 {
				boostedQty = 1
			}
			lootMap[item.ItemCode] += boostedQty
		}
	}

	newTotalExp := currentExp + totalExp
	newLevel, newExp, levelsGained := game.CalculateNewLevel(playerLevel, newTotalExp)

	bonusTalentPoints := 0
	if bonuses.ExtraTalentPointChance > 0 && levelsGained > 0 {
		for i := 0; i < levelsGained; i++ {
			if rand.Float64() < bonuses.ExtraTalentPointChance {
				bonusTalentPoints++
			}
		}
	}

	newLastProcessed := lastProcessed + (minutesPassed * cycleSeconds)

	tx, err := s.db.Begin(ctx)
	if err != nil {
		return 0, 0, nil, int32(newLevel), err
	}
	defer tx.Rollback(ctx)

	_, err = tx.Exec(ctx, `
		UPDATE "character"
		SET gold = gold + $1, experience = $2, level = $3, talentpoint = talentpoint + $4, last_processed_time = $5, total_expedition_time = total_expedition_time + $6
		WHERE id = $7`,
		totalGold, newExp, newLevel, (levelsGained * 3) + bonusTalentPoints, newLastProcessed, (minutesPassed * cycleSeconds), charID,
	)
	if err != nil {
		return 0, 0, nil, int32(newLevel), err
	}

	var itemsStr []string
	for code, qty := range lootMap {
		var slot string
		err := tx.QueryRow(ctx, `SELECT slot FROM item WHERE code = $1`, code).Scan(&slot)

		if err != nil || slot == "material" {
			_, _ = tx.Exec(ctx, `INSERT INTO city_resource (city_id, resource_type, amount) VALUES ($1, $2, $3)
				ON CONFLICT (city_id, resource_type) DO UPDATE SET amount = city_resource.amount + EXCLUDED.amount`,
				cityID, code, qty)
			itemsStr = append(itemsStr, fmt.Sprintf("%s x%d", code, qty))
		} else {
			for i := 0; i < qty; i++ {
				_, _ = tx.Exec(ctx, `INSERT INTO character_item (character_id, item_code) VALUES ($1, $2)`, charID, code)
			}
			itemsStr = append(itemsStr, fmt.Sprintf("%s x%d", code, qty))
		}
	}

	if err := tx.Commit(ctx); err != nil {
		return 0, 0, nil, int32(newLevel), err
	}

	return totalGold, totalExp, itemsStr, int32(newLevel), nil
}

func (s *Server) PauseExpedition(ctx context.Context, req *expeditionpb.PauseExpeditionRequest) (*expeditionpb.PauseExpeditionResponse, error) {
	if req.CharacterId == 0 {
		return &expeditionpb.PauseExpeditionResponse{Success: false, Message: "Invalid request"}, nil
	}

	_, err := s.db.Exec(ctx, `UPDATE "character" SET is_paused = true WHERE id = $1`, req.CharacterId)
	if err != nil {
		return &expeditionpb.PauseExpeditionResponse{Success: false, Message: "DB error"}, nil
	}

	return &expeditionpb.PauseExpeditionResponse{Success: true, Message: "Paused"}, nil
}

func (s *Server) ResumeExpedition(ctx context.Context, req *expeditionpb.ResumeExpeditionRequest) (*expeditionpb.ResumeExpeditionResponse, error) {
	if req.CharacterId == 0 {
		return &expeditionpb.ResumeExpeditionResponse{Success: false, Message: "Invalid request"}, nil
	}

	var end, lastProcessed int64
	var isPaused bool
	err := s.db.QueryRow(ctx, `SELECT expeditionend, last_processed_time, is_paused FROM "character" WHERE id = $1`, req.CharacterId).Scan(&end, &lastProcessed, &isPaused)
	if err != nil {
		return &expeditionpb.ResumeExpeditionResponse{Success: false, Message: "Character not found"}, nil
	}

	now := time.Now().Unix()

	if isPaused {
		pausedDuration := now - lastProcessed
		newEnd := end + pausedDuration
		newLastProcessed := lastProcessed + pausedDuration

		_, err = s.db.Exec(ctx, `
			UPDATE "character"
			SET is_paused = false, expeditionend = $1, last_processed_time = $2, last_heartbeat = $3
			WHERE id = $4`,
			newEnd, newLastProcessed, now, req.CharacterId,
		)
		if err != nil {
			return &expeditionpb.ResumeExpeditionResponse{Success: false, Message: "DB error"}, nil
		}

		return &expeditionpb.ResumeExpeditionResponse{
			Success:          true,
			Message:          "Resumed",
			RemainingSeconds: newEnd - now,
		}, nil
	}

	return &expeditionpb.ResumeExpeditionResponse{
		Success:          true,
		Message:          "Not paused",
		RemainingSeconds: end - now,
	}, nil
}

func (s *Server) processRaid(ctx context.Context, charID int32, bonuses game.TalentBonuses) (bool, int64) {
	if bonuses.RaidAvoidChance > 0 && rand.Float64() < bonuses.RaidAvoidChance {
		log.Printf("RAID AVOIDED: Character %d (chance %.0f%%)", charID, bonuses.RaidAvoidChance*100)
		return false, 0
	}

	if rand.Intn(100) >= 25 {
		return false, 0
	}

	var wallLvl int
	var playerLevel int
	var cityID int

	s.db.QueryRow(ctx, `SELECT id FROM city WHERE character_id = $1`, charID).Scan(&cityID)
	s.db.QueryRow(ctx, `SELECT COALESCE(level, 0) FROM city_upgrade WHERE city_id = $1 AND upgrade_code = 'wall'`, cityID).Scan(&wallLvl)
	s.db.QueryRow(ctx, `SELECT level FROM "character" WHERE id = $1`, charID).Scan(&playerLevel)

	basePower := 15
	levelBonus := playerLevel * 2
	randomBonus := rand.Intn(11)
	raidPower := basePower + levelBonus + randomBonus

	wallDefense := int(float64(wallLvl*15) * (1.0 + bonuses.WallDefenseBonus))

	if raidPower > wallDefense {
		damageDiff := raidPower - wallDefense

		lossPercentage := damageDiff / 2
		if lossPercentage > 30 {
			lossPercentage = 30
		}
		if lossPercentage < 2 {
			lossPercentage = 2
		}

		lossReduction := bonuses.RaidLossReduction
		if lossReduction > 0.8 {
			lossReduction = 0.8
		}
		lossPercentage = int(float64(lossPercentage) * (1.0 - lossReduction))
		if lossPercentage < 1 {
			lossPercentage = 1
		}

		rows, err := s.db.Query(ctx, `SELECT resource_type, amount FROM city_resource WHERE city_id = $1 AND amount > 0`, cityID)
		if err == nil {
			type resEntry struct {
				rt  string
				amt int64
			}
			var resources []resEntry
			for rows.Next() {
				var r resEntry
				rows.Scan(&r.rt, &r.amt)
				resources = append(resources, r)
			}
			rows.Close()

			var totalLost int64
			for _, r := range resources {
				lossAmt := r.amt * int64(lossPercentage) / 100
				if lossAmt > 0 {
					s.db.Exec(ctx, `UPDATE city_resource SET amount = amount - $1 WHERE city_id = $2 AND resource_type = $3`, lossAmt, cityID, r.rt)
					totalLost += lossAmt
				}
			}

			s.db.Exec(ctx, `INSERT INTO raid_logs (character_id, raid_power, wall_defense, resources_lost) VALUES ($1, $2, $3, $4)`, charID, raidPower, wallDefense, totalLost)
			log.Printf("RAID: Character %d lost %d resources (%d%%). (Raid: %d, Wall: %d)", charID, totalLost, lossPercentage, raidPower, wallDefense)
			return true, totalLost
		}
		return true, 0
	} else {
		s.db.Exec(ctx, `INSERT INTO raid_logs (character_id, raid_power, wall_defense, resources_lost) VALUES ($1, $2, $3, 0)`, charID, raidPower, wallDefense)
		s.db.Exec(ctx, `UPDATE "character" SET total_raid_defends = total_raid_defends + 1 WHERE id = $1`, charID)
		s.db.Exec(ctx, `UPDATE "character" SET total_raids_survived = total_raids_survived + 1 WHERE id = $1`, charID)
		log.Printf("RAID DEFENDED: Character %d (Raid: %d, Wall: %d)", charID, raidPower, wallDefense)
		return true, 0
	}
}

func (s *Server) processEcho(ctx context.Context, charID int32, earnedGold int64, earnedExp int64, earnedItems []string, echoSaveChance float64) (int64, int64, []string) {
	if rand.Intn(100) >= 20 {
		return 0, 0, nil
	}

	var itemAtk, itemDef int
	var baseStr int

	_ = s.db.QueryRow(ctx, `
		SELECT COALESCE(SUM(i.attack), 0), COALESCE(SUM(i.defense), 0)
		FROM character_item ci
		JOIN item i ON i.code = ci.item_code
		WHERE ci.character_id = $1 AND ci.equipped = true`, charID,
	).Scan(&itemAtk, &itemDef)

	_ = s.db.QueryRow(ctx, `SELECT strength FROM "character" WHERE id = $1`, charID).Scan(&baseStr)

	strBonusAtk := baseStr / 5
	totalAttack := itemAtk + strBonusAtk
	totalDefense := itemDef

	echoPower := totalAttack / 2

	if totalDefense < echoPower {
		goldLoss := earnedGold / 2
		expLoss := earnedExp / 2

		if echoSaveChance > 0 {
			save := echoSaveChance
			if save > 0.9 {
				save = 0.9
			}
			goldLoss = int64(float64(goldLoss) * (1.0 - save))
			expLoss = int64(float64(expLoss) * (1.0 - save))
		}

		var lostItems []string
		for _, item := range earnedItems {
			loseChance := 50
			if echoSaveChance > 0 {
				loseChance = int(float64(loseChance) * (1.0 - echoSaveChance))
			}
			if rand.Intn(100) < loseChance {
				lostItems = append(lostItems, item)
			}
		}

		log.Printf("ECHO: Character %d defeated by Echo. Lost %d Gold, %d EXP, %d items.", charID, goldLoss, expLoss, len(lostItems))
		return goldLoss, expLoss, lostItems
	}
	s.db.Exec(ctx, `UPDATE "character" SET total_echo_wins = total_echo_wins + 1 WHERE id = $1`, charID)
	log.Printf("ECHO DEFEATED: Character %d defeated Echo.", charID)
	return 0, 0, nil
}
