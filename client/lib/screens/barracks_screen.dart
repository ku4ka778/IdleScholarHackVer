import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import '../services/api_client.dart';
import '../services/session.dart';
import '../ui_kit.dart';

class BarracksScreen extends StatefulWidget {
  const BarracksScreen({super.key});

  @override
  State<BarracksScreen> createState() => _BarracksScreenState();
}

class _BarracksScreenState extends State<BarracksScreen> {
  int _endTime = 0;
  Timer? _timer;
  bool _loading = true;

  final Color bronze = const Color(0xFF8B7D6B);

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _load() async {
    final charId = Session.characterId;
    if (charId == null) return;

    try {
      final resp = await apiClient.getCharacter(charId);
      if (resp['id'] != null) {
        if (mounted) {
          setState(() {
            _endTime = (resp['barracks_end'] as num?)?.toInt() ?? 0;
            _loading = false;
          });
        }
        _startTimer();
      }
    } catch (e) {
      debugPrint('Barracks load error: $e');
      if (mounted) setState(() => _loading = false);
    }
  }

  void _startTimer() {
    _timer?.cancel();
    if (_endTime > DateTime.now().millisecondsSinceEpoch ~/ 1000) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (!mounted) return;
        setState(() {});
      });
    }
  }

  Future<void> _start() async {
    final charId = Session.characterId;
    if (charId == null) return;

    try {
      final resp = await apiClient.startBarracks(charId);
      if (resp['success'] == true) {
        setState(() => _endTime = (resp['end_time'] as num).toInt());
        _startTimer();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Отряд отправлен на 8 часов'), backgroundColor: Colors.green),
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
      debugPrint('Start error: $e');
    }
  }

  Future<void> _claim() async {
    final charId = Session.characterId;
    if (charId == null) return;

    try {
      final resp = await apiClient.claimBarracks(charId);
      if (resp['success'] == true) {
        final gold = resp['gold_earned'] ?? 0;
        setState(() => _endTime = 0);
        _timer?.cancel();
        if (mounted) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              backgroundColor: const Color(0xFF1C1A19),
              title: const Text('Награда получена!', style: TextStyle(color: GameTheme.sandGold, fontFamily: 'Neucha')),
              content: Text('Ваш отряд вернулся с золотом: +$gold', style: const TextStyle(color: GameTheme.lightSand)),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context), 
                  child: const Text('OK', style: TextStyle(color: GameTheme.sandGold))
                )
              ],
            )
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
      debugPrint('Claim error: $e');
    }
  }

  String _formatTime(int totalSeconds) {
    final hours = (totalSeconds ~/ 3600).toString().padLeft(2, '0');
    final minutes = ((totalSeconds % 3600) ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final isRunning = _endTime > now;
    final remaining = isRunning ? _endTime - now : 0;

    return Scaffold(
      backgroundColor: GameTheme.deepBlue,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: GameTheme.sandGold),
        title: Text('КАЗАРМА', style: TextStyle(fontFamily: 'Neucha', color: GameTheme.sandGold, fontWeight: FontWeight.bold, fontSize: 24, letterSpacing: 2)),
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
                padding: const EdgeInsets.all(40),
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
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.shield, color: GameTheme.sandGold, size: 64),
                          const SizedBox(height: 20),
                          
                          Text(
                            isRunning ? 'ОТРЯД В ПОХОДЕ' : (_endTime != 0 ? 'ОТРЯД ВЕРНУЛСЯ' : 'КАЗАРМА'),
                            style: TextStyle(
                              fontFamily: 'Neucha',
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: _endTime != 0 && !isRunning ? Colors.greenAccent : GameTheme.lightSand,
                              letterSpacing: 2,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Divider(color: bronze.withOpacity(0.3)),
                          const SizedBox(height: 30),

                          if (isRunning) ...[
                            Text(
                              _formatTime(remaining), 
                              style: const TextStyle(fontFamily: 'monospace', fontSize: 56, fontWeight: FontWeight.bold, color: Colors.cyanAccent),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Ваши бойцы собирают золото.\nВозвращайтесь позже.',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
                            ),
                          ] else if (_endTime != 0) ...[
                            const Text(
                              'Поход завершен. Заберите заработанное золото!',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: GameTheme.lightSand, fontSize: 16),
                            ),
                            const SizedBox(height: 30),
                            SizedBox(
                              width: double.infinity,
                              height: 60,
                              child: ElevatedButton(
                                onPressed: _claim,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                  elevation: 10,
                                  shadowColor: Colors.greenAccent.withOpacity(0.5),
                                ),
                                child: const Text('ЗАБРАТЬ НАГРАДУ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: 2)),
                              ),
                            ),
                          ] else ...[
                            const Text(
                              'Отправьте отряд на 8 часов за золотом. Чем выше уровень казармы, тем больше прибыль.',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 40),
                            SizedBox(
                              width: double.infinity,
                              height: 60,
                              child: ElevatedButton(
                                onPressed: _start,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: GameTheme.sandGold,
                                  foregroundColor: const Color(0xFF1C1A19),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                ),
                                child: const Text('ОТПРАВИТЬ ОТРЯД', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: 2)),
                              ),
                            ),
                          ],
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