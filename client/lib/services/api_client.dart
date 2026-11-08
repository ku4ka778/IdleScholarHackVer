import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl = 'http://localhost:8080/api';

  Future<Map<String, dynamic>> _post(String path, Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$path'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) return jsonDecode(response.body);
    throw Exception('HTTP Error ${response.statusCode}: ${response.body}');
  }

  Future<Map<String, dynamic>> _get(String path, Map<String, String> params) async {
    final uri = Uri.parse('$baseUrl/$path').replace(queryParameters: params);
    final response = await http.get(uri);
    if (response.statusCode == 200) return jsonDecode(response.body);
    throw Exception('HTTP Error ${response.statusCode}: ${response.body}');
  }

  // Auth
  Future<Map<String, dynamic>> login(String username, String password) => 
      _post('login', {'username': username, 'password': password});

  Future<Map<String, dynamic>> register(String username, String password, String email) => 
      _post('register', {'username': username, 'password': password, 'email': email});

  Future<Map<String, dynamic>> createCharacter(int accountId, String name, String classType) => 
      _post('create_character', {'account_id': accountId, 'character_name': name, 'class_type': classType});

  // Character
  Future<Map<String, dynamic>> getCharacter(int characterId) => 
      _get('get_character', {'id': characterId.toString()});

  Future<Map<String, dynamic>> getTalents(int characterId) => 
      _get('get_talents', {'character_id': characterId.toString()});

  Future<Map<String, dynamic>> upgradeTalent(int characterId, String talentId) => 
      _post('upgrade_talent', {'character_id': characterId, 'talent_id': talentId});

  // City
  Future<Map<String, dynamic>> getCity(int characterId) => 
      _get('get_city', {'character_id': characterId.toString()});

  Future<Map<String, dynamic>> upgradeBuilding(int characterId, String upgradeCode) => 
      _post('upgrade_building', {'character_id': characterId, 'upgrade_code': upgradeCode});

  // Craft
  Future<Map<String, dynamic>> getRecipes(int characterId) => 
      _get('get_recipes', {'character_id': characterId.toString()});

	Future<Map<String, dynamic>> craftItem(int characterId, int recipeId, int amount) => 
    _post('craft_item', {
      'character_id': characterId, 
      'recipe_id': recipeId,
      'amount': amount
    });

  Future<Map<String, dynamic>> getSalvageableItems(int characterId) => 
      _get('get_salvageable_items', {'character_id': characterId.toString()});

  Future<Map<String, dynamic>> salvageItem(int characterId, int itemId) => 
      _post('salvage_item', {'character_id': characterId, 'item_id': itemId});

  // Equipment
  Future<Map<String, dynamic>> getEquipment(int characterId) => 
      _get('get_equipment', {'character_id': characterId.toString()});

  Future<Map<String, dynamic>> equip(int characterId, int itemId) => 
      _post('equip', {'character_id': characterId, 'item_id': itemId});

  Future<Map<String, dynamic>> unequip(int characterId, int itemId) => 
      _post('unequip', {'character_id': characterId, 'item_id': itemId});

  // Tavern
  Future<Map<String, dynamic>> getFoodRecipes(int characterId) => 
      _get('get_food_recipes', {'character_id': characterId.toString()});

  Future<Map<String, dynamic>> buyFood(int characterId, String foodCode) => 
      _post('buy_food', {'character_id': characterId, 'food_code': foodCode});

  Future<Map<String, dynamic>> getPotionRecipes(int characterId) => 
      _get('get_potion_recipes', {'character_id': characterId.toString()});

  Future<Map<String, dynamic>> drinkPotion(int characterId, String potionCode) => 
      _post('drink_potion', {'character_id': characterId, 'potion_code': potionCode});

	// Barracks
  Future<Map<String, dynamic>> startBarracks(int characterId) => 
      _post('start_barracks', {'character_id': characterId});

  Future<Map<String, dynamic>> claimBarracks(int characterId) => 
      _post('claim_barracks', {'character_id': characterId});

  // Wall
  Future<Map<String, dynamic>> getRaidLogs(int characterId) => 
      _get('get_raid_logs', {'character_id': characterId.toString()});

  // Social
  Future<Map<String, dynamic>> getLeaderboard(String sortBy) => 
      _get('get_leaderboard', {'sort_by': sortBy});

	Future<Map<String, dynamic>> searchPlayer(String name) => 
      _get('search_player', {'name': name});

  Future<Map<String, dynamic>> addFriend(int charId, int targetId) => 
      _post('add_friend', {'character_id': charId, 'target_id': targetId});

  Future<Map<String, dynamic>> getFriends(int charId) => 
      _get('get_friends', {'character_id': charId.toString()});

  Future<Map<String, dynamic>> acceptFriend(int charId, int reqId) => 
      _post('accept_friend', {'character_id': charId, 'requester_id': reqId});

  Future<Map<String, dynamic>> getPlayerProfile(int characterId) => 
      _get('get_player_profile', {'character_id': characterId.toString()});
      
  Future<Map<String, dynamic>> createClan(int charId, String name) => 
      _post('create_clan', {'character_id': charId, 'clan_name': name});

  Future<Map<String, dynamic>> joinClan(int charId, int clanId) => 
      _post('join_clan', {'character_id': charId, 'clan_id': clanId});

  Future<Map<String, dynamic>> getClanInfo(int clanId) => 
      _get('get_clan_info', {'clan_id': clanId.toString()});

  Future<Map<String, dynamic>> searchClan(String name) => 
      _get('search_clan', {'name': name});

  Future<Map<String, dynamic>> getClanLeaderboard() => 
      _get('get_clan_leaderboard', {});

  Future<Map<String, dynamic>> depositClanGold(int charId, int amount) => 
      _post('deposit_clan_gold', {'character_id': charId, 'amount': amount});

  Future<Map<String, dynamic>> buyClanBuff(int charId, String buffCode) => 
      _post('buy_clan_buff', {'character_id': charId, 'buff_code': buffCode});

  // Coop Group
  Future<Map<String, dynamic>> createCoopGroup(int charId) => 
      _post('create_coop_group', {'character_id': charId});

  Future<Map<String, dynamic>> joinCoopGroup(int charId, int leaderId) => 
      _post('join_coop_group', {'character_id': charId, 'leader_id': leaderId});

  Future<Map<String, dynamic>> leaveCoopGroup(int charId) => 
      _post('leave_coop_group', {'character_id': charId});

  Future<Map<String, dynamic>> getCoopGroup(int charId) => 
      _get('get_coop_group', {'character_id': charId.toString()});

  Future<Map<String, dynamic>> setReady(int charId, bool isReady) => 
      _post('set_ready', {'character_id': charId, 'is_ready': isReady});

  // Raids
  Future<Map<String, dynamic>> findRaidTarget(int charId) =>
  	_get('find_raid_target', {'character_id': charId.toString()});

  Future<Map<String, dynamic>> attackPlayer(int charId, int targetId) =>
  	_post('attack_player', {'character_id': charId, 'target_id': targetId});

  // Achivements
  Future<Map<String, dynamic>> getAchievements(int characterId) => 
    _get('get_achievements', {'character_id': characterId.toString()});

  // Cheats
  Future<Map<String, dynamic>> cheatGiveAll(int characterId, int level, int gold) => 
    _post('cheat_give_all', {'character_id': characterId, 'level': level, 'gold': gold});


  // Tutorial
  Future<Map<String, dynamic>> completeTutorial(int characterId) => 
    _post('complete_tutorial', {'character_id': characterId});
      
  // Expedition
  Future<Map<String, dynamic>> startExpedition({
    required int characterId,
    required int durationMinutes,
    required int activityType,
    required int activityLevel,
    required List<String> allowedDomains,
    required List<String> allowedApps,
  }) => 
      _post('start_expedition', {
        'character_id': characterId,
        'duration_minutes': durationMinutes,
        'activity_type': activityType,
        'activity_level': activityLevel,
        'allowed_domains': allowedDomains,
        'allowed_apps': allowedApps,
      });
      
  Future<Map<String, dynamic>> stopExpedition(int charId) => 
      _post('stop_expedition', {'character_id': charId});

  Future<Map<String, dynamic>> finishExpedition(int charId) => 
      _post('finish_expedition', {'character_id': charId});

  Future<Map<String, dynamic>> sendHeartbeat(int charId) => 
      _get('heartbeat', {'id': charId.toString()});

  Future<Map<String, dynamic>> getExpeditionStatus(int charId) => 
      _get('get_expedition_status', {'character_id': charId.toString()});

	Future<Map<String, dynamic>> pauseExpedition(int charId) => 
      _post('pause_expedition', {'character_id': charId});

  Future<Map<String, dynamic>> resumeExpedition(int charId) => 
      _post('resume_expedition', {'character_id': charId});
}

final apiClient = ApiClient();
