import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../services/api_client.dart';
import '../services/session.dart';
import 'talents_screen.dart';
import 'achievements_screen.dart';
import '../ui_kit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic>? _character;
  int _equipAtk = 0;
  int _equipDef = 0;
  int _equipLuck = 0;
  bool _loading = true;

  final Color bronze = const Color(0xFF8B7D6B);

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final charId = Session.characterId;
    if (charId == null) return;

    setState(() => _loading = true);
    try {
      final charResp = await apiClient.getCharacter(charId);
      final eqResp = await apiClient.getEquipment(charId);

      if (charResp['id'] != null) {
        if (mounted) {
          setState(() {
            _character = charResp;
            if (eqResp['success'] == true) {
              _equipAtk = eqResp['total_attack'] ?? 0;
              _equipDef = eqResp['total_defense'] ?? 0;
              _equipLuck = eqResp['total_luck'] ?? 0;
            }
            _loading = false;
          });
        }
      }
    } catch (e) {
      debugPrint('Profile load error: $e');
      if (mounted) setState(() => _loading = false);
    }
  }

  int _getExpForNextLevel(int currentLevel) => currentLevel * 200;

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        backgroundColor: GameTheme.deepBlue,
        body: Center(child: CircularProgressIndicator(color: GameTheme.sandGold)),
      );
    }
    
    if (_character == null) {
      return const Scaffold(
        backgroundColor: GameTheme.deepBlue,
        body: Center(child: Text('Ошибка загрузки профиля', style: TextStyle(color: GameTheme.lightSand))),
      );
    }

    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Scaffold(
      backgroundColor: GameTheme.deepBlue,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'ПРОФИЛЬ', 
          style: TextStyle(
            fontFamily: 'Neucha', 
            color: GameTheme.sandGold, 
            fontWeight: FontWeight.bold, 
            fontSize: isMobile ? 20 : 24, 
            letterSpacing: isMobile ? 2 : 4
          )
        ),
        iconTheme: const IconThemeData(color: GameTheme.sandGold),
        actions: [
          IconButton(
            icon: const Icon(Icons.emoji_events, color: GameTheme.sandGold),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const AchievementsScreen()));
            },
          ),
        ],
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
                constraints: const BoxConstraints(maxWidth: 950),
                margin: EdgeInsets.all(isMobile ? 10 : 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1A19), 
                  border: Border.all(color: bronze, width: 2),
                  borderRadius: BorderRadius.circular(4), 
                ),
                child: isMobile 
                  ? _buildMobileLayout() 
                  : _buildDesktopLayout(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildProfileInfo(isMobile: true),
          Container(height: 1, color: bronze.withOpacity(0.5)), 
          _buildStatsPanel(isMobile: true),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: _buildProfileInfo(isMobile: false),
        ),
        Expanded(
          flex: 6,
          child: _buildStatsPanel(isMobile: false),
        ),
      ],
    );
  }

  Widget _buildProfileInfo({required bool isMobile}) {
    final char = _character!;
    
    String classType = char['class_type'] ?? 'warrior';
    String heroImage = 'assets/images/warrior.png';
    Color classColor = Colors.redAccent;
    String className = 'Рыцарь';

    if (classType == 'mage') { heroImage = 'assets/images/mage.png'; classColor = Colors.blueAccent; className = 'Маг'; }
    if (classType == 'bard') { heroImage = 'assets/images/bard.png'; classColor = Colors.purpleAccent; className = 'Бард'; }
    if (classType == 'alchemist') { heroImage = 'assets/images/alchemist.png'; classColor = Colors.amberAccent; className = 'Алхимик'; }

    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 30),
      decoration: BoxDecoration(
        border: isMobile ? null : Border(right: BorderSide(color: bronze.withOpacity(0.5), width: 1)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [const Color(0xFF2A2624), const Color(0xFF1C1A19)],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: isMobile ? 150 : 200,
            height: isMobile ? 150 : 200,
            padding: const EdgeInsets.all(6), 
            decoration: BoxDecoration(
              color: const Color(0xFF11100F),
              border: Border.all(color: bronze, width: 3),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.8), blurRadius: 15, offset: const Offset(5, 5)),
              ]
            ),
            child: Image.asset(heroImage, fit: BoxFit.cover),
          ),
          const SizedBox(height: 20),
          
          Text(char['name'] ?? 'Unknown', style: TextStyle(fontSize: isMobile ? 28 : 36, fontWeight: FontWeight.bold, color: GameTheme.lightSand, fontFamily: 'Neucha')),
          const SizedBox(height: 12),
          
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            decoration: BoxDecoration(
              color: classColor.withOpacity(0.15),
              border: Border.all(color: classColor.withOpacity(0.6), width: 1.5),
            ),
            child: Text(className.toUpperCase(), style: TextStyle(fontSize: 14, color: classColor, fontWeight: FontWeight.bold, letterSpacing: 2)),
          ),
          
          const SizedBox(height: 30),
          
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF11100F),
              border: Border.all(color: bronze, width: 1),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.monetization_on, color: GameTheme.sandGold, size: 24),
                const SizedBox(width: 12),
                Text('${char['gold']}', style: TextStyle(fontSize: isMobile ? 22 : 26, fontWeight: FontWeight.bold, color: GameTheme.sandGold, fontFamily: 'Neucha')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsPanel({required bool isMobile}) {
    final char = _character!;
    final level = char['level'] ?? 1;
    final reqExp = _getExpForNextLevel(level);
    final curExp = (char['experience'] as num?)?.toInt() ?? 0;
    final progress = (curExp / reqExp).clamp(0.0, 1.0);

    final baseAtk = (char['strength'] as num? ?? 0) ~/ 5;
    final totalAtk = baseAtk + _equipAtk;
    final totalLuck = (char['luck'] as num? ?? 0) + _equipLuck;
    final totalDef = _equipDef;

    return Padding(
      padding: EdgeInsets.all(isMobile ? 20 : 30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('УРОВЕНЬ $level', style: TextStyle(color: GameTheme.lightSand, fontSize: isMobile ? 18 : 22, fontWeight: FontWeight.bold, fontFamily: 'Neucha')),
                Text('$curExp / $reqExp XP', style: TextStyle(color: bronze, fontSize: 14, fontStyle: FontStyle.italic)),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              height: 16,
              decoration: BoxDecoration(
                color: const Color(0xFF11100F),
                border: Border.all(color: bronze, width: 1),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: progress,
                child: Container(
                  decoration: BoxDecoration(
                    color: GameTheme.sandGold.withOpacity(0.8),
                    gradient: const LinearGradient(colors: [Color(0xFFE5B85A), Color(0xFFB88632)]),
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 30),

            Text('АТРИБУТЫ', style: TextStyle(color: bronze, fontSize: 12, letterSpacing: 3, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildAttributeCard('Сила', Icons.fitness_center, char['strength'] ?? 0, isMobile),
                _buildAttributeCard('Ловкость', Icons.directions_run, char['dexterity'] ?? 0, isMobile),
                _buildAttributeCard('Интеллект', Icons.menu_book, char['intelligence'] ?? 0, isMobile),
                _buildAttributeCard('Удача', Icons.casino, char['luck'] ?? 0, isMobile),
              ],
            ),

            const SizedBox(height: 30),


            Text('БОЕВЫЕ ХАРАКТЕРИСТИКИ', style: TextStyle(color: bronze, fontSize: 12, letterSpacing: 3, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: const Color(0xFF11100F).withOpacity(0.5),
                border: Border.all(color: bronze.withOpacity(0.3)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCombatStat('АТАКА', totalAtk, baseAtk, _equipAtk, Colors.red.shade300, isMobile),
                  _buildCombatStat('ЗАЩИТА', totalDef, 0, _equipDef, Colors.blue.shade300, isMobile),
                  _buildCombatStat('УДАЧА', totalLuck.toInt(), (char['luck'] as num? ?? 0).toInt(), _equipLuck, Colors.orange.shade300, isMobile),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Text('СТАТИСТИКА', style: TextStyle(color: bronze, fontSize: 12, letterSpacing: 3, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: isMobile ? 2.2 : 2.8, 
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                _buildStatCard('Время в фокусе', '${(char['total_focus_minutes'] as num? ?? 0) ~/ 60} ч.', Icons.timer, Colors.blueAccent),
                _buildStatCard('Вылазок', '${char['total_expeditions'] ?? 0}', Icons.map, Colors.greenAccent),
                _buildStatCard('Заработано', '${char['total_gold_earned'] ?? 0}', Icons.monetization_on, GameTheme.sandGold),
                _buildStatCard('Лута', '${char['total_loot_collected'] ?? 0}', Icons.inventory, Colors.cyanAccent),
                _buildStatCard('PvP Победы', '${char['pvp_wins'] ?? 0} / ${char['pvp_losses'] ?? 0}', Icons.gavel, Colors.redAccent),
                _buildStatCard('Побед над Эхом', '${char['total_echo_wins'] ?? 0}', Icons.waves, Colors.purpleAccent),
                _buildStatCard('Отбито рейдов', '${char['total_raids_survived'] ?? 0}', Icons.shield, Colors.blueGrey),
                _buildStatCard('Метелей', '${char['total_blizzards_survived'] ?? 0}', Icons.ac_unit, Colors.lightBlue),
                _buildStatCard('Резонансов', '${char['total_resonance_pos'] ?? 0}', Icons.auto_awesome, Colors.pinkAccent),
                _buildStatCard('Скрафчено', '${char['total_crafts'] ?? 0}', Icons.build, Colors.orangeAccent),
              ],
            ),

            const SizedBox(height: 30),

            if ((char['talentpoint'] ?? 0) > 0)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2624),
                  border: Border.all(color: GameTheme.sandGold, width: 2),
                ),
                child: Column(
                  children: [
                    Text(
                      'ОЧКОВ НАВЫКОВ: ${char['talentpoint']}',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: GameTheme.lightSand, letterSpacing: 1.5),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: GameTheme.sandGold,
                          foregroundColor: const Color(0xFF1C1A19),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                        ),
                        onPressed: () async {
                          await Navigator.push(context, MaterialPageRoute(builder: (_) => const TalentsScreen()));
                          _load();
                        },
                        child: const Text('РАСПРЕДЕЛИТЬ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 2)),
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildAttributeCard(String label, IconData icon, int value, bool isMobile) {
    return Column(
      children: [
        Container(
          width: isMobile ? 50 : 60,
          height: isMobile ? 50 : 60,
          decoration: BoxDecoration(
            color: const Color(0xFF11100F),
            border: Border.all(color: bronze.withOpacity(0.5), width: 1),
          ),
          child: Icon(icon, color: GameTheme.lightSand.withOpacity(0.7), size: isMobile ? 24 : 28),
        ),
        const SizedBox(height: 8),
        Text('$value', style: TextStyle(fontSize: isMobile ? 18 : 22, fontWeight: FontWeight.bold, color: GameTheme.lightSand, fontFamily: 'Neucha')),
        Text(label.toUpperCase(), style: TextStyle(fontSize: 10, color: bronze, letterSpacing: 1)),
      ],
    );
  }

  Widget _buildCombatStat(String label, int total, int base, int equip, Color color, bool isMobile) {
    return Column(
      children: [
        Text(
          '$total',
          style: TextStyle(fontSize: isMobile ? 24 : 32, fontWeight: FontWeight.bold, color: color, fontFamily: 'Neucha'),
        ),
        if (equip > 0)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              '($base + $equip)',
              style: TextStyle(fontSize: 12, color: color.withOpacity(0.7), fontStyle: FontStyle.italic),
            ),
          ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 10, color: bronze, letterSpacing: 1.5, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF11100F).withOpacity(0.5),
        border: Border.all(color: bronze.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: TextStyle(fontSize: 9, color: bronze, letterSpacing: 0.5), overflow: TextOverflow.ellipsis),
                Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: GameTheme.lightSand, fontFamily: 'Neucha'), overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ],
      ),
    );
  }
}