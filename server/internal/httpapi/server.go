package httpapi

import (
	"encoding/json"
	"log"
	"net/http"
	"fmt"
	"github.com/jackc/pgx/v5/pgxpool"
	authpb "IdleScholar_BD/gen/auth"
	characterpb "IdleScholar_BD/gen/character"
	citypb "IdleScholar_BD/gen/city"
	craftpb "IdleScholar_BD/gen/craft"
	equipmentpb "IdleScholar_BD/gen/equipment"
	expeditionpb "IdleScholar_BD/gen/expedition"

	authserver "IdleScholar_BD/internal/auth"
	characterserver "IdleScholar_BD/internal/character"
	cityserver "IdleScholar_BD/internal/city"
	craftserver "IdleScholar_BD/internal/craft"
	equipmentserver "IdleScholar_BD/internal/equipment"
	expeditionserver "IdleScholar_BD/internal/expedition"

)

type HTTPServer struct {
	db           *pgxpool.Pool
	authSrv      *authserver.Server
	charSrv      *characterserver.CharacterServer
	citySrv      *cityserver.Server
	craftSrv     *craftserver.Server
	equipSrv     *equipmentserver.Server
	expeditionSrv *expeditionserver.Server
}

func NewHTTPServer(db *pgxpool.Pool) *HTTPServer {
	return &HTTPServer{
		db:           db,
		authSrv:      authserver.NewServer(db),
		charSrv:      characterserver.NewServer(db),
		citySrv:      cityserver.NewServer(db),
		craftSrv:     craftserver.NewServer(db),
		equipSrv:     equipmentserver.NewServer(db),
		expeditionSrv: expeditionserver.NewServer(db),
	}
}

func (s *HTTPServer) Start(addr string) error {
	mux := http.NewServeMux()

	// Auth
	mux.HandleFunc("/api/login", s.handleLogin)
	mux.HandleFunc("/api/register", s.handleRegister)
	mux.HandleFunc("/api/create_character", s.handleCreateCharacter)

	// Character
	mux.HandleFunc("/api/get_character", s.handleGetCharacter)
	mux.HandleFunc("/api/get_talents", s.handleGetTalents)
	mux.HandleFunc("/api/upgrade_talent", s.handleUpgradeTalent)

	// City
	mux.HandleFunc("/api/get_city", s.handleGetCity)
	mux.HandleFunc("/api/upgrade_building", s.handleUpgradeBuilding)

	// Craft
	mux.HandleFunc("/api/get_recipes", s.handleGetRecipes)
	mux.HandleFunc("/api/craft_item", s.handleCraftItem)
	mux.HandleFunc("/api/get_salvageable_items", s.handleGetSalvageableItems)
	mux.HandleFunc("/api/salvage_item", s.handleSalvageItem)

	// Equipment
	mux.HandleFunc("/api/get_equipment", s.handleGetEquipment)
	mux.HandleFunc("/api/equip", s.handleEquip)
	mux.HandleFunc("/api/unequip", s.handleUnequip)

	// Expedition
	mux.HandleFunc("/api/start_expedition", s.handleStartExpedition)
	mux.HandleFunc("/api/stop_expedition", s.handleStopExpedition)
	mux.HandleFunc("/api/finish_expedition", s.handleFinishExpedition)
	mux.HandleFunc("/api/heartbeat", s.handleHeartbeat)
	mux.HandleFunc("/api/get_expedition_status", s.handleGetExpeditionStatus)

	// Tavern
	mux.HandleFunc("/api/get_food_recipes", s.handleGetFoodRecipes)
	mux.HandleFunc("/api/buy_food", s.handleBuyFood)
	mux.HandleFunc("/api/get_potion_recipes", s.handleGetPotionRecipes)
	mux.HandleFunc("/api/drink_potion", s.handleDrinkPotion)

	// Barracks
	mux.HandleFunc("/api/start_barracks", s.handleStartBarracks)
	mux.HandleFunc("/api/claim_barracks", s.handleClaimBarracks)

	// Wall
	mux.HandleFunc("/api/get_raid_logs", s.handleGetRaidLogs)

	// Post Office
	mux.HandleFunc("/api/get_leaderboard", s.handleGetLeaderboard)
	mux.HandleFunc("/api/search_player", s.handleSearchPlayer)
	mux.HandleFunc("/api/add_friend", s.handleAddFriend)
	mux.HandleFunc("/api/get_friends", s.handleGetFriends)
	mux.HandleFunc("/api/accept_friend", s.handleAcceptFriend)
	mux.HandleFunc("/api/create_clan", s.handleCreateClan)
	mux.HandleFunc("/api/join_clan", s.handleJoinClan)
	mux.HandleFunc("/api/get_clan_info", s.handleGetClanInfo)
	mux.HandleFunc("/api/search_clan", s.handleSearchClan)
	mux.HandleFunc("/api/get_clan_leaderboard", s.handleGetClanLeaderboard)
	mux.HandleFunc("/api/get_player_profile", s.handleGetPlayerProfile)

	// Coop Group
	mux.HandleFunc("/api/create_coop_group", s.handleCreateCoopGroup)
	mux.HandleFunc("/api/join_coop_group", s.handleJoinCoopGroup)
	mux.HandleFunc("/api/leave_coop_group", s.handleLeaveCoopGroup)
	mux.HandleFunc("/api/get_coop_group", s.handleGetCoopGroup)
	mux.HandleFunc("/api/set_ready", s.handleSetReady)

	// Clan
	mux.HandleFunc("/api/deposit_clan_gold", s.handleDepositClanGold)
	mux.HandleFunc("/api/buy_clan_buff", s.handleBuyClanBuff)

	// Raids
	mux.HandleFunc("/api/find_raid_target", s.handleFindRaidTarget)
	mux.HandleFunc("/api/attack_player", s.handleAttackPlayer)
	
	// Achivements
	mux.HandleFunc("/api/get_achievements", s.handleGetAchievements)

	// Cheats
	mux.HandleFunc("/api/cheat_give_all", s.handleCheatGiveAll)

	// Tutorial
	mux.HandleFunc("/api/complete_tutorial", s.handleCompleteTutorial)
	
	handler := http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Access-Control-Allow-Origin", "*")
		w.Header().Set("Access-Control-Allow-Methods", "POST, GET, OPTIONS, PUT, DELETE")
		w.Header().Set("Access-Control-Allow-Headers", "Content-Type, Authorization, X-Requested-With")
		w.Header().Set("Access-Control-Max-Age", "86400")

		if r.Method == "OPTIONS" {
			w.WriteHeader(http.StatusOK)
			return
		}

		w.Header().Set("Content-Type", "application/json")
		
		mux.ServeHTTP(w, r)
	})

	log.Printf("HTTP server listening on %s", addr)
	return http.ListenAndServe(addr, handler)
}

func (s *HTTPServer) handleLogin(w http.ResponseWriter, r *http.Request) {
	var req authpb.LoginRequest
		if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	resp, err := s.authSrv.Login(r.Context(), &req)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleRegister(w http.ResponseWriter, r *http.Request) {
	var req authpb.RegisterRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	resp, err := s.authSrv.Register(r.Context(), &req)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleCreateCharacter(w http.ResponseWriter, r *http.Request) {
	var req authpb.CreateCharacterRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	resp, err := s.authSrv.CreateCharacter(r.Context(), &req)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleGetCharacter(w http.ResponseWriter, r *http.Request) {
	charId := r.URL.Query().Get("id")
	if charId == "" {
		http.Error(w, "id is required", http.StatusBadRequest)
		return
	}
	var id int32
	json.Unmarshal([]byte(charId), &id)

	resp, err := s.charSrv.GetCharacterById(r.Context(), &characterpb.CharacterRequest{Id: id})
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleGetTalents(w http.ResponseWriter, r *http.Request) {
	charId := r.URL.Query().Get("character_id")
	var id int32
	json.Unmarshal([]byte(charId), &id)

	resp, err := s.charSrv.GetTalents(r.Context(), &characterpb.GetTalentsRequest{CharacterId: id})
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleUpgradeTalent(w http.ResponseWriter, r *http.Request) {
	var req characterpb.UpgradeTalentRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	resp, err := s.charSrv.UpgradeTalent(r.Context(), &req)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleGetCity(w http.ResponseWriter, r *http.Request) {
	charId := r.URL.Query().Get("character_id")
	var id int32
	json.Unmarshal([]byte(charId), &id)

	resp, err := s.citySrv.GetCity(r.Context(), &citypb.GetCityRequest{CharacterId: id})
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleUpgradeBuilding(w http.ResponseWriter, r *http.Request) {
	var req citypb.UpgradeBuildingRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	resp, err := s.citySrv.UpgradeBuilding(r.Context(), &req)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleGetRecipes(w http.ResponseWriter, r *http.Request) {
	charId := r.URL.Query().Get("character_id")
	var id int32
	json.Unmarshal([]byte(charId), &id)

	resp, err := s.craftSrv.GetRecipes(r.Context(), &craftpb.GetRecipesRequest{CharacterId: id})
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleCraftItem(w http.ResponseWriter, r *http.Request) {
	var req craftpb.CraftItemRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	resp, err := s.craftSrv.CraftItem(r.Context(), &req)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleGetSalvageableItems(w http.ResponseWriter, r *http.Request) {
	charId := r.URL.Query().Get("character_id")
	var id int32
	json.Unmarshal([]byte(charId), &id)

	resp, err := s.craftSrv.GetSalvageableItems(r.Context(), &craftpb.GetSalvageableItemsRequest{CharacterId: id})
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleSalvageItem(w http.ResponseWriter, r *http.Request) {
	var req craftpb.SalvageItemRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	resp, err := s.craftSrv.SalvageItem(r.Context(), &req)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleGetEquipment(w http.ResponseWriter, r *http.Request) {
	charId := r.URL.Query().Get("character_id")
	var id int32
	json.Unmarshal([]byte(charId), &id)

	resp, err := s.equipSrv.GetEquipment(r.Context(), &equipmentpb.GetEquipmentRequest{CharacterId: id})
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleEquip(w http.ResponseWriter, r *http.Request) {
	var req equipmentpb.EquipRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	resp, err := s.equipSrv.Equip(r.Context(), &req)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleUnequip(w http.ResponseWriter, r *http.Request) {
	var req equipmentpb.UnequipRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	resp, err := s.equipSrv.Unequip(r.Context(), &req)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleStartExpedition(w http.ResponseWriter, r *http.Request) {
	var req expeditionpb.StartExpeditionRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	resp, err := s.expeditionSrv.StartExpedition(r.Context(), &req)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleStopExpedition(w http.ResponseWriter, r *http.Request) {
	var req expeditionpb.StopExpeditionRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	resp, err := s.expeditionSrv.StopExpedition(r.Context(), &req)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleFinishExpedition(w http.ResponseWriter, r *http.Request) {
	var req expeditionpb.FinishExpeditionRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	resp, err := s.expeditionSrv.FinishExpedition(r.Context(), &req)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleHeartbeat(w http.ResponseWriter, r *http.Request) {
	charId := r.URL.Query().Get("id")
	var id int32
	json.Unmarshal([]byte(charId), &id)

	resp, err := s.expeditionSrv.SendHeartbeat(r.Context(), &expeditionpb.HeartbeatRequest{CharacterId: id})
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleGetExpeditionStatus(w http.ResponseWriter, r *http.Request) {
	charId := r.URL.Query().Get("character_id")
	var id int32
	json.Unmarshal([]byte(charId), &id)

	resp, err := s.expeditionSrv.GetExpeditionStatus(r.Context(), &expeditionpb.GetExpeditionStatusRequest{CharacterId: id})
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleGetFoodRecipes(w http.ResponseWriter, r *http.Request) {
	charId := r.URL.Query().Get("character_id")
	var id int32
	json.Unmarshal([]byte(charId), &id)

	resp, err := s.citySrv.GetFoodRecipes(r.Context(), &citypb.GetFoodRecipesRequest{CharacterId: id})
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleBuyFood(w http.ResponseWriter, r *http.Request) {
	var req citypb.BuyFoodRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	resp, err := s.citySrv.BuyFood(r.Context(), &req)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleGetPotionRecipes(w http.ResponseWriter, r *http.Request) {
	charId := r.URL.Query().Get("character_id")
	var id int32
	json.Unmarshal([]byte(charId), &id)

	resp, err := s.citySrv.GetPotionRecipes(r.Context(), &citypb.GetPotionRecipesRequest{CharacterId: id})
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleDrinkPotion(w http.ResponseWriter, r *http.Request) {
	var req citypb.DrinkPotionRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	resp, err := s.citySrv.DrinkPotion(r.Context(), &req)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}	

func (s *HTTPServer) handleStartBarracks(w http.ResponseWriter, r *http.Request) {
	var req citypb.StartBarracksRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	resp, err := s.citySrv.StartBarracks(r.Context(), &req)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleClaimBarracks(w http.ResponseWriter, r *http.Request) {
	var req citypb.ClaimBarracksRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	resp, err := s.citySrv.ClaimBarracks(r.Context(), &req)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleGetRaidLogs(w http.ResponseWriter, r *http.Request) {
	charId := r.URL.Query().Get("character_id")
	var id int32
	json.Unmarshal([]byte(charId), &id)

	resp, err := s.citySrv.GetRaidLogs(r.Context(), &citypb.GetRaidLogsRequest{CharacterId: id})
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleGetLeaderboard(w http.ResponseWriter, r *http.Request) {
	sortBy := r.URL.Query().Get("sort_by")
	if sortBy == "" {
		sortBy = "level"
	}

	resp, err := s.citySrv.GetLeaderboard(r.Context(), &citypb.GetLeaderboardRequest{SortBy: sortBy})
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}	

func (s *HTTPServer) handleSearchPlayer(w http.ResponseWriter, r *http.Request) {
	name := r.URL.Query().Get("name")
	resp, err := s.citySrv.SearchPlayer(r.Context(), &citypb.SearchPlayerRequest{Name: name})
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleAddFriend(w http.ResponseWriter, r *http.Request) {
	var req citypb.AddFriendRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	resp, err := s.citySrv.AddFriend(r.Context(), &req)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleGetFriends(w http.ResponseWriter, r *http.Request) {
	charId := r.URL.Query().Get("character_id")
	var id int32
	json.Unmarshal([]byte(charId), &id)

	resp, err := s.citySrv.GetFriends(r.Context(), &citypb.GetFriendsRequest{CharacterId: id})
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleAcceptFriend(w http.ResponseWriter, r *http.Request) {
	var req citypb.AcceptFriendRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	resp, err := s.citySrv.AcceptFriend(r.Context(), &req)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleCreateClan(w http.ResponseWriter, r *http.Request) {
	var req citypb.CreateClanRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	resp, err := s.citySrv.CreateClan(r.Context(), &req)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleJoinClan(w http.ResponseWriter, r *http.Request) {
	var req citypb.JoinClanRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	resp, err := s.citySrv.JoinClan(r.Context(), &req)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleGetClanInfo(w http.ResponseWriter, r *http.Request) {
	clanId := r.URL.Query().Get("clan_id")
	var id int32
	json.Unmarshal([]byte(clanId), &id)

	resp, err := s.citySrv.GetClanInfo(r.Context(), &citypb.GetClanInfoRequest{ClanId: id})
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleSearchClan(w http.ResponseWriter, r *http.Request) {
	name := r.URL.Query().Get("name")
	resp, err := s.citySrv.SearchClan(r.Context(), &citypb.SearchClanRequest{Name: name})
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleGetClanLeaderboard(w http.ResponseWriter, r *http.Request) {
	resp, err := s.citySrv.GetClanLeaderboard(r.Context(), &citypb.GetClanLeaderboardRequest{})
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleCreateCoopGroup(w http.ResponseWriter, r *http.Request) {
	var req citypb.CreateCoopGroupRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	resp, err := s.citySrv.CreateCoopGroup(r.Context(), &req)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleJoinCoopGroup(w http.ResponseWriter, r *http.Request) {
	var req citypb.JoinCoopGroupRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	resp, err := s.citySrv.JoinCoopGroup(r.Context(), &req)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleLeaveCoopGroup(w http.ResponseWriter, r *http.Request) {
	var req citypb.LeaveCoopGroupRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	resp, err := s.citySrv.LeaveCoopGroup(r.Context(), &req)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleGetCoopGroup(w http.ResponseWriter, r *http.Request) {
	charIdStr := r.URL.Query().Get("character_id")
	var charId int32
	fmt.Sscanf(charIdStr, "%d", &charId)

	resp, err := s.citySrv.GetCoopGroup(r.Context(), &citypb.GetCoopGroupRequest{CharacterId: charId})
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleSetReady(w http.ResponseWriter, r *http.Request) {
	var req citypb.SetReadyRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	resp, err := s.citySrv.SetReady(r.Context(), &req)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleDepositClanGold(w http.ResponseWriter, r *http.Request) {
	var req citypb.DepositClanGoldRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	resp, err := s.citySrv.DepositClanGold(r.Context(), &req)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleBuyClanBuff(w http.ResponseWriter, r *http.Request) {
	var req citypb.BuyClanBuffRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	resp, err := s.citySrv.BuyClanBuff(r.Context(), &req)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleGetPlayerProfile(w http.ResponseWriter, r *http.Request) {
	charId := r.URL.Query().Get("character_id")
	var id int32
	json.Unmarshal([]byte(charId), &id)

	resp, err := s.citySrv.GetPlayerProfile(r.Context(), &citypb.GetPlayerProfileRequest{CharacterId: id})
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleFindRaidTarget(w http.ResponseWriter, r *http.Request) {
	charId := r.URL.Query().Get("character_id")
	if charId == "" {
		http.Error(w, "character_id is required", http.StatusBadRequest)
		return
	}

	var id int32
	fmt.Sscanf(charId, "%d", &id)

	resp, err := s.citySrv.FindRaidTarget(r.Context(), &citypb.FindRaidTargetRequest{
		CharacterId: id,
	})
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleAttackPlayer(w http.ResponseWriter, r *http.Request) {
	var req citypb.AttackPlayerRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	resp, err := s.citySrv.AttackPlayer(r.Context(), &req)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleGetAchievements(w http.ResponseWriter, r *http.Request) {
	charId := r.URL.Query().Get("character_id")
	var id int32
	json.Unmarshal([]byte(charId), &id)

	resp, err := s.citySrv.GetAchievements(r.Context(), &citypb.GetAchievementsRequest{CharacterId: id})
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleCheatGiveAll(w http.ResponseWriter, r *http.Request) {
	var req citypb.CheatGiveAllRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	resp, err := s.citySrv.CheatGiveAll(r.Context(), &req)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}

func (s *HTTPServer) handleCompleteTutorial(w http.ResponseWriter, r *http.Request) {
	var req characterpb.CompleteTutorialRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	resp, err := s.charSrv.CompleteTutorial(r.Context(), &req)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resp)
}
