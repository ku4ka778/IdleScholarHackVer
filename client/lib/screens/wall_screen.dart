import 'dart:ui';
import 'package:flutter/material.dart';
import '../services/api_client.dart';
import '../services/session.dart';
import '../ui_kit.dart';

class WallScreen extends StatefulWidget {
  const WallScreen({super.key});

  @override
  State<WallScreen> createState() => _WallScreenState();
}

class _WallScreenState extends State<WallScreen> {
  List<Map<String, dynamic>> _logs = [];
  int _wallLevel = 0;
  Map<String, int> _resources = {};
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
      final cityResp = await apiClient.getCity(charId);
      if (cityResp['success'] == true) {
        final upgrades = cityResp['upgrades'] as Map<String, dynamic>? ?? {};
        _wallLevel = (upgrades['wall'] as num?)?.toInt() ?? 0;
        
        final rawRes = (cityResp['resources'] as List<dynamic>?) ?? [];
        _resources = { 
          for (var r in rawRes) 
            if (r['resource_type'] != null && r['amount'] != null) 
              r['resource_type'] as String : (r['amount'] as num).toInt() 
        };
      }

      final logsResp = await apiClient.getRaidLogs(charId);
      debugPrint('RAID LOGS RESPONSE: $logsResp');
      
      if (logsResp['success'] == true) {
        final rawLogs = logsResp['logs'];
        if (rawLogs is List) {
          _logs = rawLogs.map((e) {
            final map = e as Map<String, dynamic>;
            return {
              'id': (map['id'] as num?)?.toInt() ?? 0,
              'raid_power': (map['raid_power'] as num?)?.toInt() ?? 0,
              'wall_defense': (map['wall_defense'] as num?)?.toInt() ?? 0,
              'resources_lost': (map['resources_lost'] as num?)?.toInt() ?? 0,
            };
          }).toList();
        } else {
          _logs = [];
        }
      } else {
        _logs = [];
      }

      if (mounted) setState(() => _loading = false);
    } catch (e, stackTrace) {
      debugPrint('Wall load error: $e');
      debugPrint('Stack: $stackTrace');
      if (mounted) setState(() => _loading = false);
    }
  }
  
  Future<void> _upgrade() async {
    final charId = Session.characterId;
    if (charId == null) return;

    try {
      final resp = await apiClient.upgradeBuilding(charId, 'wall');
      if (resp['success'] == true) {
        _load();
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(resp['message'] ?? 'Ошибка'), backgroundColor: Colors.redAccent),
          );
        }
      }
    } catch (e) {
      debugPrint('Upgrade error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final nextLevel = _wallLevel + 1;
    final woodCost = nextLevel * 50;
    final stoneCost = nextLevel * 30;

    final haveTwig = _resources['twig'] ?? 0;
    final haveStone = _resources['stone'] ?? 0;
    final canAfford = haveTwig >= woodCost && haveStone >= stoneCost;

    return Scaffold(
      backgroundColor: GameTheme.deepBlue,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: GameTheme.sandGold),
        title: Text('СТЕНА', style: TextStyle(fontFamily: 'Neucha', color: GameTheme.sandGold, fontWeight: FontWeight.bold, fontSize: 24, letterSpacing: 2)),
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
                constraints: const BoxConstraints(maxWidth: 800),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1A19),
                  border: Border.all(color: bronze, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: _loading
                    ? const Center(child: CircularProgressIndicator(color: GameTheme.sandGold))
                    : Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(20),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: const Color(0xFF11100F).withOpacity(0.7),
                              border: Border.all(color: bronze.withOpacity(0.4)),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.fort, color: GameTheme.sandGold, size: 36),
                                    const SizedBox(width: 16),
                                    Text(
                                      'УРОВЕНЬ СТЕНЫ: $_wallLevel',
                                      style: const TextStyle(fontFamily: 'Neucha', fontWeight: FontWeight.bold, fontSize: 22, color: GameTheme.lightSand),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        const Text('ТЕКУЩАЯ ЗАЩИТА', style: TextStyle(fontSize: 12, color: Colors.grey)),
                                        Text('${_wallLevel * 15}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.cyanAccent)),
                                      ],
                                    ),
                                    const Icon(Icons.arrow_forward, color: GameTheme.sandGold),
                                    Column(
                                      children: [
                                        const Text('СЛЕДУЮЩАЯ', style: TextStyle(fontSize: 12, color: Colors.grey)),
                                        Text('${nextLevel * 15}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.greenAccent)),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Divider(color: bronze.withOpacity(0.3)),
                                const SizedBox(height: 10),
                                const Text('Стоимость улучшения:', style: TextStyle(fontSize: 14, color: Colors.grey)),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    _buildCostChip(Icons.park, woodCost, haveTwig),
                                    const SizedBox(width: 16),
                                    _buildCostChip(Icons.landscape, stoneCost, haveStone),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  width: double.infinity,
                                  height: 45,
                                  child: ElevatedButton(
                                    onPressed: canAfford ? _upgrade : null,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: GameTheme.sandGold,
                                      foregroundColor: const Color(0xFF1C1A19),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                      disabledBackgroundColor: Colors.grey.shade800,
                                      disabledForegroundColor: Colors.grey,
                                    ),
                                    child: const Text('УЛУЧШИТЬ СТЕНУ', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('ПОСЛЕДНИЕ НАПАДЕНИЯ', style: TextStyle(color: bronze, fontSize: 14, letterSpacing: 2, fontWeight: FontWeight.bold)),
                            ),
                          ),
                          const SizedBox(height: 10),
                          
                          Expanded(
                            child: _logs.isEmpty
                                ? const Center(child: Text('Нападений еще не было', style: TextStyle(color: Colors.grey)))
                                : ListView.builder(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    itemCount: _logs.length,
                                    itemBuilder: (context, index) {
                                      final log = _logs[index];
                                      final lost = (log['resources_lost'] as num?)?.toInt() ?? 0;
                                      final raidPower = (log['raid_power'] as num?)?.toInt() ?? 0;
                                      final wallDefense = (log['wall_defense'] as num?)?.toInt() ?? 0;
                                      final isDefended = lost == 0;

                                      return Container(
                                        margin: const EdgeInsets.only(bottom: 12),
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF11100F).withOpacity(0.6),
                                          border: Border.all(color: bronze.withOpacity(0.3)),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              isDefended ? Icons.shield : Icons.whatshot,
                                              color: isDefended ? Colors.greenAccent : Colors.redAccent,
                                              size: 32,
                                            ),
                                            const SizedBox(width: 16),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    isDefended ? 'Атака отбита!' : 'Город разграблен!',
                                                    style: TextStyle(
                                                      fontFamily: 'Neucha',
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold,
                                                      color: isDefended ? Colors.greenAccent : Colors.redAccent,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Text(
                                                    'Сила рейда: $raidPower  |  Защита: $wallDefense',
                                                    style: TextStyle(fontSize: 12, color: bronze),
                                                  ),
                                                  if (!isDefended)
                                                    Text(
                                                      'Потеряно ресурсов: $lost',
                                                      style: const TextStyle(fontSize: 12, color: Colors.redAccent, fontWeight: FontWeight.bold),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
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

  Widget _buildCostChip(IconData icon, int required, int available) {
    final enough = available >= required;
    final color = enough ? Colors.greenAccent : Colors.redAccent;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        border: Border.all(color: color.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 6),
          Text('$available / $required', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
}