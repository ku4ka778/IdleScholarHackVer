import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../services/api_client.dart';
import '../services/session.dart';
import '../ui_kit.dart';

class ExpeditionActiveScreen extends StatefulWidget {
  final int locationIndex;
  final int durationMinutes;
  final int activityType;
  final String domains;
  final String apps;

  const ExpeditionActiveScreen({
    super.key,
    required this.locationIndex,
    required this.durationMinutes,
    required this.activityType,
    required this.domains,
    required this.apps,
  });

  @override
  State<ExpeditionActiveScreen> createState() => _ExpeditionActiveScreenState();
}

class _ExpeditionActiveScreenState extends State<ExpeditionActiveScreen>
    with WidgetsBindingObserver {
  Timer? _heartbeatTimer;
  Timer? _uiTimer;

  int _remainingSeconds = 0;
  int _totalGoldEarned = 0;
  int _totalExpEarned = 0;
  int _currentLevel = 1;
  int _goldBonus = 0;
  int _luckBonus = 0;
  int _penaltyReduction = 0;
  int _strBonusAtk = 0;
  int _dexCycleReduction = 0;
  int _intExpBonus = 0;
  List<String> _allLoot = [];
  List<String> _logs = [];

  bool _isPaused = false;
  bool _isExpeditionStarted = false;

  final Color bronze = const Color(0xFF8B7D6B);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _remainingSeconds = widget.durationMinutes * 60;
    _isExpeditionStarted = true;
    _startUiTimer();
    _startExpedition();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _heartbeatTimer?.cancel();
    _uiTimer?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!_isExpeditionStarted) return;

    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive ||
        state == AppLifecycleState.hidden) {
      if (!_isPaused) {
        setState(() {
          _isPaused = true;
          _addLog('FOCUS LOST! Expedition paused. Return to resume.');
        });
        _pauseTimers();

        final charId = Session.characterId;
        if (charId != null) {
          apiClient
              .pauseExpedition(charId)
              .catchError((e) => debugPrint('Pause error: $e'));
        }
      }
    } else if (state == AppLifecycleState.resumed) {
      if (_isPaused) {
        final charId = Session.characterId;
        if (charId != null) {
          apiClient
              .resumeExpedition(charId)
              .then((resp) {
                if (resp['success'] == true) {
                  if (mounted) {
                    setState(() {
                      _isPaused = false;
                      _remainingSeconds =
                          (resp['remaining_seconds'] as num?)?.toInt() ??
                          _remainingSeconds;
                      _addLog('Focus restored. Expedition resumed.');
                    });
                  }
                  _resumeTimers();
                }
              })
              .catchError((e) {
                debugPrint('Resume error: $e');
                if (mounted) setState(() => _isPaused = false);
                _resumeTimers();
              });
        }
      }
    }
  }

  void _pauseTimers() {
    _uiTimer?.cancel();
    _heartbeatTimer?.cancel();
  }

  void _resumeTimers() {
    _startUiTimer();
    _startHeartbeatTimer();
  }

  Future<void> _startExpedition() async {
    final charId = Session.characterId;
    if (charId == null) {
      _addLog('Error: No character selected.');
      return;
    }

    try {
      final domainsList = widget.domains
          .split(',')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList();
      final appsList = widget.apps
          .split(',')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList();

      final resp = await apiClient.startExpedition(
        characterId: charId,
        durationMinutes: widget.durationMinutes,
        activityType: widget.activityType,
        activityLevel: widget.locationIndex,
        allowedDomains: domainsList,
        allowedApps: appsList,
      );

      if (resp['success'] != true) {
        _addLog('Server error: ${resp['message']}');
        return;
      }

      if (mounted) {
        setState(() {
          _goldBonus = resp['total_gold_bonus_pct'] ?? 0;
          _luckBonus = resp['total_luck_bonus_pct'] ?? 0;
          _penaltyReduction = resp['penalty_reduction_pct'] ?? 0;
          _strBonusAtk = resp['str_bonus_atk'] ?? 0;
          _dexCycleReduction = resp['dex_cycle_reduction'] ?? 0;
          _intExpBonus = resp['int_exp_bonus_pct'] ?? 0;
          _isExpeditionStarted = true;
        });
      }

      _addLog('Expedition started. Focus mode active. Do not leave the tab!');
      _startHeartbeatTimer();
    } catch (e) {
      _addLog('Start error: $e');
    }
  }

    void _startUiTimer() {
    if (_uiTimer != null && _uiTimer!.isActive) return;

    _uiTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted || _isPaused) return;
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  void _startHeartbeatTimer() {
    _heartbeatTimer?.cancel();
    _heartbeatTimer = Timer.periodic(const Duration(seconds: 30), (
      timer,
    ) async {
      if (_isPaused) return;

      final charId = Session.characterId;
      if (charId == null) return;

      try {
        final hbResp = await apiClient.sendHeartbeat(charId);

        if ((hbResp['gold_gained'] ?? 0) > 0 ||
            (hbResp['items_gained'] as List? ?? []).isNotEmpty) {
          if (mounted) {
            setState(() {
              _totalGoldEarned += (hbResp['gold_gained'] as num? ?? 0).toInt();
              _totalExpEarned += (hbResp['exp_gained'] as num? ?? 0).toInt();
              _allLoot.addAll(List<String>.from(hbResp['items_gained'] ?? []));

              _addLog(
                'Cycle complete: +${hbResp['gold_gained']} Gold, +${hbResp['exp_gained']} EXP.',
              );
              if ((hbResp['items_gained'] as List? ?? []).isNotEmpty) {
                _addLog('Loot: ${(hbResp['items_gained'] as List).join(", ")}');
              }
              if ((hbResp['new_level'] ?? 0) > 0 &&
                  hbResp['new_level'] != _currentLevel) {
                _currentLevel = hbResp['new_level'];
                _addLog('LEVEL UP! You are now level $_currentLevel');
              }
            });
          }
        }

        if (hbResp['is_active'] != true) {
          timer.cancel();
          _uiTimer?.cancel();

          if (hbResp['message'] == 'FOCUS_LOST') {
            if (mounted) {
              _showFocusLostDialog(hbResp);
            }
          } else {
            _finishExpedition();
          }
        }
      } catch (e) {
        _addLog('Heartbeat error: $e');
      }
    });
  }

  void _showFocusLostDialog(Map<String, dynamic> hbResp) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF1C1A19),
        title: const Text(
          'FOCUS LOST',
          style: TextStyle(color: Colors.redAccent, fontFamily: 'Neucha'),
        ),
        content: Text(
          'You left the focus mode.\n\n'
          'Earned: ${hbResp['gold_gained']} Gold, ${hbResp['exp_gained']} EXP.\n'
          'Rewards were reduced by 50%.\n\n'
          'You have received a Deserter Penalty.',
          style: const TextStyle(color: GameTheme.lightSand),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text(
              'Return',
              style: TextStyle(color: GameTheme.sandGold),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _finishExpedition() async {
    final charId = Session.characterId;
    if (charId == null) return;

    _heartbeatTimer?.cancel();
    _uiTimer?.cancel();

    try {
      final finishResp = await apiClient.finishExpedition(charId);

      if (finishResp['success'] == true) {
        if (mounted) {
          setState(() {
            _totalGoldEarned += (finishResp['gold_gained'] as num? ?? 0)
                .toInt();
            _totalExpEarned += (finishResp['exp_gained'] as num? ?? 0).toInt();
            _allLoot.addAll(
              List<String>.from(finishResp['items_gained'] ?? []),
            );
            _addLog('Expedition finished successfully.');
          });
        }

        final echoTriggered = finishResp['echo_triggered'] == true;
        final echoDefeated = finishResp['echo_defeated'] == true;
        final blizzardTriggered = finishResp['blizzard_triggered'] == true;
        final blizzardLost = (finishResp['blizzard_gold_lost'] as num? ?? 0)
            .toInt();
        final echoGoldLost = (finishResp['echo_gold_lost'] as num? ?? 0)
            .toInt();
        final echoExpLost = (finishResp['echo_exp_lost'] as num? ?? 0).toInt();
        final resonanceTriggered = finishResp['resonance_triggered'] == true;
        final resonancePositive = finishResp['resonance_positive'] == true;

        String lootText =
            'Добыча:\n'
            'Золото: $_totalGoldEarned\n'
            'Опыт: $_totalExpEarned\n'
            'Предметы: ${_allLoot.join(", ")}';

        if (mounted) {
          if (echoTriggered) {
            _showResultDialog(
              echoDefeated ? 'Вы победили Эхо!' : 'Вы проиграли Эху...',
              echoDefeated ? Colors.greenAccent : Colors.redAccent,
              echoDefeated
                  ? 'Ваше эхо рассеялось.\n\n$lootText'
                  : 'Ваше эхо оказалось сильнее.\n\nПотеряно:\nЗолото: $echoGoldLost\nОпыт: $echoExpLost\n\n$lootText',
            );
          } else if (blizzardTriggered) {
            _showResultDialog(
              'Метель!',
              Colors.blueAccent,
              'Началась метель.\nВы потеряли 30% добычи!\n\nПотеряно золота: $blizzardLost\n\nСовет: Еда в Трактире защищает от Метели.',
            );
          } else if (resonanceTriggered) {
            _showResultDialog(
              resonancePositive
                  ? 'Магический Резонанс!'
                  : 'Резонанс нестабилен!',
              resonancePositive ? Colors.purpleAccent : Colors.redAccent,
              resonancePositive
                  ? 'Энергия Архимага усилила вашу добычу в 3 раза!\n\n$lootText'
                  : 'Энергия вышла из-под контроля. Вы потеряли половину наград.\n\n$lootText',
            );
          } else {
            _showResultDialog(
              'Экспедиция завершена',
              GameTheme.sandGold,
              lootText,
            );
          }
        }
      }
    } catch (e) {
      _addLog('Finish error: $e');
    }
  }

  void _showResultDialog(String title, Color titleColor, String content) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF1C1A19),
        title: Text(
          title,
          style: TextStyle(
            color: titleColor,
            fontFamily: 'Neucha',
            fontSize: 24,
          ),
        ),
        content: Text(
          content,
          style: const TextStyle(color: GameTheme.lightSand),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text(
              'Забрать',
              style: TextStyle(color: GameTheme.sandGold),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _manualStop() async {
    final charId = Session.characterId;
    if (charId == null) return;

    _heartbeatTimer?.cancel();
    _uiTimer?.cancel();

    bool penaltyApplied = false;

    try {
      final resp = await apiClient.stopExpedition(charId);
      penaltyApplied = resp['penalty_applied'] ?? false;
    } catch (e) {
      debugPrint('Stop error: $e');
    }

    if (mounted) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: const Color(0xFF1C1A19),
          title: Text(
            penaltyApplied ? 'Expedition Failed' : 'Expedition Stopped',
            style: TextStyle(
              color: penaltyApplied ? Colors.redAccent : GameTheme.sandGold,
              fontFamily: 'Neucha',
            ),
          ),
          content: Text(
            penaltyApplied
                ? 'You left the expedition early. A Deserter Penalty has been applied to your next expeditions (reduced Gold and EXP).'
                : 'You stopped the expedition before the first cycle. No penalty has been applied.',
            style: const TextStyle(color: GameTheme.lightSand),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text(
                'OK',
                style: TextStyle(color: GameTheme.sandGold),
              ),
            ),
          ],
        ),
      );
    }
  }

  void _addLog(String message) {
    if (!mounted) return;
    setState(() {
      _logs.insert(0, '[${_formatTime(_remainingSeconds)}] $message');
      if (_logs.length > 50) _logs.removeLast();
    });
  }

  String _formatTime(int totalSeconds) {
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GameTheme.deepBlue,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'ВЫЛАЗКА',
          style: TextStyle(
            fontFamily: 'Neucha',
            color: GameTheme.sandGold,
            fontWeight: FontWeight.bold,
            fontSize: 24,
            letterSpacing: 2,
          ),
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
                constraints: const BoxConstraints(maxWidth: 800),
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1A19),
                  border: Border.all(color: bronze, width: 2),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      _formatTime(_remainingSeconds),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 72,
                        fontWeight: FontWeight.bold,
                        color: _isPaused ? Colors.grey : GameTheme.sandGold,
                        shadows: _isPaused
                            ? []
                            : [
                                Shadow(
                                  color: GameTheme.sandGold.withOpacity(0.5),
                                  blurRadius: 20,
                                ),
                              ],
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.withOpacity(0.1),
                        border: Border.all(color: Colors.blueAccent.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.info_outline, color: Colors.blueAccent, size: 16),
                          SizedBox(width: 8),
                          Text(
                            'Режим симуляции для Web-версии',
                            style: TextStyle(color: Colors.blueAccent, fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatPill(
                          Icons.monetization_on,
                          '$_totalGoldEarned',
                          Colors.amber,
                        ),
                        _buildStatPill(
                          Icons.stars,
                          '$_totalExpEarned',
                          Colors.cyanAccent,
                        ),
                      ],
                    ),

                    if (_goldBonus > 0 ||
                        _luckBonus > 0 ||
                        _penaltyReduction > 0 ||
                        _strBonusAtk > 0 ||
                        _dexCycleReduction > 0 ||
                        _intExpBonus > 0)
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 12,
                          runSpacing: 8,
                          children: [
                            if (_goldBonus > 0)
                              _buildBuffText(
                                '+$_goldBonus% Gold',
                                Colors.greenAccent,
                              ),
                            if (_luckBonus > 0)
                              _buildBuffText(
                                '+$_luckBonus% Luck',
                                Colors.orangeAccent,
                              ),
                            if (_penaltyReduction > 0)
                              _buildBuffText(
                                '-$_penaltyReduction% Penalty',
                                Colors.blueAccent,
                              ),
                            if (_strBonusAtk > 0)
                              _buildBuffText(
                                '+$_strBonusAtk ATK',
                                Colors.redAccent,
                              ),
                            if (_dexCycleReduction > 0)
                              _buildBuffText(
                                '-$_dexCycleReduction sec',
                                Colors.cyanAccent,
                              ),
                            if (_intExpBonus > 0)
                              _buildBuffText(
                                '+$_intExpBonus% EXP',
                                Colors.purpleAccent,
                              ),
                          ],
                        ),
                      ),

                    const SizedBox(height: 24),
                    Divider(color: bronze.withOpacity(0.3)),
                    const SizedBox(height: 12),

                    Text(
                      'ЖУРНАЛ СОБЫТИЙ',
                      style: TextStyle(
                        color: bronze,
                        fontSize: 12,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF11100F),
                          border: Border.all(color: bronze.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: ListView.builder(
                          itemCount: _logs.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4.0,
                              ),
                              child: Text(
                                _logs[index],
                                style: const TextStyle(
                                  fontFamily: 'monospace',
                                  fontSize: 13,
                                  color: GameTheme.lightSand,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _manualStop,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent.withOpacity(0.2),
                          foregroundColor: Colors.redAccent,
                          side: const BorderSide(color: Colors.redAccent),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: const Text(
                          'ПРЕРВАТЬ ВЫЛАЗКУ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          if (_isPaused)
            Positioned.fill(
                child: Container(
                  color: Colors.red.withOpacity(0.3),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.warning_amber_rounded,
                          color: Colors.redAccent,
                          size: 100,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'FOCUS LOST',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 4,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Вернитесь на эту вкладку, чтобы продолжить.',
                          style: TextStyle(color: Colors.white, fontSize: 18),
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

  Widget _buildStatPill(IconData icon, String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF11100F),
        border: Border.all(color: color.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
              fontFamily: 'Neucha',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBuffText(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        border: Border.all(color: color.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
