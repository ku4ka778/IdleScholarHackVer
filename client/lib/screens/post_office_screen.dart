import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:async';
import '../services/api_client.dart';
import '../services/session.dart';
import 'map_screen.dart';
import 'clan_info_screen.dart';
import 'player_profile_screen.dart';
import '../ui_kit.dart';

class PostOfficeScreen extends StatefulWidget {
  const PostOfficeScreen({super.key});

  @override
  State<PostOfficeScreen> createState() => _PostOfficeScreenState();
}

class _PostOfficeScreenState extends State<PostOfficeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Timer? _coopRefreshTimer;
  
  List<Map<String, dynamic>> _leaders = [];
  List<Map<String, dynamic>> _friends = [];
  List<Map<String, dynamic>> _clansTop = [];

  Map<String, dynamic>? _clanInfo;
  int? _myClanId;

  Map<String, dynamic>? _coopGroup;
  int? _coopGroupId;
  bool _isCoopLeader = false;
  bool _loading = true;
  bool _amIReady = false;
  
  String _leaderboardSort = 'level';

  final Color bronze = const Color(0xFF8B7D6B);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        _loadTabData();
        
        if (_tabController.index == 3) {
          _startCoopRefresh();
        } else {
          _coopRefreshTimer?.cancel();
        }
      }
    });
    
    _loadTabData();
  }

  @override
  void dispose() {
    _coopRefreshTimer?.cancel(); 
    _tabController.dispose();
    super.dispose();
  }

  void _startCoopRefresh() {
    _coopRefreshTimer?.cancel();
    _coopRefreshTimer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      final charId = Session.characterId;
      if (charId == null) return;

      try {
        final resp = await apiClient.getCoopGroup(charId);
        if (resp['success'] == true) {
          if (mounted) {
            setState(() {
              if (resp['in_group'] == true) {
                _coopGroup = resp;
                _coopGroupId = (resp['group_id'] as num?)?.toInt();
                _isCoopLeader = resp['leader_id'] == charId;
                
                final members = (resp['members'] as List).cast<Map<String, dynamic>>();
                final me = members.firstWhere((e) => e['character_id'] == charId, orElse: () => {});
                _amIReady = me['is_ready'] == true;
              } else {
                _coopGroup = null;
                _coopGroupId = null;
                _amIReady = false;
              }
            });
          }
        }
      } catch (e) {
        debugPrint('Silent refresh error: $e');
      }
    });
  }
  
    Future<void> _loadTabData() async {
    final charId = Session.characterId;
    if (charId == null) return;
    setState(() => _loading = true);

    try {
      if (_leaders.isEmpty) {
        final topResp = await apiClient.getLeaderboard('level');
        if (topResp['success'] == true) {
          _leaders = (topResp['entries'] as List).cast<Map<String, dynamic>>();
        }
      }

      if (_tabController.index == 0) {
        final resp = await apiClient.getLeaderboard(_leaderboardSort);
        if (resp['success'] == true) {
          if (mounted) setState(() => _leaders = (resp['entries'] as List).cast<Map<String, dynamic>>());
        }
      } else if (_tabController.index == 1) {
        final resp = await apiClient.getFriends(charId);
        if (resp['success'] == true) {
          if (mounted) setState(() => _friends = (resp['friends'] as List).cast<Map<String, dynamic>>());
        }
      } else if (_tabController.index == 2) {
        final charResp = await apiClient.getCharacter(charId);
        final clanId = (charResp['clan_id'] as num?)?.toInt() ?? 0;

        if (clanId > 0) {
          final clanResp = await apiClient.getClanInfo(clanId);
          if (clanResp['success'] == true) {
            if (mounted) {
              setState(() {
                _myClanId = clanId;
                _clanInfo = clanResp;
              });
            }
          }
        }

        final topResp = await apiClient.getClanLeaderboard();
        if (topResp['success'] == true) {
          if (mounted) setState(() => _clansTop = (topResp['clans'] as List).cast<Map<String, dynamic>>());
        }
      } else if (_tabController.index == 3) {
        final resp = await apiClient.getCoopGroup(charId);
        if (resp['success'] == true) {
          if (mounted) {
            setState(() {
              if (resp['in_group'] == true) {
                _coopGroup = resp;
                _coopGroupId = (resp['group_id'] as num?)?.toInt();
                _isCoopLeader = resp['leader_id'] == charId;
                
                final members = (resp['members'] as List).cast<Map<String, dynamic>>();
                final me = members.firstWhere((e) => e['character_id'] == charId, orElse: () => {});
                _amIReady = me['is_ready'] == true;
              } else {
                _coopGroup = null;
                _coopGroupId = null;
                _amIReady = false;
              }
            });
          }
        }
      }
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _searchAndAddFriend() async {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1C1A19),
        title: const Text('Найти игрока', style: TextStyle(color: GameTheme.sandGold, fontFamily: 'Neucha')),
        content: TextField(
          controller: controller, 
          decoration: const InputDecoration(labelText: 'Ник', labelStyle: TextStyle(color: Colors.grey)),
          style: const TextStyle(color: GameTheme.lightSand),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Отмена', style: TextStyle(color: Colors.grey))),
          TextButton(
            onPressed: () async {
              final name = controller.text.trim();
              Navigator.pop(context);
              final charId = Session.characterId;
              if (name.isEmpty || charId == null) return;

              final resp = await apiClient.searchPlayer(name);
              if (resp['success'] == true) {
                final targetId = resp['character_id'];
                await apiClient.addFriend(charId, targetId);
                _loadTabData();
                if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Заявка отправлена!'), backgroundColor: Colors.green));
              } else if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Игрок не найден'), backgroundColor: Colors.redAccent));
            },
            child: const Text('Добавить', style: TextStyle(color: GameTheme.sandGold)),
          ),
        ],
      ),
    );
  }

  Future<void> _acceptFriend(int reqId) async {
    final charId = Session.characterId;
    if (charId == null) return;
    await apiClient.acceptFriend(charId, reqId);
    _loadTabData();
  }

  Future<void> _createClan() async {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1C1A19),
        title: const Text('Создать клан (1000 золота)', style: TextStyle(color: GameTheme.sandGold, fontFamily: 'Neucha')),
        content: TextField(
          controller: controller, 
          decoration: const InputDecoration(labelText: 'Название клана', labelStyle: TextStyle(color: Colors.grey)),
          style: const TextStyle(color: GameTheme.lightSand),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Отмена', style: TextStyle(color: Colors.grey))),
          TextButton(
            onPressed: () async {
              final name = controller.text.trim();
              Navigator.pop(context);
              final charId = Session.characterId;
              if (name.isEmpty || charId == null) return;

              final resp = await apiClient.createClan(charId, name);
              if (resp['success'] == true) {
                _loadTabData();
                if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Клан создан!'), backgroundColor: Colors.green));
              } else if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(resp['message'] ?? 'Ошибка'), backgroundColor: Colors.redAccent));
            },
            child: const Text('Создать', style: TextStyle(color: GameTheme.sandGold)),
          ),
        ],
      ),
    );
  }

  Future<void> _joinClan() async {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1C1A19),
        title: const Text('Вступить в клан', style: TextStyle(color: GameTheme.sandGold, fontFamily: 'Neucha')),
        content: TextField(
          controller: controller, 
          decoration: const InputDecoration(labelText: 'Название клана', labelStyle: TextStyle(color: Colors.grey)),
          style: const TextStyle(color: GameTheme.lightSand),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Отмена', style: TextStyle(color: Colors.grey))),
          TextButton(
            onPressed: () async {
              final name = controller.text.trim();
              Navigator.pop(context);
              final charId = Session.characterId;
              if (name.isEmpty || charId == null) return;

              final searchResp = await apiClient.searchClan(name);
              if (searchResp['success'] == true) {
                final clanId = searchResp['clan_id'];
                final joinResp = await apiClient.joinClan(charId, clanId);

                if (joinResp['success'] == true) {
                  _loadTabData();
                  if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Вы вступили в клан ${searchResp['name']}!'), backgroundColor: Colors.green));
                } else if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(joinResp['message'] ?? 'Ошибка'), backgroundColor: Colors.redAccent));
              } else if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Клан с таким названием не найден'), backgroundColor: Colors.redAccent));
            },
            child: const Text('Вступить', style: TextStyle(color: GameTheme.sandGold)),
          ),
        ],
      ),
    );
  }

  Future<void> _createCoopGroup() async {
    final charId = Session.characterId;
    if (charId == null) return;

    final resp = await apiClient.createCoopGroup(charId);
    if (resp['success'] == true) {
      _loadTabData();
    } else {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(resp['message'] ?? 'Ошибка'), backgroundColor: Colors.redAccent));
    }
  }

  Future<void> _joinCoopGroup() async {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1C1A19),
        title: const Text('Вступить в группу', style: TextStyle(color: GameTheme.sandGold, fontFamily: 'Neucha')),
        content: TextField(
          controller: controller, 
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'ID Лидера (число)', labelStyle: TextStyle(color: Colors.grey)),
          style: const TextStyle(color: GameTheme.lightSand),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Отмена', style: TextStyle(color: Colors.grey))),
          TextButton(
            onPressed: () async {
              final leaderId = int.tryParse(controller.text.trim());
              Navigator.pop(context);
              final charId = Session.characterId;
              if (leaderId == null || charId == null) return;

              final resp = await apiClient.joinCoopGroup(charId, leaderId);
              if (resp['success'] == true) {
                _loadTabData();
              } else {
                if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(resp['message'] ?? 'Ошибка'), backgroundColor: Colors.redAccent));
              }
            },
            child: const Text('Вступить', style: TextStyle(color: GameTheme.sandGold)),
          ),
        ],
      ),
    );
  }

  Future<void> _leaveCoopGroup() async {
    final charId = Session.characterId;
    if (charId == null) return;
    await apiClient.leaveCoopGroup(charId);
    _loadTabData();
  }

  Future<void> _toggleReady(bool currentStatus) async {
    final charId = Session.characterId;
    if (charId == null) return;
    await apiClient.setReady(charId, !currentStatus);
    _loadTabData();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _tabController.index != 3 || !_amIReady,
      onPopInvoked: (didPop) {
        if (didPop) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Вы не можете выйти, пока находитесь в состоянии "Готов"'), backgroundColor: Colors.redAccent),
        );
      },
      child: Scaffold(
        backgroundColor: GameTheme.deepBlue,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: GameTheme.sandGold),
          title: Text('ПОЧТОВЫЙ ДВОР', style: TextStyle(fontFamily: 'Neucha', color: GameTheme.sandGold, fontWeight: FontWeight.bold, fontSize: 24, letterSpacing: 2)),
          automaticallyImplyLeading: _tabController.index != 3 || !_amIReady,
        ),
        body: Stack(
          children: [
            Positioned.fill(
  child: BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0), 
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color.fromARGB(255, 22, 22, 24).withOpacity(0.7),
            GameTheme.twilightPurple.withOpacity(0.85),
          ],
        ),
      ),
    ),
  ),
),
            SafeArea(
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 850),
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C1A19),
                    border: Border.all(color: bronze, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xFF11100F),
                          border: Border.all(color: bronze.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: TabBar(
                          controller: _tabController,
                          isScrollable: true,
													tabAlignment: TabAlignment.start,
                          indicatorColor: GameTheme.sandGold,
                          indicatorWeight: 3,
                          labelColor: GameTheme.sandGold,
                          unselectedLabelColor: bronze.withOpacity(0.5),
                          labelStyle: const TextStyle(fontFamily: 'Neucha', fontSize: 16, fontWeight: FontWeight.bold),
                          unselectedLabelStyle: const TextStyle(fontFamily: 'Neucha', fontSize: 14),
                          dividerColor: Colors.transparent,
                          tabs: const [
                            Tab(text: 'ТОП ИГРОКОВ'),
                            Tab(text: 'ДРУЗЬЯ'),
                            Tab(text: 'КЛАНЫ'),
                            Tab(text: 'ГРУППА'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: _loading
                            ? const Center(child: CircularProgressIndicator(color: GameTheme.sandGold))
                            : TabBarView(
                                controller: _tabController,
                                children: [
                                  _buildLeaderboard(),
                                  _buildFriends(),
                                  _buildClansTab(),
                                  _buildCoopTab(),
                                ],
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLeaderboard() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildChoiceChip('По уровню', 'level'),
              const SizedBox(width: 12),
              _buildChoiceChip('По времени', 'time'),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: _leaders.length,
            itemBuilder: (context, index) {
              final entry = _leaders[index];
              final name = entry['name'] as String? ?? 'Unknown';
              final level = (entry['level'] as num?)?.toInt() ?? 1;
              final rank = (entry['rank'] as num?)?.toInt() ?? 0;
              final charId = (entry['character_id'] as num?)?.toInt() ?? 0;
              final totalTime = (entry['total_time'] as num?)?.toInt() ?? 0;
              final isMe = name == Session.characterName;

              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: isMe ? GameTheme.twilightPurple.withOpacity(0.5) : const Color(0xFF11100F).withOpacity(0.6),
                  border: Border.all(color: isMe ? GameTheme.sandGold : bronze.withOpacity(0.2)),
                ),
                child: ListTile(
                  onTap: charId > 0 ? () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => PlayerProfileScreen(characterId: charId)));
                  } : null,
                  leading: CircleAvatar(
                    backgroundColor: isMe ? GameTheme.sandGold : bronze, 
                    child: Text('$rank', style: const TextStyle(color: Color(0xFF1C1A19), fontWeight: FontWeight.bold)),
                  ),
                  title: Text(name, style: TextStyle(fontWeight: FontWeight.bold, color: isMe ? GameTheme.sandGold : GameTheme.lightSand)),
                  subtitle: _leaderboardSort == 'time' 
                      ? Text('Время: ${totalTime ~/ 60} м.', style: TextStyle(fontSize: 12, color: bronze))
                      : null,
                  trailing: Text('Ур. $level', style: TextStyle(fontSize: 16, color: GameTheme.lightSand, fontWeight: FontWeight.bold)),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildChoiceChip(String label, String value) {
    final isSelected = _leaderboardSort == value;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      labelStyle: TextStyle(color: isSelected ? const Color(0xFF1C1A19) : bronze),
      selectedColor: GameTheme.sandGold,
      backgroundColor: const Color(0xFF11100F),
      side: BorderSide(color: isSelected ? GameTheme.sandGold : bronze.withOpacity(0.3)),
      onSelected: (val) {
        if (val) {
          setState(() => _leaderboardSort = value);
          _loadTabData();
        }
      },
    );
  }

  Widget _buildFriends() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton.icon(
              onPressed: _searchAndAddFriend,
              icon: const Icon(Icons.person_add),
              label: const Text('ДОБАВИТЬ ДРУГА', style: TextStyle(fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: GameTheme.sandGold,
                foregroundColor: const Color(0xFF1C1A19),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              ),
            ),
          ),
        ),
        Expanded(
          child: _friends.isEmpty
              ? const Center(child: Text('У вас пока нет друзей', style: TextStyle(color: Colors.grey)))
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: _friends.length,
                  itemBuilder: (context, index) {
                    final f = _friends[index];
                    final isIncoming = f['status'] == 'incoming';
                    final isAccepted = f['status'] == 'accepted';
                    final charId = (f['character_id'] as num?)?.toInt() ?? 0;

                    return Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF11100F).withOpacity(0.6),
                        border: Border.all(color: bronze.withOpacity(0.2)),
                      ),
                      child: ListTile(
                        onTap: charId > 0 ? () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => PlayerProfileScreen(characterId: charId)));
                        } : null,
                        title: Text(f['name'] ?? 'Unknown', style: const TextStyle(fontWeight: FontWeight.bold, color: GameTheme.lightSand)),
                        subtitle: Text('Уровень: ${f['level'] ?? 1}', style: TextStyle(color: bronze, fontSize: 12)),
                        trailing: isIncoming
                            ? ElevatedButton(
                                onPressed: () => _acceptFriend(charId),
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                                child: const Text('Принять', style: TextStyle(color: Colors.white)),
                              )
                            : Text(
                                isAccepted ? 'В друзьях' : 'Ожидание',
                                style: TextStyle(color: isAccepted ? Colors.greenAccent : Colors.grey, fontWeight: FontWeight.bold),
                              ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
  
  Widget _buildClansTab() {   
    if (_myClanId == null || _clanInfo == null) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _createClan, 
                    style: ElevatedButton.styleFrom(backgroundColor: GameTheme.sandGold, foregroundColor: const Color(0xFF1C1A19)),
                    child: const Text('СОЗДАТЬ КЛАН', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    onPressed: _joinClan,
                    style: OutlinedButton.styleFrom(side: BorderSide(color: GameTheme.sandGold), foregroundColor: GameTheme.sandGold),
                    child: const Text('ВСТУПИТЬ', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('ТОП КЛАНОВ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: bronze, letterSpacing: 2)),
          ),
          Expanded(
            child: _clansTop.isEmpty
                ? const Center(child: Text('Кланов пока нет', style: TextStyle(color: Colors.grey)))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: _clansTop.length,
                    itemBuilder: (context, index) {
                      final c = _clansTop[index];
                      final clanId = (c['clan_id'] as num?)?.toInt() ?? 0;
                      
                      return Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF11100F).withOpacity(0.6),
                          border: Border.all(color: bronze.withOpacity(0.2)),
                        ),
                        child: ListTile(
                          onTap: clanId > 0 ? () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => ClanInfoScreen(clanId: clanId)));
                          } : null,
                          leading: const Icon(Icons.shield, color: GameTheme.sandGold),
                          title: Text(c['name'] ?? 'Unknown', style: const TextStyle(fontWeight: FontWeight.bold, color: GameTheme.lightSand),
															maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text('Участников: ${c['member_count'] ?? 0}', style: TextStyle(color: bronze, fontSize: 12)),
                          trailing: Text('Сумма ур: ${c['total_levels'] ?? 0}', style: const TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)),
                        ),
                      );
                    },
                  ),
          ),
        ],
      );
    }

    final members = (_clanInfo!['members'] as List?)?.cast<Map<String, dynamic>>() ?? [];

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF11100F),
              border: Border.all(color: bronze.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const TabBar(
              indicatorColor: GameTheme.sandGold,
              labelColor: GameTheme.sandGold,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: 'МОЙ КЛАН'),
                Tab(text: 'ТОП КЛАНОВ'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => ClanInfoScreen(clanId: _myClanId!)));
                      },
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: GameTheme.twilightPurple.withOpacity(0.4),
                          border: Border.all(color: GameTheme.sandGold.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Column(
                          children: [
                            Text('Клан: ${_clanInfo!['name']}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: GameTheme.sandGold)),
                            Text('Лидер: ${_clanInfo!['leader_name']}', style: TextStyle(fontSize: 14, color: bronze)),
                            const SizedBox(height: 8),
                            const Text('Нажмите, чтобы открыть банк и баффы', style: TextStyle(fontSize: 12, color: Colors.cyanAccent)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Участники:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: bronze)),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: members.length,
                        itemBuilder: (context, index) {
                          final m = members[index];
                          final memberName = m['name'] as String? ?? 'Unknown';
                          final leaderName = _clanInfo!['leader_name'] as String? ?? '';

                          String? classType = m['class_type'] as String?;
                          
                          if (classType == null || classType.isEmpty) {
                            final leaderData = _leaders.firstWhere(
                              (l) => l['name'] == memberName, 
                              orElse: () => {}
                            );
                            if (leaderData.isNotEmpty) {
                              classType = leaderData['class_type'] as String?;
                            }
                          }

                          return ListTile(
                            leading: _buildMemberAvatar(classType, memberName, leaderName),
                            title: Text(memberName, style: const TextStyle(fontWeight: FontWeight.bold, color: GameTheme.lightSand)),
                            trailing: Text('Ур. ${m['level'] ?? 1}', style: const TextStyle(fontSize: 16, color: GameTheme.lightSand)),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  itemCount: _clansTop.length,
                  itemBuilder: (context, index) {
                    final c = _clansTop[index];
                    final clanId = (c['clan_id'] as num?)?.toInt() ?? 0;
                    
                    return Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF11100F).withOpacity(0.6),
                        border: Border.all(color: bronze.withOpacity(0.2)),
                      ),
                      child: ListTile(
                        onTap: clanId > 0 ? () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => ClanInfoScreen(clanId: clanId)));
                        } : null,
                        leading: const Icon(Icons.shield, color: GameTheme.sandGold),
                        title: Text(c['name'] ?? 'Unknown', style: const TextStyle(fontWeight: FontWeight.bold, color: GameTheme.lightSand)),
                        subtitle: Text('Участников: ${c['member_count'] ?? 0}', style: TextStyle(color: bronze, fontSize: 12)),
                        trailing: Text('Сумма ур: ${c['total_levels'] ?? 0}', style: const TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMemberAvatar(String? classType, String memberName, String leaderName) {
    final isLeader = memberName == leaderName;
    
    if (classType == null || classType.isEmpty) {
      return Stack(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF2A2624), 
              border: Border.all(color: isLeader ? Colors.amber : bronze, width: 2),
            ),
            child: const Icon(Icons.person, color: Colors.grey, size: 24),
          ),
          if (isLeader)
            const Positioned(
              right: 0,
              bottom: 0,
              child: Icon(Icons.star, color: Colors.amber, size: 16),
            ),
        ],
      );
    }

    String heroImage = 'assets/images/warrior.png';
    Color classColor = Colors.redAccent;

    if (classType == 'mage') { heroImage = 'assets/images/mage.png'; classColor = Colors.blueAccent; }
    if (classType == 'bard') { heroImage = 'assets/images/bard.png'; classColor = Colors.purpleAccent; }
    if (classType == 'alchemist') { heroImage = 'assets/images/alchemist.png'; classColor = Colors.amberAccent; }

    return Stack(
      children: [
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: isLeader ? Colors.amber : classColor, width: 2),
            image: DecorationImage(
              image: AssetImage(heroImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        if (isLeader)
          const Positioned(
            right: 0,
            bottom: 0,
            child: Icon(Icons.star, color: Colors.amber, size: 16),
          ),
      ],
    );
  }

  Widget _buildCoopTab() {
    final charId = Session.characterId;

    if (_coopGroupId == null && _coopGroup != null && _coopGroup!['in_group'] == true) {
      _coopGroupId = (_coopGroup!['group_id'] as num?)?.toInt();
    }

    if (_coopGroupId == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.groups, size: 64, color: GameTheme.sandGold),
            const SizedBox(height: 16),
            const Text('Вы не в кооп-группе', style: TextStyle(fontSize: 18, color: GameTheme.lightSand)),
            const SizedBox(height: 8),
            Text('Ваш ID для приглашения: $charId', style: TextStyle(fontSize: 14, color: bronze)),
            const SizedBox(height: 24),
            SizedBox(
              width: 250,
              height: 45,
              child: ElevatedButton(
                onPressed: _createCoopGroup, 
                style: ElevatedButton.styleFrom(backgroundColor: GameTheme.sandGold, foregroundColor: const Color(0xFF1C1A19)),
                child: const Text('СОЗДАТЬ ГРУППУ', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: 250,
              height: 45,
              child: OutlinedButton(
                onPressed: _joinCoopGroup, 
                style: OutlinedButton.styleFrom(side: BorderSide(color: GameTheme.sandGold), foregroundColor: GameTheme.sandGold),
                child: const Text('ВСТУПИТЬ ПО ID ЛИДЕРА', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      );
    }

    final members = (_coopGroup?['members'] as List?)?.cast<Map<String, dynamic>>() ?? [];
    final leaderId = _coopGroup?['leader_id'];
    final me = members.firstWhere((e) => e['character_id'] == charId, orElse: () => {});
    final amIReady = me['is_ready'] == true;

    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: GameTheme.twilightPurple.withOpacity(0.4),
            border: Border.all(color: GameTheme.sandGold.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            children: [
              const Text('Кооп-Группа', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: GameTheme.sandGold, fontFamily: 'Neucha')),
              Text('ID Группы: $_coopGroupId', style: TextStyle(fontSize: 14, color: bronze)),
              if (_isCoopLeader) const Text('Вы — Лидер', style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Участники:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: bronze)),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: members.length,
            itemBuilder: (context, index) {
              final m = members[index];
              final isLeader = m['character_id'] == leaderId;
              final isReady = m['is_ready'] == true;

              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF11100F).withOpacity(0.6),
                  border: Border.all(color: bronze.withOpacity(0.2)),
                ),
                child: ListTile(
                  leading: Icon(isLeader ? Icons.star : Icons.person, color: isLeader ? Colors.amber : GameTheme.sandGold),
                  title: Text(m['name'] ?? 'Unknown', style: const TextStyle(fontWeight: FontWeight.bold, color: GameTheme.lightSand)),
                  subtitle: Text('Уровень: ${m['level'] ?? 1}', style: TextStyle(color: bronze, fontSize: 12)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isReady) const Icon(Icons.check_circle, color: Colors.greenAccent) else const Icon(Icons.hourglass_empty, color: Colors.grey),
                      if (isLeader) const Padding(padding: EdgeInsets.only(left: 8.0), child: Text('Лидер', style: TextStyle(color: Colors.grey, fontSize: 12))),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () => _toggleReady(amIReady),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: amIReady ? Colors.orange : GameTheme.sandGold,
                    foregroundColor: const Color(0xFF1C1A19),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  ),
                  child: Text(
                    amIReady ? 'ОТМЕНИТЬ ГОТОВНОСТЬ' : 'Я ГОТОВ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 8),

              if (_isCoopLeader) ...[
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      final allReady = members.every((m) => m['is_ready'] == true);
                      if (!allReady) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Не все участники готовы!'), backgroundColor: Colors.redAccent));
                        return;
                      }
                      
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const LocationSelectScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    ),
                    child: const Text('НАЧАТЬ ЭКСПЕДИЦИЮ', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 8),
              ],

              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: _leaveCoopGroup,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent.withOpacity(0.2),
                    foregroundColor: Colors.redAccent,
                    side: const BorderSide(color: Colors.redAccent),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  ),
                  child: const Text('ПОКИНУТЬ ГРУППУ', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
