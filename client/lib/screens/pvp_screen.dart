import 'dart:ui';
import 'package:flutter/material.dart';
import '../services/api_client.dart';
import '../services/session.dart';
import '../ui_kit.dart';

class PvPScreen extends StatefulWidget {
  const PvPScreen({super.key});

  @override
  State<PvPScreen> createState() => _PvPScreenState();
}

class _PvPScreenState extends State<PvPScreen> {
  Map<String, dynamic>? _target;
  bool _loading = false;

  final Color bronze = const Color(0xFF8B7D6B);

  Future<void> _findTarget() async {
    final charId = Session.characterId;
    if (charId == null) return;
    setState(() { _loading = true; _target = null; });

    try {
      final resp = await apiClient.findRaidTarget(charId);
      if (resp['success'] == true) {
        if (mounted) setState(() => _target = resp);
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Не удалось найти жертву в вашей зоне.'), backgroundColor: Colors.redAccent),
          );
        }
      }
    } catch (e) {
      debugPrint('Find target error: $e');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _attack() async {
    final charId = Session.characterId;
    if (charId == null || _target == null) return;

    setState(() => _loading = true);

    try {
      final resp = await apiClient.attackPlayer(charId, _target!['target_id']);
      if (resp['success'] == true) {
        final victory = resp['victory'] == true;
        final gold = resp['gold_stolen'] ?? 0;
        final myWall = resp['my_wall_level'] ?? 0;
        final enemyWall = resp['enemy_wall_level'] ?? 0;

        if (mounted) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              backgroundColor: const Color(0xFF1C1A19),
              title: Text(
                victory ? 'ПОБЕДА!' : 'ПОРАЖЕНИЕ...', 
                style: TextStyle(
                  color: victory ? Colors.greenAccent : Colors.redAccent,
                  fontFamily: 'Neucha',
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              content: Text(
                '${resp['message']}\n\n'
                'Ваша стена: $myWall\n'
                'Стена врага: $enemyWall\n'
                'Золото: ${victory ? '+' : '-'} $gold',
                style: const TextStyle(color: GameTheme.lightSand),
              ),
              actions: [
                TextButton(
                  onPressed: () { 
                    Navigator.pop(context); 
                    setState(() => _target = null); 
                  }, 
                  child: const Text('ОК', style: TextStyle(color: GameTheme.sandGold)),
                )
              ],
            )
          );
        }
      }
    } catch (e) {
      debugPrint('Attack error: $e');
    } finally {
      if (mounted) setState(() => _loading = false);
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
        title: Text('РЕЙД (PvP)', style: TextStyle(fontFamily: 'Neucha', color: GameTheme.sandGold, fontWeight: FontWeight.bold, fontSize: 24, letterSpacing: 2)),
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
                constraints: const BoxConstraints(maxWidth: 600),
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1A19),
                  border: Border.all(color: bronze, width: 2),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 20, spreadRadius: 5),
                  ],
                ),
                child: _loading 
                  ? const Center(child: CircularProgressIndicator(color: GameTheme.sandGold))
                  : _target == null 
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.travel_explore, size: 80, color: bronze),
                          const SizedBox(height: 20),
                          const Text(
                            'Зона поиска пуста',
                            style: TextStyle(fontSize: 22, fontFamily: 'Neucha', color: GameTheme.lightSand),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Найдите врага, чтобы отобрать его золото.',
                            style: TextStyle(fontSize: 14, color: Colors.grey, fontStyle: FontStyle.italic),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: _findTarget, 
                              style: ElevatedButton.styleFrom(
                                backgroundColor: GameTheme.sandGold,
                                foregroundColor: const Color(0xFF1C1A19),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                              ),
                              child: const Text('ИСКАТЬ ЦЕЛЬ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: 1.5)),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'ЦЕЛЬ ЗАХВАЧЕНА',
                            style: TextStyle(fontSize: 16, color: Colors.redAccent, letterSpacing: 4, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: const Color(0xFF11100F),
                              border: Border.all(color: bronze.withOpacity(0.5)),
                            ),
                            child: Column(
                              children: [
                                const Icon(Icons.gps_fixed, size: 48, color: Colors.redAccent),
                                const SizedBox(height: 12),
                                Text(
                                  _target!['target_name'],
                                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: GameTheme.lightSand, fontFamily: 'Neucha'),
                                ),
                                const SizedBox(height: 8),
                                Text('Уровень: ${_target!['target_level']}', style: TextStyle(color: bronze)),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        const Icon(Icons.shield, color: Colors.blueAccent, size: 24),
                                        const SizedBox(height: 4),
                                        Text('Стена: ${_target!['target_wall_level']}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        const Icon(Icons.monetization_on, color: GameTheme.sandGold, size: 24),
                                        const SizedBox(height: 4),
                                        Text('${_target!['target_gold']} зл.', style: const TextStyle(fontWeight: FontWeight.bold, color: GameTheme.sandGold)),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          
                          const SizedBox(height: 30),
                          
                          SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: ElevatedButton(
                              onPressed: _attack,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                elevation: 10,
                                shadowColor: Colors.redAccent.withOpacity(0.5),
                              ),
                              child: const Text('АТАКОВАТЬ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 2)),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextButton(
                            onPressed: _findTarget, 
                            child: Text('Искать другую цель', style: TextStyle(color: bronze)),
                          )
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}