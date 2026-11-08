package character

import (
	"context"
	"encoding/json"

	"github.com/jackc/pgx/v5/pgxpool"
	characterpb "IdleScholar_BD/gen/character"
)

type CharacterServer struct {
	characterpb.UnimplementedCharacterServiceServer
	db *pgxpool.Pool
}

func NewServer(db *pgxpool.Pool) *CharacterServer {
	return &CharacterServer{db: db}
}

func (s *CharacterServer) GetCharacterById(ctx context.Context, req *characterpb.CharacterRequest) (*characterpb.CharacterResponse, error) {
	var (
		id, level, strength, dexterity, intelligence, luck, talentpoint int32
		name, classType                                                 string
		experience, gold, barracksEnd                                   int64
		clanID                                                          *int32
		totalCrafts, totalSalvaged, totalRaids, totalEcho, totalBlizz, totalResonance int32
		pvpWins, pvpLosses, totalExpeditions int32
		totalFocus, totalGoldEarned, totalLoot int64
		tutorialStep 							int32
	)

	const query = `SELECT id, name, level, class_type, experience, strength, dexterity,
	                      intelligence, luck, talentpoint, gold, barracks_end, clan_id,
	                      COALESCE(total_crafts, 0), COALESCE(total_salvaged, 0), COALESCE(total_raids_survived, 0), 
	                      COALESCE(total_echo_wins, 0), COALESCE(total_blizzards_survived, 0), COALESCE(total_resonance_pos, 0),
	                      COALESCE(pvp_wins, 0), COALESCE(pvp_losses, 0), COALESCE(total_focus_minutes, 0), 
	                      COALESCE(total_gold_earned, 0), COALESCE(total_loot_collected, 0), COALESCE(total_expeditions, 0), tutorial_step
	               FROM public."character" WHERE id = $1`

	err := s.db.QueryRow(ctx, query, req.Id).Scan(
		&id, &name, &level, &classType, &experience, &strength, &dexterity,
		&intelligence, &luck, &talentpoint, &gold, &barracksEnd, &clanID,
		&totalCrafts, &totalSalvaged, &totalRaids, &totalEcho, &totalBlizz, &totalResonance,
		&pvpWins, &pvpLosses, &totalFocus, &totalGoldEarned, &totalLoot, &totalExpeditions,
		&tutorialStep,
	)
	if err != nil {
		return &characterpb.CharacterResponse{}, err
	}

	var clanIDVal int32 = 0
	if clanID != nil {
		clanIDVal = *clanID
	}

	return &characterpb.CharacterResponse{
		Id:           id,
		Name:         name,
		Level:        level,
		ClassType:    classType,
		Experience:   experience,
		Strength:     strength,
		Dexterity:    dexterity,
		Intelligence: intelligence,
		Luck:         luck,
		Talentpoint:  talentpoint,
		Gold:         gold,
		BarracksEnd:  barracksEnd,
		ClanId:       clanIDVal,
		TotalCrafts:           totalCrafts,
		TotalSalvaged:         totalSalvaged,
		TotalRaidsSurvived:    totalRaids,
		TotalEchoWins:         totalEcho,
		TotalBlizzardsSurvived: totalBlizz,
		TotalResonancePos:     totalResonance,
		PvpWins:               pvpWins,
		PvpLosses:             pvpLosses,
		TotalFocusMinutes:     totalFocus,
		TotalGoldEarned:       totalGoldEarned,
		TotalLootCollected:    totalLoot,
		TotalExpeditions:      totalExpeditions,
		TutorialStep: 		   tutorialStep,
	}, nil
}

func (s *CharacterServer) GetTalents(ctx context.Context, req *characterpb.GetTalentsRequest) (*characterpb.GetTalentsResponse, error) {
	var points int32
	var talentsRaw []byte

	err := s.db.QueryRow(ctx, `SELECT talentpoint, talents FROM "character" WHERE id = $1`, req.CharacterId).Scan(&points, &talentsRaw)
	if err != nil {
		return &characterpb.GetTalentsResponse{Success: false}, nil
	}

	var talentsMap map[string]interface{}
	if len(talentsRaw) > 0 {
		json.Unmarshal(talentsRaw, &talentsMap)
	} else {
		talentsMap = make(map[string]interface{})
	}

	resultTalents := make(map[string]int32)
	for k, v := range talentsMap {
		if val, ok := v.(float64); ok {
			resultTalents[k] = int32(val)
		}
	}

	return &characterpb.GetTalentsResponse{
		Success:      true,
		TalentPoints: points,
		Talents:      resultTalents,
	}, nil
}

func (s *CharacterServer) UpgradeTalent(ctx context.Context, req *characterpb.UpgradeTalentRequest) (*characterpb.UpgradeTalentResponse, error) {
	tx, err := s.db.Begin(ctx)
	if err != nil {
		return &characterpb.UpgradeTalentResponse{Success: false, Message: "DB error"}, nil
	}
	defer tx.Rollback(ctx)

	var points int32
	var talentsRaw []byte
	var baseStr, baseDex, baseInt, baseLuck int32

	err = tx.QueryRow(ctx, `SELECT talentpoint, talents, strength, dexterity, intelligence, luck FROM "character" WHERE id = $1 FOR UPDATE`, req.CharacterId).Scan(
		&points, &talentsRaw, &baseStr, &baseDex, &baseInt, &baseLuck,
	)
	if err != nil {
		return &characterpb.UpgradeTalentResponse{Success: false, Message: "Character not found"}, nil
	}

	if points <= 0 {
		return &characterpb.UpgradeTalentResponse{Success: false, Message: "No talent points available"}, nil
	}

	var talentsMap map[string]int32
	if len(talentsRaw) > 0 {
		json.Unmarshal(talentsRaw, &talentsMap)
	} else {
		talentsMap = make(map[string]int32)
	}

	currentLevel := talentsMap[req.TalentId]
	maxLevel := int32(5)

	if currentLevel >= maxLevel {
		return &characterpb.UpgradeTalentResponse{Success: false, Message: "Talent is maxed out"}, nil
	}

	if req.TalentId == "str_2" && talentsMap["str_1"] < 5 {
		return &characterpb.UpgradeTalentResponse{Success: false, Message: "Requires 5 points in Str Stage 1"}, nil
	}

	talentsMap[req.TalentId] = currentLevel + 1
	points -= 1

	if req.TalentId == "str_3" {
		baseStr += 1
	} else if req.TalentId == "dex_3" {
		baseDex += 1
	} else if req.TalentId == "int_3" {
		baseInt += 1
	} else if req.TalentId == "luck_3" {
		baseLuck += 1
	}

	newTalentsJSON, _ := json.Marshal(talentsMap)

	_, err = tx.Exec(ctx, `
		UPDATE "character" 
		SET talentpoint = $1, talents = $2, strength = $3, dexterity = $4, intelligence = $5, luck = $6 
		WHERE id = $7`,
		points, newTalentsJSON, baseStr, baseDex, baseInt, baseLuck, req.CharacterId,
	)
	if err != nil {
		return &characterpb.UpgradeTalentResponse{Success: false, Message: "Failed to save talent"}, nil
	}

	tx.Commit(ctx)

	return &characterpb.UpgradeTalentResponse{
		Success:  true,
		Message:  "Talent upgraded",
		NewLevel: currentLevel + 1,
	}, nil
}

func (s *CharacterServer) CompleteTutorial(ctx context.Context, req *characterpb.CompleteTutorialRequest) (*characterpb.CompleteTutorialResponse, error) {
	if req.CharacterId == 0 {
		return &characterpb.CompleteTutorialResponse{Success: false}, nil
	}

	_, err := s.db.Exec(ctx, `UPDATE "character" SET tutorial_step = 1 WHERE id = $1`, req.CharacterId)
	if err != nil {
		return &characterpb.CompleteTutorialResponse{Success: false}, nil
	}

	return &characterpb.CompleteTutorialResponse{Success: true}, nil
}
