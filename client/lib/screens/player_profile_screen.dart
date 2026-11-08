import 'dart:ui';
import 'package:flutter/material.dart';
import '../services/api_client.dart';
import '../services/session.dart';
import '../ui_kit.dart';

class PlayerProfileScreen extends StatefulWidget {
  final int characterId;
  final String initialName;

  const PlayerProfileScreen({super.key, required this.characterId, this.initialName = 'Профиль'});

  @override
  State<PlayerProfileScreen> createState() => _PlayerProfileScreenState();
}

class _PlayerProfileScreenState extends State<PlayerProfileScreen> {
  Map<String, dynamic>? _profile;
  List<Map<String, dynamic>> _items = [];
  bool _loading = true;
  bool _isFriendRequestSent = false;
  String _friendshipStatus = 'none';

  final Color bronze = const Color(0xFF8B7D6B);

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    try {
      final resp = await apiClient.getPlayerProfile(widget.characterId);
      
      final charId = Session.characterId;
      String status = 'none';
      if (charId != null) {
        final friendsResp = await apiClient.getFriends(charId);
        if (friendsResp['success'] == true) {
          final friendsList = (friendsResp['friends'] as List<dynamic>?) ?? [];
          for (var f in friendsList) {
            if (f['character_id'] == widget.characterId) {
              if (f['status'] == 'accepted') status = 'friends';
              if (f['status'] == 'outgoing') status = 'pending';
              break;
            }
          }
        }
      }

      if (resp['success'] == true) {
        if (mounted) {
          setState(() {
            _profile = resp;
            final rawItems = (resp['equipped_items'] as List<dynamic>?) ?? [];
            _items = rawItems.cast<Map<String, dynamic>>();
            _friendshipStatus = status;
            _loading = false;
          });
        }
      }
    } catch (e) {
      debugPrint('Profile load error: $e');
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _sendFriendRequest() async {
    final charId = Session.characterId;
    if (charId == null) return;

    try {
      final resp = await apiClient.addFriend(charId, widget.characterId);
      if (resp['success'] == true) {
        if (mounted) {
          setState(() => _friendshipStatus = 'pending');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Заявка отправлена!'), backgroundColor: Colors.green),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(resp['message'] ?? 'Ошибка'), backgroundColor: Colors.redAccent),
          );
        }
      }
    } catch (e) {
      debugPrint('Friend request error: $e');
    }
  }

  String _translateSlot(String slot) {
    switch (slot) {
      case 'weapon': return 'Оружие';
      case 'armor': return 'Броня';
      case 'accessory': return 'Аксессуар';
      default: return slot;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GameTheme.deepBlue,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: GameTheme.sandGold),
        title: Text(
          _profile?['name'] ?? widget.initialName,
          style: TextStyle(fontFamily: 'Neucha', color: GameTheme.sandGold, fontWeight: FontWeight.bold, fontSize: 24),
        ),
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
                constraints: const BoxConstraints(maxWidth: 700),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1A19),
                  border: Border.all(color: bronze, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: _loading
                    ? const Center(child: CircularProgressIndicator(color: GameTheme.sandGold))
                    : _profile == null
                        ? const Center(child: Text('Игрок не найден', style: TextStyle(color: GameTheme.lightSand)))
                        : SingleChildScrollView(
                            padding: const EdgeInsets.all(30),
                            child: _buildContent(),
                          ),
              ),
            ),
          ),
        ],
      ),
    );
  }

	  Widget _buildContent() {
    final name = _profile!['name'] as String? ?? 'Unknown';
    final level = _profile!['level'] as int? ?? 1;
    final classType = _profile!['class_type'] as String? ?? 'warrior';
    final clanName = _profile!['clan_name'] as String? ?? 'Нет клана';
    
    final str = (_profile!['strength'] as num?)?.toInt() ?? 0;
    final dex = (_profile!['dexterity'] as num?)?.toInt() ?? 0;
    final intel = (_profile!['intelligence'] as num?)?.toInt() ?? 0;
    final luck = (_profile!['luck'] as num?)?.toInt() ?? 0;

    final isMe = widget.characterId == Session.characterId;

    String className = 'Рыцарь';
    Color classColor = Colors.redAccent;
    String heroImage = 'assets/images/warrior.png';

    if (classType == 'mage') { className = 'Маг'; classColor = Colors.blueAccent; heroImage = 'assets/images/mage.png'; }
    if (classType == 'bard') { className = 'Бард'; classColor = Colors.purpleAccent; heroImage = 'assets/images/bard.png'; }
    if (classType == 'alchemist') { className = 'Алхимик'; classColor = Colors.amberAccent; heroImage = 'assets/images/alchemist.png'; }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: classColor, width: 3),
                image: DecorationImage(image: AssetImage(heroImage), fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: GameTheme.lightSand, fontFamily: 'Neucha')),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: classColor.withOpacity(0.15),
                      border: Border.all(color: classColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(className, style: TextStyle(fontSize: 14, color: classColor, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 8),
                 
                  Row(
                    children: [
                      const Icon(Icons.military_tech, color: GameTheme.sandGold, size: 18),
                      const SizedBox(width: 6),
                      Text('Уровень: $level', style: TextStyle(color: bronze, fontSize: 16)),
                      const SizedBox(width: 16),
                      const Icon(Icons.shield, color: Colors.blueGrey, size: 18),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          clanName, 
                          style: TextStyle(color: bronze, fontSize: 16),
                          maxLines: 1, 
                          overflow: TextOverflow.ellipsis, 
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 30),
        Divider(color: bronze.withOpacity(0.3)),
        const SizedBox(height: 20),

        Text('ХАРАКТЕРИСТИКИ', style: TextStyle(color: bronze, fontSize: 14, letterSpacing: 2, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatCard('Сила', str, Colors.redAccent),
            _buildStatCard('Ловкость', dex, Colors.greenAccent),
            _buildStatCard('Интеллект', intel, Colors.cyanAccent),
            _buildStatCard('Удача', luck, Colors.orangeAccent),
          ],
        ),

        const SizedBox(height: 30),

        Text('ЭКИПИРОВКА', style: TextStyle(color: bronze, fontSize: 14, letterSpacing: 2, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        
        if (_items.isEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF11100F).withOpacity(0.5),
              border: Border.all(color: bronze.withOpacity(0.2)),
            ),
            child: const Text('Персонаж без экипировки', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic)),
          )
        else
          ..._items.map((item) {
            final slotName = _translateSlot(item['slot'] as String? ?? '');
            final stats = <String>[];
            if ((item['attack'] as num? ?? 0) > 0) stats.add('ATK +${item['attack']}');
            if ((item['defense'] as num? ?? 0) > 0) stats.add('DEF +${item['defense']}');
            if ((item['luck'] as num? ?? 0) > 0) stats.add('LUCK +${item['luck']}');

            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF11100F).withOpacity(0.6),
                border: Border.all(color: bronze.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.shield, color: GameTheme.sandGold),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['name'] as String? ?? 'Unknown', style: const TextStyle(fontWeight: FontWeight.bold, color: GameTheme.lightSand)),
                        Text('Слот: $slotName | ${stats.join(", ")}', style: TextStyle(fontSize: 12, color: bronze)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),

        const SizedBox(height: 30),

        if (!isMe) 
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              onPressed: _friendshipStatus == 'none' ? _sendFriendRequest : null, 
              icon: Icon(
                _friendshipStatus == 'friends' ? Icons.check_circle :
                _friendshipStatus == 'pending' ? Icons.hourglass_empty : 
                Icons.person_add
              ),
              label: Text(
                _friendshipStatus == 'friends' ? 'ВЫ УЖЕ ДРУЗЬЯ' :
                _friendshipStatus == 'pending' ? 'ЗАЯВКА ОТПРАВЛЕНА' : 
                'ДОБАВИТЬ В ДРУЗЬЯ'
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: _friendshipStatus == 'friends' ? Colors.green : GameTheme.sandGold,
                foregroundColor: const Color(0xFF1C1A19),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildStatCard(String label, int value, Color color) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            border: Border.all(color: color.withOpacity(0.5)),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text('$value', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
        ),
        const SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 12, color: bronze)),
      ],
    );
  }
}
