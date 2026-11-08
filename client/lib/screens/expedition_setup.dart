import 'dart:ui';
import 'package:flutter/material.dart';
import '../services/api_client.dart';
import '../services/session.dart';
import 'expedition_active_screen.dart';
import '../ui_kit.dart';

class ExpeditionSetupScreen extends StatefulWidget {
  final int locationIndex;
  final int activityType; 

  const ExpeditionSetupScreen({super.key, required this.locationIndex, this.activityType = 0});

  @override
  State<ExpeditionSetupScreen> createState() => _ExpeditionSetupScreenState();
}

class _ExpeditionSetupScreenState extends State<ExpeditionSetupScreen> {
  final _domainsController = TextEditingController(text: 'google.com, github.com');
  final _appsController = TextEditingController(text: 'emacs.exe, discord.exe');
  final _timeController = TextEditingController(text: '30');

  int _penaltyStacks = 0;
  int _penaltyExpires = 0;
  bool _loadingStatus = true;

  final Color bronze = const Color(0xFF8B7D6B);

  String _getActivityName() {
    switch (widget.activityType) {
      case 1: return 'Лесопилка';
      case 2: return 'Шахта';
      case 3: return 'Охота';
      default: return 'Кампания';
    }
  }

  @override
  void initState() {
    super.initState();
    _loadStatus();
  }

  Future<void> _loadStatus() async {
    final charId = Session.characterId;
    if (charId == null) return;

    try {
      final resp = await apiClient.getExpeditionStatus(charId);
      if (resp['success'] == true) {
        if (mounted) {
          setState(() {
            _penaltyStacks = resp['penalty_stacks'] ?? 0;
            _penaltyExpires = resp['penalty_expires'] ?? 0;
            _loadingStatus = false;
          });
        }
      }
    } catch (e) {
      debugPrint('Status load error: $e');
      if (mounted) setState(() => _loadingStatus = false);
    }
  }

  @override
  void dispose() {
    _domainsController.dispose();
    _appsController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  void _showError(String msg) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(msg), backgroundColor: Colors.redAccent),
      );
    }
  }

  Future<void> _startExpedition() async {
    final domainsText = _domainsController.text;
    final appsText = _appsController.text;
    
    int duration = int.tryParse(_timeController.text) ?? 30;
    if (duration <= 0) duration = 30;

    final charId = Session.characterId;
    if (charId == null) {
      _showError('No character selected. Please login again.');
      return;
    }

    setState(() => _loadingStatus = true);

    try {
      final resp = await apiClient.startExpedition(
        characterId: charId,
        durationMinutes: duration,
        activityType: widget.activityType,
        activityLevel: widget.locationIndex,
        allowedDomains: domainsText.split(',').map((e) => e.trim()).toList(),
        allowedApps: appsText.split(',').map((e) => e.trim()).toList(),
      );

      if (resp['success'] != true) {
        _showError(resp['message'] ?? 'Ошибка старта экспедиции');
        if (mounted) setState(() => _loadingStatus = false);
        return;
      }

      if (mounted) {
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(
            settings: const RouteSettings(name: '/expedition'),
            builder: (context) => ExpeditionActiveScreen(
              locationIndex: widget.locationIndex,
              activityType: widget.activityType,
              durationMinutes: duration,
              domains: domainsText,
              apps: appsText,
            )
          )
        );
      }
    } catch (e) {
      _showError('Ошибка: $e');
      if (mounted) setState(() => _loadingStatus = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final penaltyPercent = (_penaltyStacks * 20).clamp(0, 80);

    return Scaffold(
      backgroundColor: GameTheme.deepBlue,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: GameTheme.sandGold),
        title: Text(
          '${_getActivityName()} (Локация ${widget.locationIndex})',
          style: TextStyle(fontFamily: 'Neucha', color: GameTheme.sandGold, fontWeight: FontWeight.bold, fontSize: 22, letterSpacing: 1),
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
                child: _loadingStatus 
                  ? const Center(child: CircularProgressIndicator(color: GameTheme.sandGold))
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (_penaltyExpires > 0) ...[
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.1), 
                                border: Border.all(color: Colors.redAccent),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    children: [
                                      Icon(Icons.warning, color: Colors.redAccent),
                                      SizedBox(width: 8),
                                      Text('ШТРАФ ДЕЗЕРТИРА', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, letterSpacing: 1)),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text('Золото и опыт снижены на $penaltyPercent%', style: const TextStyle(color: GameTheme.lightSand)),
                                  Text('Осталось вылазок до снятия: $_penaltyExpires', style: const TextStyle(color: GameTheme.lightSand, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                          ],

                          _buildLabel('ВРЕМЯ ВЫЛАЗКИ (МИНУТЫ)'),
                          _buildTextField(_timeController, keyboardType: TextInputType.number),
                          
                          const SizedBox(height: 20),
                          
                          _buildLabel('РАЗРЕШЕННЫЕ ДОМЕНЫ (ЧЕРЕЗ ЗАПЯТУЮ)'),
                          _buildTextField(_domainsController),
                          
                          const SizedBox(height: 20),
                          
                          _buildLabel('РАЗРЕШЕННЫЕ ПРОЦЕССЫ (ЧЕРЕЗ ЗАПЯТУЮ)'),
                          _buildTextField(_appsController),
                          
                          const SizedBox(height: 40),
                          
                          SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: ElevatedButton(
                              onPressed: _startExpedition,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: GameTheme.sandGold,
                                foregroundColor: const Color(0xFF1C1A19),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                elevation: 5,
                                shadowColor: GameTheme.sandGold.withOpacity(0.5),
                              ),
                              child: const Text('НАЧАТЬ ВЫЛАЗКУ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 2)),
                            ),
                          ),
                        ],
                      ),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        text,
        style: TextStyle(color: bronze, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.5),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, {TextInputType? keyboardType}) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(color: GameTheme.lightSand, fontSize: 16),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF11100F),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: bronze.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: GameTheme.sandGold),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}