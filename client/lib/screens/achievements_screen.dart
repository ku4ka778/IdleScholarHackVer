import 'dart:ui';
import 'package:flutter/material.dart';
import '../services/api_client.dart';
import '../services/session.dart';
import '../ui_kit.dart'; 

class AchievementsScreen extends StatefulWidget {
  const AchievementsScreen({super.key});

  @override
  State<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> {
  List<Map<String, dynamic>> _achievements = [];
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
      final resp = await apiClient.getAchievements(charId);
      if (resp['success'] == true) {
        setState(() {
          _achievements = (resp['achievements'] as List<dynamic>?)?.cast<Map<String, dynamic>>() ?? [];
          _loading = false;
        });
      }
    } catch (e) {
      debugPrint('Achievements load error: $e');
      setState(() => _loading = false);
    }
  }

  Color _getTierColor(int tier) {
    switch (tier) {
      case 1: return const Color(0xFFA0522D); 
      case 2: return const Color(0xFFA9A9A9); 
      case 3: return const Color(0xFFD4AF37); 
      case 4: return const Color(0xFF4682B4);
      case 5: return const Color(0xFF8A2BE2); 
      default: return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        backgroundColor: GameTheme.deepBlue,
        body: Center(child: CircularProgressIndicator(color: GameTheme.sandGold)),
      );
    }

    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    final Map<int, List<Map<String, dynamic>>> grouped = {};
    for (var a in _achievements) {
      final tier = (a['tier'] as num?)?.toInt() ?? 1;
      if (!grouped.containsKey(tier)) grouped[tier] = [];
      grouped[tier]!.add(a);
    }

    return Scaffold(
      backgroundColor: GameTheme.deepBlue,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'ДОСТИЖЕНИЯ',
          style: TextStyle(
            fontFamily: 'Neucha', 
            color: GameTheme.sandGold, 
            fontWeight: FontWeight.bold, 
            fontSize: isMobile ? 20 : 24, 
            letterSpacing: isMobile ? 2 : 4
          ),
        ),
        iconTheme: const IconThemeData(color: GameTheme.sandGold),
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
                margin: EdgeInsets.all(isMobile ? 10 : 20),
                padding: EdgeInsets.all(isMobile ? 15 : 30),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1A19), 
                  border: Border.all(color: bronze, width: 2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  children: [
                    Text(
                      'Совершайте подвиги, чтобы получить золото, опыт и очки навыков.',
                      style: TextStyle(fontSize: isMobile ? 12 : 14, color: Colors.grey, fontStyle: FontStyle.italic),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    Divider(color: bronze.withOpacity(0.3)),
                    const SizedBox(height: 5),

                    Expanded(
                      child: ListView(
                        children: grouped.keys.map((tier) {
                          final tierColor = _getTierColor(tier);
                          final tierList = grouped[tier]!;
                          
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Transform.rotate(
                                        angle: 0.785, 
                                        child: Container(
                                          width: isMobile ? 12 : 16,
                                          height: isMobile ? 12 : 16,
                                          decoration: BoxDecoration(
                                            color: tierColor,
                                            border: Border.all(color: GameTheme.lightSand.withOpacity(0.5), width: 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      'ТИР $tier',
                                      style: TextStyle(fontSize: isMobile ? 18 : 20, fontWeight: FontWeight.bold, color: tierColor, fontFamily: 'Neucha', letterSpacing: 2),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(child: Divider(color: tierColor.withOpacity(0.3))),
                                  ],
                                ),
                              ),
                              
                              ...tierList.map((a) {
                                final isDone = a['is_completed'] == true;
                                return _buildAchievementRow(a, isDone, tierColor, isMobile);
                              }),
                            ],
                          );
                        }).toList(),
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

  Widget _buildAchievementRow(Map<String, dynamic> a, bool isDone, Color tierColor, bool isMobile) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(isMobile ? 12 : 16),
      decoration: BoxDecoration(
        color: isDone ? const Color(0xFF2A2624) : const Color(0xFF11100F).withOpacity(0.6),
        border: Border.all(
          color: isDone ? GameTheme.sandGold.withOpacity(0.5) : bronze.withOpacity(0.2),
          width: isDone ? 1.5 : 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: isMobile ? 40 : 50,
            height: isMobile ? 40 : 50,
            decoration: BoxDecoration(
              color: isDone ? GameTheme.sandGold.withOpacity(0.1) : Colors.transparent,
              border: Border.all(color: isDone ? GameTheme.sandGold : bronze.withOpacity(0.3)),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isDone ? Icons.check : Icons.lock_outline,
              color: isDone ? GameTheme.sandGold : Colors.grey,
              size: isMobile ? 20 : 24,
            ),
          ),
          SizedBox(width: isMobile ? 12 : 20),
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  a['name'] ?? 'Unknown',
                  style: TextStyle(
                    fontFamily: 'Neucha',
                    fontSize: isMobile ? 16 : 18,
                    fontWeight: FontWeight.bold,
                    color: isDone ? GameTheme.lightSand : Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  a['description'] ?? '',
                  style: TextStyle(
                    fontSize: isMobile ? 11 : 12,
                    color: isDone ? bronze : Colors.grey.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}