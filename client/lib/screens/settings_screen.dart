import 'dart:ui';
import 'package:flutter/material.dart';
import '../services/api_client.dart';
import '../services/session.dart';
import 'map_screen.dart';
import '../ui_kit.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _levelController = TextEditingController(text: '60');
  final _goldController = TextEditingController(text: '1000000');
  bool _loading = false;

  final Color bronze = const Color(0xFF8B7D6B);

  @override
  void dispose() {
    _levelController.dispose();
    _goldController.dispose();
    super.dispose();
  }

  Future<void> _applyCheats() async {
    final charId = Session.characterId;
    if (charId == null) return;

    final level = int.tryParse(_levelController.text) ?? 60;
    final gold = int.tryParse(_goldController.text) ?? 1000000;

    setState(() => _loading = true);
    try {
      final resp = await apiClient.cheatGiveAll(charId, level, gold);
      if (resp['success'] == true) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(resp['message'] ?? 'Читы применены!'), backgroundColor: Colors.green),
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
      debugPrint('Cheat error: $e');
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
        title: Text('НАСТРОЙКИ', style: TextStyle(fontFamily: 'Neucha', color: GameTheme.sandGold, fontWeight: FontWeight.bold, fontSize: 24, letterSpacing: 2)),
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
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.redAccent.withOpacity(0.05),
                        border: Border.all(color: Colors.redAccent.withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.warning_amber_rounded, color: Colors.redAccent, size: 28),
                              SizedBox(width: 12),
                              Text('ЧИТ-МЕНЮ', style: TextStyle(color: Colors.redAccent, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Neucha', letterSpacing: 1.5)),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Этот раздел выдает все предметы, 10к каждого ресурса и прокачивает город до 10 уровня.',
                            style: TextStyle(fontSize: 12, color: bronze),
                          ),
                          const SizedBox(height: 24),

                          _buildLabel('УРОВЕНЬ ПЕРСОНАЖА (1-60)'),
                          _buildTextField(_levelController),
                          
                          const SizedBox(height: 16),
                          
                          _buildLabel('КОЛИЧЕСТВО ЗОЛОТА'),
                          _buildTextField(_goldController),

                          const SizedBox(height: 24),

                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: _loading ? null : _applyCheats,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                disabledBackgroundColor: Colors.grey.shade800,
                              ),
                              child: _loading 
                                ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                                : const Text('ВЫДАТЬ ВСЁ И ПРОКАЧАТЬСЯ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1)),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Spacer(),

                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => const LocationSelectScreen()),
                            (route) => false,
                          );
                        },
                        icon: const Icon(Icons.exit_to_app, color: Colors.redAccent),
                        label: const Text('ВЫЙТИ ИЗ АККАУНТА', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, letterSpacing: 1)),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.redAccent),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        ),
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

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        text,
        style: TextStyle(color: bronze, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.5),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
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