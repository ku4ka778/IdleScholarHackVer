package craft

import (
	"context"
	"log"

	"github.com/jackc/pgx/v5/pgxpool"
	"IdleScholar_BD/internal/game"
	craftpb "IdleScholar_BD/gen/craft"
)

type Server struct {
	craftpb.UnimplementedCraftServiceServer
	db *pgxpool.Pool
}

func NewServer(db *pgxpool.Pool) *Server {
	return &Server{db: db}
}

func (s *Server) GetRecipes(ctx context.Context, req *craftpb.GetRecipesRequest) (*craftpb.GetRecipesResponse, error) {
	if req.CharacterId == 0 {
		return &craftpb.GetRecipesResponse{Success: false, Message: "Character ID required"}, nil
	}

	var cityID int32
	err := s.db.QueryRow(ctx, `SELECT id FROM city WHERE character_id = $1`, req.CharacterId).Scan(&cityID)
	if err != nil {
		return &craftpb.GetRecipesResponse{Success: false, Message: "City not found"}, nil
	}

	resourceMap := map[string]int64{}
	rows, err := s.db.Query(ctx, `SELECT resource_type, amount FROM city_resource WHERE city_id = $1`, cityID)
	if err == nil {
		for rows.Next() {
			var rt string
			var amt int64
			if err := rows.Scan(&rt, &amt); err == nil {
				resourceMap[rt] = amt
			}
		}
		rows.Close()
	}

	var libraryLvl int
	s.db.QueryRow(ctx, `SELECT COALESCE(level, 0) FROM city_upgrade WHERE city_id = $1 AND upgrade_code = 'library'`, cityID).Scan(&libraryLvl)
	
	discount := float64(libraryLvl) * 0.02
	if discount > 0.5 { discount = 0.5 }

	recipeRows, err := s.db.Query(ctx, `
		SELECT r.id, r.code, r.result_code, i.name, r.result_quantity, i.slot, i.attack, i.defense, i.luck, r.gold_cost
		FROM recipe r
		JOIN item i ON i.code = r.result_code
		ORDER BY CASE WHEN i.slot = 'material' THEN 0 ELSE 1 END, r.id`)
	if err != nil {
		return &craftpb.GetRecipesResponse{Success: false, Message: "DB error"}, nil
	}
	defer recipeRows.Close()

	var recipes []*craftpb.Recipe
	for recipeRows.Next() {
		r := &craftpb.Recipe{}
		var dbGoldCost int64
		
		err := recipeRows.Scan(&r.Id, &r.Code, &r.ResultCode, &r.ResultName, &r.ResultQuantity, &r.ResultSlot, &r.ResultAttack, &r.ResultDefense, &r.ResultLuck, &dbGoldCost)
		if err != nil {
			continue
		}
		
		if r.ResultSlot == "material" {
			r.GoldCost = 0
		} else {
			r.GoldCost = int64(float64(dbGoldCost) * (1.0 - discount))
		}

		ingRows, err := s.db.Query(ctx, `SELECT resource_type, amount FROM recipe_ingredient WHERE recipe_id = $1`, r.Id)
		canCraft := true
		if err == nil {
			for ingRows.Next() {
				var rt string
				var amt int32
				if err := ingRows.Scan(&rt, &amt); err == nil {
					available := resourceMap[rt]
					r.Ingredients = append(r.Ingredients, &craftpb.Ingredient{
						ResourceType: rt,
						Amount:       amt,
						Available:    available,
					})
					if available < int64(amt) {
						canCraft = false
					}
				}
			}
			ingRows.Close()
		}
		r.CanCraft = canCraft
		recipes = append(recipes, r)
	}

	return &craftpb.GetRecipesResponse{Success: true, Message: "OK", Recipes: recipes}, nil
}

func (s *Server) CraftItem(ctx context.Context, req *craftpb.CraftItemRequest) (*craftpb.CraftItemResponse, error) {
	if req.CharacterId == 0 || req.RecipeId == 0 {
		return &craftpb.CraftItemResponse{Success: false, Message: "Invalid request"}, nil
	}

	craftAmount := req.Amount
	if craftAmount <= 0 {
		craftAmount = 1
	}

	tx, err := s.db.Begin(ctx)
	if err != nil {
		return &craftpb.CraftItemResponse{Success: false, Message: "DB error"}, nil
	}
	defer tx.Rollback(ctx)

	var cityID int32
	err = tx.QueryRow(ctx, `SELECT id FROM city WHERE character_id = $1`, req.CharacterId).Scan(&cityID)
	if err != nil {
		return &craftpb.CraftItemResponse{Success: false, Message: "City not found"}, nil
	}

	var resultCode string
	var resultQuantity int32
	var baseGoldCost int64
	
	err = tx.QueryRow(ctx, `SELECT result_code, result_quantity, gold_cost FROM recipe WHERE id = $1`, req.RecipeId).Scan(&resultCode, &resultQuantity, &baseGoldCost)
	if err != nil {
		return &craftpb.CraftItemResponse{Success: false, Message: "Recipe not found"}, nil
	}

	var resultSlot string
	err = tx.QueryRow(ctx, `SELECT slot FROM item WHERE code = $1`, resultCode).Scan(&resultSlot)
	if err != nil {
		return &craftpb.CraftItemResponse{Success: false, Message: "Result item not found"}, nil
	}

	var libraryLvl int
	tx.QueryRow(ctx, `SELECT COALESCE(level, 0) FROM city_upgrade WHERE city_id = $1 AND upgrade_code = 'library'`, cityID).Scan(&libraryLvl)
	discount := float64(libraryLvl) * 0.02
	if discount > 0.5 { discount = 0.5 }

	var finalGoldCost int64 = 0
	if resultSlot != "material" {
		finalGoldCost = int64(float64(baseGoldCost) * (1.0 - discount))
	}

	totalGoldCost := finalGoldCost * int64(craftAmount)
	if totalGoldCost > 0 {
		var playerGold int64
		err = tx.QueryRow(ctx, `SELECT gold FROM "character" WHERE id = $1`, req.CharacterId).Scan(&playerGold)
		if err != nil {
			return &craftpb.CraftItemResponse{Success: false, Message: "Character not found"}, nil
		}
		if playerGold < totalGoldCost {
			return &craftpb.CraftItemResponse{Success: false, Message: "Not enough gold"}, nil
		}
		_, err = tx.Exec(ctx, `UPDATE "character" SET gold = gold - $1 WHERE id = $2`, totalGoldCost, req.CharacterId)
		if err != nil {
			return &craftpb.CraftItemResponse{Success: false, Message: "Failed to deduct gold"}, nil
		}
	}

	ingRows, err := tx.Query(ctx, `SELECT resource_type, amount FROM recipe_ingredient WHERE recipe_id = $1`, req.RecipeId)
	if err != nil {
		return &craftpb.CraftItemResponse{Success: false, Message: "DB error"}, nil
	}

	type ing struct {
		rt  string
		amt int32
	}
	var ingredients []ing
	for ingRows.Next() {
		var i ing
		if err := ingRows.Scan(&i.rt, &i.amt); err == nil {
			ingredients = append(ingredients, i)
		}
	}
	ingRows.Close()

	for _, i := range ingredients {
		var available int64
		err = tx.QueryRow(ctx, `SELECT amount FROM city_resource WHERE city_id = $1 AND resource_type = $2`, cityID, i.rt).Scan(&available)
		requiredAmount := int64(i.amt) * int64(craftAmount) 
		
		if err != nil || available < requiredAmount {
			return &craftpb.CraftItemResponse{Success: false, Message: "Not enough resources"}, nil
		}
	}

	for _, i := range ingredients {
		requiredAmount := i.amt * craftAmount
		_, err = tx.Exec(ctx, `UPDATE city_resource SET amount = amount - $1 WHERE city_id = $2 AND resource_type = $3`, requiredAmount, cityID, i.rt)
		if err != nil {
			return &craftpb.CraftItemResponse{Success: false, Message: "Failed to deduct resources"}, nil
		}
	}

	totalResultQuantity := resultQuantity * craftAmount
	
	if resultSlot == "material" {
		_, err = tx.Exec(ctx, `
			INSERT INTO city_resource (city_id, resource_type, amount) 
			VALUES ($1, $2, $3) 
			ON CONFLICT (city_id, resource_type) 
			DO UPDATE SET amount = city_resource.amount + EXCLUDED.amount`,
			cityID, resultCode, totalResultQuantity)
		if err != nil {
			return &craftpb.CraftItemResponse{Success: false, Message: "Failed to add material"}, nil
		}
	} else {
		for k := int32(0); k < totalResultQuantity; k++ {
			_, err = tx.Exec(ctx, `INSERT INTO character_item (character_id, item_code) VALUES ($1, $2)`, req.CharacterId, resultCode)
			if err != nil {
				return &craftpb.CraftItemResponse{Success: false, Message: "Failed to add item"}, nil
			}
		}
	}

	craftExp := int64(craftAmount) * 5
	tx.Exec(ctx, `UPDATE "character" SET experience = experience + $1 WHERE id = $2`, craftExp, req.CharacterId)

	if err := tx.Commit(ctx); err != nil {
		return &craftpb.CraftItemResponse{Success: false, Message: "Commit failed"}, nil
	}
	
	s.db.Exec(ctx, `UPDATE "character" SET total_crafts = total_crafts + $1 WHERE id = $2`, craftAmount, req.CharacterId)
	game.CheckAchievements(ctx, s.db, req.CharacterId)
	
	log.Printf("Crafted %d x %s for character %d", totalResultQuantity, resultCode, req.CharacterId)
	s.db.Exec(ctx, `UPDATE "character" SET total_crafts = total_crafts + $1 WHERE id = $2`, craftAmount, req.CharacterId)
	return &craftpb.CraftItemResponse{Success: true, Message: "OK"}, nil
}

func (s *Server) GetSalvageableItems(ctx context.Context, req *craftpb.GetSalvageableItemsRequest) (*craftpb.GetSalvageableItemsResponse, error) {
	if req.CharacterId == 0 {
		return &craftpb.GetSalvageableItemsResponse{Success: false, Message: "Character ID required"}, nil
	}

	rows, err := s.db.Query(ctx, `
		SELECT ci.id, ci.item_code, i.name, i.slot, i.tier
		FROM character_item ci
		JOIN item i ON i.code = ci.item_code
		WHERE ci.character_id = $1 AND ci.equipped = FALSE AND i.slot != 'material'
		ORDER BY i.tier, i.slot, i.name`, req.CharacterId)
	if err != nil {
		return &craftpb.GetSalvageableItemsResponse{Success: false, Message: "DB error"}, nil
	}
	defer rows.Close()

	var items []*craftpb.SalvageableItem
	for rows.Next() {
		item := &craftpb.SalvageableItem{}
		if err := rows.Scan(&item.Id, &item.Code, &item.Name, &item.Slot, &item.Tier); err != nil {
			continue
		}

		resultRows, err := s.db.Query(ctx, `
			SELECT resource_type, amount FROM salvage_by_tier_slot
			WHERE tier = $1 AND slot = $2`, item.Tier, item.Slot)
		if err == nil {
			for resultRows.Next() {
				var rt string
				var amt int32
				if err := resultRows.Scan(&rt, &amt); err == nil {
					item.Preview = append(item.Preview, &craftpb.SalvageResult{
						ResourceType: rt,
						Amount:       amt,
					})
				}
			}
			resultRows.Close()
		}
		items = append(items, item)
	}

	return &craftpb.GetSalvageableItemsResponse{Success: true, Message: "OK", Items: items}, nil
}

func (s *Server) SalvageItem(ctx context.Context, req *craftpb.SalvageItemRequest) (*craftpb.SalvageItemResponse, error) {
	if req.CharacterId == 0 || req.ItemId == 0 {
		return &craftpb.SalvageItemResponse{Success: false, Message: "Invalid request"}, nil
	}

	tx, err := s.db.Begin(ctx)
	if err != nil {
		return &craftpb.SalvageItemResponse{Success: false, Message: "DB error"}, nil
	}
	defer tx.Rollback(ctx)

	var itemCode string
	var equipped bool
	err = tx.QueryRow(ctx, `SELECT item_code, equipped FROM character_item WHERE id = $1 AND character_id = $2`, req.ItemId, req.CharacterId).Scan(&itemCode, &equipped)
	if err != nil {
		return &craftpb.SalvageItemResponse{Success: false, Message: "Item not found"}, nil
	}
	if equipped {
		return &craftpb.SalvageItemResponse{Success: false, Message: "Unequip item first"}, nil
	}

	var cityID int32
	err = tx.QueryRow(ctx, `SELECT id FROM city WHERE character_id = $1`, req.CharacterId).Scan(&cityID)
	if err != nil {
		return &craftpb.SalvageItemResponse{Success: false, Message: "City not found"}, nil
	}

	var results []*craftpb.SalvageResult

	var recipeID int32
	err = tx.QueryRow(ctx, `SELECT id FROM recipe WHERE result_code = $1`, itemCode).Scan(&recipeID)

	if err == nil {
		rows, err := tx.Query(ctx, `SELECT resource_type, amount FROM recipe_ingredient WHERE recipe_id = $1`, recipeID)
		if err == nil {
			for rows.Next() {
				var rt string
				var amt int32
				if err := rows.Scan(&rt, &amt); err == nil {
					half := amt / 2
					if half > 0 {
						results = append(results, &craftpb.SalvageResult{ResourceType: rt, Amount: half})
					}
				}
			}
			rows.Close()
		}
	} else {
		var tier int32
		var slot string
		err = tx.QueryRow(ctx, `SELECT tier, slot FROM item WHERE code = $1`, itemCode).Scan(&tier, &slot)
		if err != nil {
			return &craftpb.SalvageItemResponse{Success: false, Message: "Item not found in catalog"}, nil
		}

		rows, err := tx.Query(ctx, `SELECT resource_type, amount FROM salvage_by_tier_slot WHERE tier = $1 AND slot = $2`, tier, slot)
		if err == nil {
			for rows.Next() {
				var rt string
				var amt int32
				if err := rows.Scan(&rt, &amt); err == nil {
					results = append(results, &craftpb.SalvageResult{ResourceType: rt, Amount: amt})
				}
			}
			rows.Close()
		}
	}

	if len(results) == 0 {
		return &craftpb.SalvageItemResponse{Success: false, Message: "Nothing to salvage"}, nil
	}

	_, err = tx.Exec(ctx, `DELETE FROM character_item WHERE id = $1 AND character_id = $2`, req.ItemId, req.CharacterId)
	if err != nil {
		return &craftpb.SalvageItemResponse{Success: false, Message: "Failed to remove item"}, nil
	}

	for _, r := range results {
		_, err = tx.Exec(ctx, `
			INSERT INTO city_resource (city_id, resource_type, amount)
			VALUES ($1, $2, $3)
			ON CONFLICT (city_id, resource_type)
			DO UPDATE SET amount = city_resource.amount + EXCLUDED.amount`,
			cityID, r.ResourceType, r.Amount)
		if err != nil {
			return &craftpb.SalvageItemResponse{Success: false, Message: "Failed to add resources"}, nil
		}
	}

	if err := tx.Commit(ctx); err != nil {
		return &craftpb.SalvageItemResponse{Success: false, Message: "Commit failed"}, nil
	}
	s.db.Exec(ctx, `UPDATE "character" SET total_salvaged = total_salvaged + 1 WHERE id = $1`, req.CharacterId)
	return &craftpb.SalvageItemResponse{Success: true, Message: "Salvaged", Results: results}, nil
}
