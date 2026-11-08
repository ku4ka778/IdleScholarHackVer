package game

import (
	"math"
	"math/rand"
)

type ActivityType int

const (
	// Location 1
	ActivityCampaign   ActivityType = 0
	ActivityLumbermill ActivityType = 1
	ActivityMine       ActivityType = 2
	ActivityHunting    ActivityType = 3

	// Location 2
	ActivitySpiritGrove ActivityType = 4
	ActivityRuins       ActivityType = 5
	ActivityMoonShore   ActivityType = 6

	// Location 3
	ActivityFrozenMine ActivityType = 7
	ActivityIceForest  ActivityType = 8
	ActivitySnowFields ActivityType = 9

	// Location 4
	ActivityRustMine  ActivityType = 10
	ActivityAcidCaves ActivityType = 11
	ActivityCoralReef ActivityType = 12

	// Location 5
	ActivityMagicLibrary ActivityType = 13
	ActivityVoidRift     ActivityType = 14
	ActivityStarGarden   ActivityType = 15
)

type LootEntry struct {
	ItemCode string
	Chance   float64
	MinQty   int
	MaxQty   int
	ClassReq string
}

type DroppedItem struct {
	ItemCode string
	Quantity int
}

var LootTable = map[ActivityType]map[int][]LootEntry{
	ActivityCampaign: {
		0: {
			{"twig", 1.0, 1, 2, ""},
			{"stone", 0.5, 1, 2, ""},
			{"fiber", 0.5, 1, 3, ""},
			{"hide", 0.2, 1, 1, ""},
			{"flint", 0.2, 1, 1, ""},
			{"resin", 0.1, 1, 1, ""},
			{"leather", 0.1, 1, 1, ""},
			{"gem", 0.02, 1, 1, ""},
			{"warrior_sword", 0.05, 1, 1, "warrior"},
			{"mage_staff", 0.05, 1, 1, "mage"},
			{"bard_lute", 0.05, 1, 1, "bard"},
			{"alch_flask", 0.05, 1, 1, "alchemist"},
			{"wooden_club", 0.08, 1, 1, ""},
			{"leather_cap", 0.08, 1, 1, ""},
			{"wooden_ring", 0.05, 1, 1, ""},
			{"leather_vest", 0.04, 1, 1, ""},
		},
		1: {
			{"lake_water", 1.0, 1, 2, ""},
			{"silver_ore", 0.4, 1, 2, ""},
			{"mana_crystal", 0.3, 1, 2, ""},
			{"enchant_dust", 0.2, 1, 2, ""},
			{"silver_sword", 0.08, 1, 1, "warrior"},
			{"oak_staff", 0.08, 1, 1, "mage"},
			{"enchant_bow", 0.08, 1, 1, "bard"},
			{"alch_scepter", 0.08, 1, 1, "alchemist"},
			{"silver_mail", 0.05, 1, 1, ""},
			{"mage_robe", 0.05, 1, 1, ""},
			{"moon_shield", 0.03, 1, 1, ""},
			{"sapphire_ring", 0.04, 1, 1, ""},
			{"moon_amulet", 0.04, 1, 1, ""},
		},
		2: {
			{"frozen_wood", 1.0, 1, 2, ""},
			{"frost_ore", 0.5, 1, 2, ""},
			{"ice_crystal", 0.4, 1, 2, ""},
			{"snow_leather", 0.3, 1, 2, ""},
			{"ice_armor", 0.02, 1, 1, ""},
			{"frost_blade", 0.02, 1, 1, "warrior"},
			{"ice_staff", 0.02, 1, 1, "mage"},
			{"winter_bow", 0.02, 1, 1, "bard"},
			{"alch_frost_flask", 0.02, 1, 1, "alchemist"},
		},
		3: {
			{"iron_ore", 1.0, 1, 2, ""},
			{"rust", 0.4, 1, 2, ""},
			{"acid_gland", 0.3, 1, 2, ""},
			{"coral", 0.2, 1, 2, ""},
			{"iron_sword", 0.02, 1, 1, "warrior"},
			{"rusty_dagger", 0.02, 1, 1, "bard"}, 
			{"acid_staff", 0.02, 1, 1, "mage"},   
			{"alch_acid_flask", 0.02, 1, 1, "alchemist"},
			{"iron_helm", 0.01, 1, 1, ""}, 
		},
		4: {
			{"magic_essence", 1.0, 1, 2, ""},
			{"stardust", 0.4, 1, 2, ""},
			{"ancient_scroll", 0.3, 1, 2, ""},
			{"void_shard", 0.1, 1, 1, ""},
			{"archmage_staff", 0.01, 1, 1, "mage"},
			{"void_blade", 0.01, 1, 1, "warrior"},
			{"starlight_bow", 0.01, 1, 1, "bard"},
			{"philosophers_elixir", 0.01, 1, 1, "alchemist"},
		},
	},

	ActivityLumbermill: {
		0: {
			{"twig", 5.0, 2, 5, ""},
			{"resin", 0.5, 1, 2, ""},
		},
	},
	ActivityMine: {
		0: {
			{"stone", 5.0, 2, 5, ""},
			{"flint", 0.5, 1, 2, ""},
			{"gem", 0.02, 1, 1, ""},
		},
	},
	ActivityHunting: {
		0: {
			{"hide", 5.0, 2, 5, ""},
			{"fiber", 0.5, 1, 2, ""},
		},
	},
	ActivitySpiritGrove: {
		1: {
			{"spirit_wood", 5.0, 2, 5, ""},
			{"fiber", 1.0, 1, 3, ""},
		},
	},
	ActivityRuins: {
		1: {
			{"silver_ore", 5.0, 2, 5, ""},
			{"enchant_dust", 0.5, 1, 2, ""},
		},
	},
	ActivityMoonShore: {
		1: {
			{"lake_water", 5.0, 2, 5, ""}, 
			{"mana_crystal", 0.5, 1, 2, ""},
		},
	},
	
	ActivityFrozenMine: {
		2: {
			{"frost_ore", 5.0, 2, 5, ""},
			{"ice_crystal", 0.5, 1, 2, ""},
		},
	},
	ActivityIceForest: {
		2: {
			{"frozen_wood", 5.0, 2, 5, ""},
			{"snow_leather", 0.5, 1, 2, ""},
		},
	},
	ActivitySnowFields: {
		2: {
			{"snow_leather", 5.0, 2, 5, ""},
			{"ice_crystal", 0.5, 1, 2, ""},
		},
	},
	ActivityRustMine: {
		3: { 
			{"iron_ore", 5.0, 2, 5, ""}, 
			{"rust", 1.0, 1, 3, ""},     
			{"acid_gland", 0.2, 1, 1, ""},
		},
	},
	ActivityAcidCaves: {
		3: {
			{"acid_gland", 5.0, 2, 5, ""}, 
			{"coral", 1.0, 1, 3, ""},      
			{"iron_ore", 0.3, 1, 2, ""},   
		},
	},
	ActivityCoralReef: {
		3: {
			{"coral", 5.0, 2, 5, ""},    
			{"rust", 1.0, 1, 3, ""},      
			{"acid_gland", 0.3, 1, 2, ""}, 
		},
	},
	ActivityMagicLibrary: {
		4: {
			{"magic_essence", 5.0, 2, 5, ""},
			{"ancient_scroll", 1.0, 1, 3, ""},
		},
	},
	ActivityVoidRift: {
		4: {
			{"void_shard", 5.0, 2, 5, ""},
			{"stardust", 1.0, 1, 3, ""},
		},
	},
	ActivityStarGarden: {
		4: {
			{"stardust", 5.0, 2, 5, ""},
			{"magic_essence", 0.5, 1, 2, ""},
		},
	},
}

func RollLoot(activityType ActivityType, activityLevel int, playerClass string, playerLuck int) []DroppedItem {
	activityMap, ok := LootTable[activityType]
	if !ok {
		activityMap = LootTable[ActivityCampaign]
	}

	table, ok := activityMap[activityLevel]
	if !ok {
		table = activityMap[0]
	}

	var items []DroppedItem
	luckBonus := 1.0 + (math.Sqrt(float64(playerLuck)) * 0.02)

	for _, entry := range table {
		if entry.ClassReq != "" && entry.ClassReq != playerClass {
			continue
		}

		actualChance := entry.Chance * luckBonus
		if actualChance > 1.0 {
			actualChance = 1.0
		}

		if rand.Float64() < actualChance {
			qty := rand.Intn(entry.MaxQty-entry.MinQty+1) + entry.MinQty
			items = append(items, DroppedItem{
				ItemCode: entry.ItemCode,
				Quantity: qty,
			})
		}
	}

	return items
}

func CalculateNewLevel(currentLevel int, currentExp int64) (int, int64, int) {
	levelsGained := 0
	for {
		if currentLevel >= 60 {
			currentExp = 0
			break
		}
		required := GetExpForNextLevel(currentLevel)
		if currentExp < required {
			break
		}
		currentExp -= required
		currentLevel++
		levelsGained++
	}
	return currentLevel, currentExp, levelsGained
}

func GetExpForNextLevel(currentLevel int) int64 {
	return int64(currentLevel) * 200
}

func ComputePenalty(stacks, expires int, defense int) float64 {
	if expires <= 0 || stacks <= 0 {
		return 0.0
	}
	base := 0.2 * float64(stacks)
	if base > 0.8 {
		base = 0.8
	}
	return base * (1 - float64(defense)/float64(defense+100))
}

func ComputeGoldPerCycle(cycle int, activityType int, activityLevel int, playerLevel int, playerAttack int, penalty float64) int {
	base := 9.0
	if activityType > 0 { 
		base = 2.0 
	}

	locationMult := 1.0 + float64(activityLevel)*0.5
	levelMult := 1.0 + float64(playerLevel)*0.1
	cycleMult := 1.0 + math.Sqrt(float64(cycle))*0.05

	attackBonus := 1.0 + (math.Sqrt(float64(playerAttack)) * 0.02)

	gold := base * locationMult * levelMult * cycleMult * attackBonus
	gold = gold * (1.0 - penalty)

	return int(gold)
}

func ComputeExpPerCycle(gold int, intExpBonusPct int64) int64 {
	baseExp := int64(gold) * 3 / 2
	return baseExp + (baseExp * intExpBonusPct / 100)
}
