package game

func GetTalentLevel(talents map[string]int32, key string) int32 {
	if val, ok := talents[key]; ok {
		return val
	}
	return 0
}

type TalentBonuses struct {
	// str
	LootMultiplier      float64
	DebuffReduction     float64
	PassiveStrength     int
	WallDefenseBonus    float64
	DebuffAvoidChance   float64
	LongExpResourceBonus float64
	DoubleWeapon        bool

	// Dex
	DebuffChanceReduction float64
	PenaltyReduction      float64
	PassiveDexterity      int
	CraftGoldDiscount     float64
	CycleSpeedBonus       float64
	ShortExpLootChance    float64
	PvPGoldBonus          float64
	DoubleLootChance      float64

	// Int
	ExpMultiplier         float64
	BuffDurationMultiplier float64
	PassiveIntelligence   int
	DoubleCraftChance     float64
	BuildingDiscount      float64
	ExtraTalentPointChance float64
	ExpToResources        float64
	DoubleExpBonus        bool

	// Luck
	RareLootChance        float64
	RaidAvoidChance       float64
	PassiveLuck           int
	EchoSaveChance        float64
	RaidLossReduction     float64
	DoubleGoldChance      float64
	BarracksGoldBonus     float64
	PvPGoldJackpot        float64
}

func CalculateTalents(talents map[string]int32) TalentBonuses {
	b := TalentBonuses{}

	// Str
	str1 := GetTalentLevel(talents, "str_1")
	b.LootMultiplier += float64(str1) * 0.05

	str2 := GetTalentLevel(talents, "str_2")
	b.DebuffReduction += float64(str2) * 0.10

	str3 := GetTalentLevel(talents, "str_3")
	b.PassiveStrength += int(str3) 

	str4 := GetTalentLevel(talents, "str_4")
	b.WallDefenseBonus += float64(str4) * 0.10

	str5 := GetTalentLevel(talents, "str_5")
	b.DebuffAvoidChance += float64(str5) * 0.05

	str6 := GetTalentLevel(talents, "str_6")
	b.DebuffAvoidChance += float64(str6) * 0.05
	
	str7 := GetTalentLevel(talents, "str_7")
	if str7 > 0 {
		b.DoubleWeapon = true
	}

	// Dex
	dex1 := GetTalentLevel(talents, "dex_1")
	b.DebuffChanceReduction += float64(dex1) * 0.05

	dex2 := GetTalentLevel(talents, "dex_2")
	b.PenaltyReduction += float64(dex2) * 0.02

	dex3 := GetTalentLevel(talents, "dex_3")
	b.PassiveDexterity += int(dex3) 

	dex4 := GetTalentLevel(talents, "dex_4")
	b.CraftGoldDiscount += float64(dex4) * 0.02

	dex5 := GetTalentLevel(talents, "dex_5")
	b.CycleSpeedBonus += float64(dex5) * 1.0 

	dex6 := GetTalentLevel(talents, "dex_6")
	b.ShortExpLootChance += float64(dex6) * 0.10 

	dex7 := GetTalentLevel(talents, "dex_7")
	b.PvPGoldBonus += float64(dex7) * 0.20 

	dex8 := GetTalentLevel(talents, "dex_8")
	b.DoubleLootChance += float64(dex8) * 0.15 

	// Int
	int1 := GetTalentLevel(talents, "int_1")
	b.ExpMultiplier += float64(int1) * 0.05 

	int2 := GetTalentLevel(talents, "int_2")
	b.BuffDurationMultiplier += float64(int2) * 0.10

	int3 := GetTalentLevel(talents, "int_3")
	b.PassiveIntelligence += int(int3) 

	int4 := GetTalentLevel(talents, "int_4")
	b.DoubleCraftChance += float64(int4) * 0.05 

	int5 := GetTalentLevel(talents, "int_5")
	b.BuildingDiscount += float64(int5) * 0.03 

	int6 := GetTalentLevel(talents, "int_6")
	b.ExtraTalentPointChance += float64(int6) * 0.05

	int7 := GetTalentLevel(talents, "int_7")
	b.ExpToResources += float64(int7) * 0.05

	int8 := GetTalentLevel(talents, "int_8")
	if int8 > 0 {
		b.DoubleExpBonus = true
	}

	// Luck
	luck1 := GetTalentLevel(talents, "luck_1")
	b.RareLootChance += float64(luck1) * 0.02 

	luck2 := GetTalentLevel(talents, "luck_2")
	b.RaidAvoidChance += float64(luck2) * 0.05

	luck3 := GetTalentLevel(talents, "luck_3")
	b.PassiveLuck += int(luck3) 

	luck4 := GetTalentLevel(talents, "luck_4")
	b.EchoSaveChance += float64(luck4) * 0.10 

	luck5 := GetTalentLevel(talents, "luck_5")
	b.RaidLossReduction += float64(luck5) * 0.10 

	luck6 := GetTalentLevel(talents, "luck_6")
	b.DoubleGoldChance += float64(luck6) * 0.05 

	luck7 := GetTalentLevel(talents, "luck_7")
	b.BarracksGoldBonus += float64(luck7) * 0.10 

	luck8 := GetTalentLevel(talents, "luck_8")
	b.PvPGoldJackpot += float64(luck8) * 0.50

	return b
}
