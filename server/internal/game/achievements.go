package game

import (
	"context"
	"log"

	"github.com/jackc/pgx/v5/pgxpool"
)

func CheckAchievements(ctx context.Context, db *pgxpool.Pool, charID int32) (int64, int64, int32) {
	var totalGold, totalExp int64
	var totalTalents int32

	var level int
	var gold int64
	var crafts, expeditions, pvpWins, echoWins, raidDefends int
	var clanDeposits int64
	var blizzardSurvives, resonancePos int

	err := db.QueryRow(ctx, `
		SELECT level, gold, total_crafts, total_expeditions, total_pvp_wins, total_echo_wins, total_raid_defends,
		       COALESCE(total_clan_deposits, 0), COALESCE(total_blizzard_survives, 0), COALESCE(total_resonance_pos, 0)
		FROM "character" WHERE id = $1`, charID,
	).Scan(
		&level, &gold, &crafts, &expeditions, &pvpWins, &echoWins, &raidDefends,
		&clanDeposits, &blizzardSurvives, &resonancePos,
	)

	if err != nil {
		return 0, 0, 0
	}

	rows, _ := db.Query(ctx, `
		SELECT a.id, a.code, a.requirement_type, a.requirement_value, a.reward_gold, a.reward_exp, a.reward_talent_point
		FROM achievements a
		LEFT JOIN character_achievements ca ON ca.achievement_id = a.id AND ca.character_id = $1
		WHERE ca.is_completed IS NOT TRUE`, charID)

	defer rows.Close()

	type Ach struct {
		ID, ReqVal, RewardGold, RewardExp, RewardTP int64
		Code, ReqType                              string
	}
	var unlocked []Ach

	for rows.Next() {
		var a Ach
		rows.Scan(&a.ID, &a.Code, &a.ReqType, &a.ReqVal, &a.RewardGold, &a.RewardExp, &a.RewardTP)

		completed := false
		switch a.ReqType {
		case "level":
			if int64(level) >= a.ReqVal { completed = true }
		case "gold":
			if gold >= a.ReqVal { completed = true }
		case "crafts":
			if int64(crafts) >= a.ReqVal { completed = true }
		case "expeditions":
			if int64(expeditions) >= a.ReqVal { completed = true }
		case "pvp_win":
			if int64(pvpWins) >= a.ReqVal { completed = true }
		case "echo_win":
			if int64(echoWins) >= a.ReqVal { completed = true }
		case "raid_defend":
			if int64(raidDefends) >= a.ReqVal { completed = true }
		case "clan_deposit":
			if clanDeposits >= a.ReqVal { completed = true }
		case "blizzard_survive":
			if int64(blizzardSurvives) >= a.ReqVal { completed = true }
		case "resonance":
			if int64(resonancePos) >= a.ReqVal { completed = true }
		}

		if completed {
			unlocked = append(unlocked, a)
		}
	}

	tx, _ := db.Begin(ctx)
	defer tx.Rollback(ctx)

	for _, a := range unlocked {
		_, err = tx.Exec(ctx, `
			INSERT INTO character_achievements (character_id, achievement_id, is_completed, completed_at)
			VALUES ($1, $2, true, now())
			ON CONFLICT (character_id, achievement_id) DO NOTHING`, charID, a.ID)

		if err == nil {
			tx.Exec(ctx, `UPDATE "character" SET gold = gold + $1, experience = experience + $2, talentpoint = talentpoint + $3 WHERE id = $4`, a.RewardGold, a.RewardExp, a.RewardTP, charID)

			totalGold += a.RewardGold
			totalExp += a.RewardExp
			totalTalents += int32(a.RewardTP)

			log.Printf("ACHIEVEMENT UNLOCKED: %s for char %d. Rewards: %d gold, %d exp, %d TP", a.Code, charID, a.RewardGold, a.RewardExp, a.RewardTP)
		}
	}

	tx.Commit(ctx)
	return totalGold, totalExp, totalTalents
}
