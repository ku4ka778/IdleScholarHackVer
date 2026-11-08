import 'dart:ui';
import 'package:flutter/material.dart';
import '../services/api_client.dart';
import '../services/session.dart';
import '../ui_kit.dart';

class TalentsScreen extends StatefulWidget {
  const TalentsScreen({super.key});

  @override
  State<TalentsScreen> createState() => _TalentsScreenState();
}

class _TalentsScreenState extends State<TalentsScreen> with SingleTickerProviderStateMixin {
  int _points = 0;
  Map<String, int> _talents = {};
  bool _loading = true;
  
  late TabController _tabController;
  final Color bronze = const Color(0xFF8B7D6B);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _load();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    final charId = Session.characterId;
    if (charId == null) return;

    setState(() => _loading = true);
    try {
      final resp = await apiClient.getTalents(charId);
      if (resp['success'] == true) {
        final rawTalents = resp['talents'] as Map<String, dynamic>? ?? {};
        setState(() {
          _points = resp['talent_points'] ?? 0;
          _talents = rawTalents.map((key, value) => MapEntry(key, (value as num).toInt()));
          _loading = false;
        });
      }
    } catch (e) {
      debugPrint('Error: $e');
      setState(() => _loading = false);
    }
  }

  Future<void> _upgrade(String id) async {
    final charId = Session.characterId;
    if (charId == null) return;

    try {
      final resp = await apiClient.upgradeTalent(charId, id);
      if (resp['success'] == true) {
        int currentTab = _tabController.index;
        await _load();
        if (mounted) {
          _tabController.animateTo(currentTab);
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(resp['message'] ?? 'Error'), backgroundColor: Colors.redAccent),
          );
        }
      }
    } catch (e) {
      debugPrint('Upgrade error: $e');
    }
  }

  Widget _buildTalentRow(String id, String title, String desc, String reqId) {
    final level = _talents[id] ?? 0;
    final reqLevel = _talents[reqId] ?? 0;
    
    bool isUnlocked = reqId.isEmpty || reqLevel >= 5; 
    if (id.endsWith("_3") || id.endsWith("_4")) {
      isUnlocked = reqLevel >= 5;
    }

    final isMax = level >= 5;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isUnlocked ? const Color(0xFF1C1A19) : const Color(0xFF11100F).withOpacity(0.5),
        border: Border.all(
          color: isMax ? GameTheme.sandGold : (isUnlocked ? bronze.withOpacity(0.4) : Colors.grey.withOpacity(0.1)),
          width: isMax ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: isMax ? GameTheme.sandGold.withOpacity(0.1) : Colors.transparent,
              border: Border.all(color: isMax ? GameTheme.sandGold : (isUnlocked ? bronze : Colors.grey.withOpacity(0.3))),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: isMax 
                ? const Icon(Icons.star, color: GameTheme.sandGold, size: 24)
                : Text(
                    '$level/5', 
                    style: TextStyle(
                      color: isUnlocked ? GameTheme.lightSand : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            ),
          ),
          const SizedBox(width: 16),
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Neucha',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isUnlocked ? GameTheme.lightSand : Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  isUnlocked ? desc : 'Требуется прокачать предыдущий талант',
                  style: TextStyle(
                    fontSize: 12,
                    color: isUnlocked ? bronze : Colors.grey.withOpacity(0.5),
                    fontStyle: isUnlocked ? FontStyle.normal : FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),

          if (isUnlocked)
            SizedBox(
              width: 60,
              height: 40,
              child: ElevatedButton(
                onPressed: (_points > 0 && !isMax) ? () => _upgrade(id) : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isMax ? Colors.transparent : GameTheme.sandGold,
                  foregroundColor: const Color(0xFF1C1A19),
                  side: isMax ? const BorderSide(color: Colors.transparent) : BorderSide.none,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                ),
                child: Text(
                  isMax ? 'MAX' : '+1',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isMax ? GameTheme.sandGold : const Color(0xFF1C1A19),
                  ),
                ),
              ),
            )
          else
            const Icon(Icons.lock, color: Colors.grey, size: 20),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        backgroundColor: GameTheme.deepBlue,
        body: Center(child: CircularProgressIndicator(color: GameTheme.sandGold)),
      );
    }

    return Scaffold(
      backgroundColor: GameTheme.deepBlue,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: GameTheme.sandGold),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'ДРЕВО НАВЫКОВ', 
          style: TextStyle(fontFamily: 'Neucha', color: GameTheme.sandGold, fontWeight: FontWeight.bold, fontSize: 24, letterSpacing: 2),
        ),
        actions: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF1C1A19),
                border: Border.all(color: GameTheme.sandGold, width: 1.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(Icons.auto_awesome, color: GameTheme.sandGold, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    'Очки: $_points',
                    style: const TextStyle(color: GameTheme.lightSand, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
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
                        indicatorColor: GameTheme.sandGold,
                        indicatorWeight: 3,
                        labelColor: GameTheme.sandGold,
                        unselectedLabelColor: bronze.withOpacity(0.5),
                        labelStyle: const TextStyle(fontFamily: 'Neucha', fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1),
                        unselectedLabelStyle: const TextStyle(fontFamily: 'Neucha', fontSize: 16),
                        dividerColor: Colors.transparent,
                        tabs: const [
                          Tab(text: 'СИЛАЧ'),
                          Tab(text: 'ЛОВКАЧ'),
                          Tab(text: 'ИНТЕЛЛЕКТ'),
                          Tab(text: 'ВЕЗУНЧИК'),
                        ],
                      ),
                    ),

                    Expanded(
                      child: TabBarView(
                        controller: _tabController, 
                        children: [
                          _buildTalentTab([
                            _buildTalentRow('str_1', 'Повышает лут', '+5% ресурсов', ''),
                            _buildTalentRow('str_2', 'Уменьшает дебаффы', '-10% к силе штрафа', 'str_1'),
                            _buildTalentRow('str_3', 'Пассивная сила', '+1 к Силе', 'str_2'),
                            _buildTalentRow('str_4', 'Крепкий хват', '+2% к Защите за 10 Силы', 'str_3'),
                            _buildTalentRow('str_5', 'Прочность стен', '+10% к Стене (PvP)', 'str_4'),
                            _buildTalentRow('str_6', 'Избегание дебаффа', '+5% шанс не получить штраф', 'str_5'),
                          ]),
                          _buildTalentTab([
                            _buildTalentRow('dex_1', 'Снижение шанса дебаффа', '-5% шанс штрафа', ''),
                            _buildTalentRow('dex_2', 'Снижение штрафа', '-2% к силе штрафа', 'dex_1'),
                            _buildTalentRow('dex_3', 'Пассивная ловкость', '+1 к Ловкости', 'dex_2'),
                            _buildTalentRow('dex_4', 'Экономия ресурсов', '-2% к цене крафта', 'dex_3'),
                            _buildTalentRow('dex_5', 'Спринт', '-1 сек к циклу', 'dex_4'),
                            _buildTalentRow('dex_6', 'Доп. лут', '+10% лута при коротких вылазках', 'dex_5'),
                          ]),
                          _buildTalentTab([
                            _buildTalentRow('int_1', 'Опыт', '+5% к опыту', ''),
                            _buildTalentRow('int_2', 'Длительность баффов', '+10% к еде', 'int_1'),
                            _buildTalentRow('int_3', 'Пассивный интеллект', '+1 к Интеллекту', 'int_2'),
                            _buildTalentRow('int_4', 'Анализ', '+5% шанс двойного крафта', 'int_3'),
                            _buildTalentRow('int_5', 'Снижение стоимости зданий', '-3% к цене апгрейдов', 'int_4'),
                          ]),
                          _buildTalentTab([
                            _buildTalentRow('luck_1', 'Редкий лут', '+2% к шансу дропа', ''),
                            _buildTalentRow('luck_2', 'Избежать рейда', '+5% шанс, что рейд не сработает', 'luck_1'),
                            _buildTalentRow('luck_3', 'Пассивная удача', '+1 к Удаче', 'luck_2'),
                            _buildTalentRow('luck_4', 'Второй шанс', '+10% шанс сохранить награду при проигрыше Эху', 'luck_3'),
                            _buildTalentRow('luck_5', 'Меньше потерь', '-10% к потере ресурсов от рейда', 'luck_4'),
                          ]),
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
    );
  }

  Widget _buildTalentTab(List<Widget> talents) {
    return ListView(
      padding: const EdgeInsets.all(30),
      children: talents,
    );
  }
}
