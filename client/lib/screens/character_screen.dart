import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../services/api_client.dart';
import '../services/session.dart';
import 'forge_screen.dart';
import 'tavern_screen.dart';
import 'home_screen.dart';
import '../ui_kit.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  List<Map<String, dynamic>> _items = [];
  int _baseAtk = 0;
  int _baseDef = 0;
  int _baseLuck = 0;
  int _baseStr = 0;
  int _baseDex = 0;
  int _baseInt = 0;
  int _level = 1;
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
      final eqResp = await apiClient.getEquipment(charId);
      final charResp = await apiClient.getCharacter(charId);

      if (eqResp['success'] == true && charResp['id'] != null) {
        final rawItems = (eqResp['items'] as List<dynamic>)
            .cast<Map<String, dynamic>>();

        rawItems.sort((a, b) {
          final aEq = a['equipped'] == true ? 1 : 0;
          final bEq = b['equipped'] == true ? 1 : 0;
          if (aEq != bEq) return bEq - aEq;
          return (a['slot'] as String).compareTo(b['slot'] as String);
        });

        if (mounted) {
          setState(() {
            _items = rawItems;
            _equipAtk = eqResp['total_attack'] ?? 0;
            _equipDef = eqResp['total_defense'] ?? 0;
            _equipLuck = eqResp['total_luck'] ?? 0;

            _level = charResp['level'] ?? 1;
            _baseStr = charResp['strength'] ?? 0;
            _baseDex = charResp['dexterity'] ?? 0;
            _baseInt = charResp['intelligence'] ?? 0;
            _baseLuck = charResp['luck'] ?? 0;

            _baseAtk = _baseStr ~/ 5;
            _baseDef = 0;

            _loading = false;
          });
        }
      }
    } catch (e) {
      debugPrint('Load error: $e');
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _toggleEquip(Map<String, dynamic> item) async {
    final charId = Session.characterId;
    if (charId == null) return;

    try {
      if (item['equipped'] == true) {
        await apiClient.unequip(charId, item['id']);
      } else {
        await apiClient.equip(charId, item['id']);
      }
      await _load();
    } catch (e) {
      debugPrint('Equip error: $e');
    }
  }

  String _statText(Map<String, dynamic> item) {
    final parts = <String>[];
    if ((item['attack'] ?? 0) > 0) parts.add('ATK +${item['attack']}');
    if ((item['defense'] ?? 0) > 0) parts.add('DEF +${item['defense']}');
    if ((item['luck'] ?? 0) > 0) parts.add('LUCK +${item['luck']}');
    return parts.isEmpty ? 'Нет статов' : parts.join(', ');
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

    final totalAtk = _baseAtk + _equipAtk;
    final totalDef = _baseDef + _equipDef;
    final totalLuck = _baseLuck + _equipLuck;

    final goldBonusPercent = (math.sqrt(totalAtk) * 2).toInt();
    final luckBonusPercent = (math.sqrt(totalLuck) * 2).toInt();
    final penaltyReductionPercent = ((totalDef / (totalDef + 100.0)) * 100).toInt();

    return Scaffold(
      backgroundColor: GameTheme.deepBlue,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: GameTheme.sandGold),
        leading: IconButton(
          icon: const Icon(Icons.home),
          tooltip: 'В дом',
          onPressed: () {
            Navigator.popUntil(
              context,
              (route) => route.isFirst || route.settings.name == '/home',
            );
          },
        ),
        title: Text(
          'ИНВЕНТАРЬ (Ур. $_level)', 
          style: TextStyle(
            fontFamily: 'Neucha', 
            color: GameTheme.sandGold, 
            fontWeight: FontWeight.bold, 
            fontSize: isMobile ? 18 : 24
          )
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.build),
            tooltip: 'Кузня',
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ForgeScreen())),
          ),
          IconButton(
            icon: const Icon(Icons.local_drink),
            tooltip: 'Трактир',
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TavernScreen())),
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
                constraints: const BoxConstraints(maxWidth: 900),
                margin: EdgeInsets.all(isMobile ? 10 : 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1A19),
                  border: Border.all(color: bronze, width: 2),
                ),
                child: Column(
                  children: [
 
                    Container(
                      padding: EdgeInsets.all(isMobile ? 16 : 24),
                      decoration: BoxDecoration(
                        color: const Color(0xFF11100F),
                        border: Border(bottom: BorderSide(color: bronze.withOpacity(0.4), width: 1.5)),
                      ),

                      child: isMobile 
                        ? Column(
                            children: [
                              _buildAttributesRow(isMobile),
                              Divider(color: bronze.withOpacity(0.2), height: 30),
                              _buildCombatStatsRow(totalAtk, totalDef, totalLuck, goldBonusPercent, penaltyReductionPercent, luckBonusPercent, isMobile),
                            ],
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(flex: 4, child: _buildAttributesRow(isMobile)),
                              Container(
                                width: 1,
                                height: 100,
                                margin: const EdgeInsets.symmetric(horizontal: 20),
                                color: bronze.withOpacity(0.2),
                              ),
                              Expanded(flex: 6, child: _buildCombatStatsRow(totalAtk, totalDef, totalLuck, goldBonusPercent, penaltyReductionPercent, luckBonusPercent, isMobile)),
                            ],
                          ),
                    ),
                    
                    Expanded(
                      child: _items.isEmpty 
                        ? const Center(child: Text('Инвентарь пуст', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic)))
                        : ListView.builder(
                            padding: EdgeInsets.all(isMobile ? 10 : 20),
                            itemCount: _items.length,
                            itemBuilder: (context, index) {
                              final item = _items[index];
                              final isEquipped = item['equipped'] == true;

                              return Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                padding: EdgeInsets.symmetric(horizontal: isMobile ? 12 : 16, vertical: 12),
                                decoration: BoxDecoration(
                                  color: isEquipped ? const Color(0xFF2A2624) : const Color(0xFF11100F).withOpacity(0.5),
                                  border: Border.all(
                                    color: isEquipped ? GameTheme.sandGold.withOpacity(0.6) : bronze.withOpacity(0.2),
                                    width: isEquipped ? 2 : 1,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      _getSlotIcon(item['slot']), 
                                      color: isEquipped ? GameTheme.sandGold : bronze, 
                                      size: isMobile ? 24 : 30,
                                    ),
                                    SizedBox(width: isMobile ? 12 : 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${item['name']}',
                                            style: TextStyle(
                                              fontFamily: 'Neucha',
                                              fontSize: isMobile ? 16 : 18,
                                              fontWeight: FontWeight.bold,
                                              color: isEquipped ? GameTheme.lightSand : Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            '${item['slot']} | ${_statText(item)}',
                                            style: TextStyle(
                                              fontSize: isMobile ? 10 : 12,
                                              color: isEquipped ? bronze : Colors.grey.withOpacity(0.5),
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: isMobile ? 8 : 16),
                                    SizedBox(
                                      width: isMobile ? 80 : 100,
                                      height: isMobile ? 35 : 40,
                                      child: ElevatedButton(
                                        onPressed: () => _toggleEquip(item),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: isEquipped ? Colors.transparent : GameTheme.sandGold,
                                          foregroundColor: isEquipped ? Colors.redAccent : const Color(0xFF1C1A19),
                                          side: isEquipped ? const BorderSide(color: Colors.redAccent) : BorderSide.none,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: Text(
                                          isEquipped ? 'СНЯТЬ' : 'НАДЕТЬ',
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: isMobile ? 10 : 12),
                                        ),
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


  Widget _buildAttributesRow(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('АТРИБУТЫ', style: TextStyle(color: bronze, fontSize: isMobile ? 10 : 12, letterSpacing: 2, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildAttributeBox('STR', _baseStr, isMobile),
            _buildAttributeBox('DEX', _baseDex, isMobile),
            _buildAttributeBox('INT', _baseInt, isMobile),
            _buildAttributeBox('LUCK', _baseLuck, isMobile),
          ],
        ),
      ],
    );
  }

  Widget _buildCombatStatsRow(int totalAtk, int totalDef, int totalLuck, int goldBonus, int penaltyRed, int luckBonus, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('БОЕВЫЕ ХАРАКТЕРИСТИКИ', style: TextStyle(color: bronze, fontSize: isMobile ? 10 : 12, letterSpacing: 2, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildDetailedCombatStat(
              label: 'АТАКА', icon: Icons.gavel,
              total: totalAtk, base: _baseAtk, equip: _equipAtk, bonus: '+$goldBonus% золота', color: Colors.redAccent, isMobile: isMobile
            ),
            _buildDetailedCombatStat(
              label: 'ЗАЩИТА', icon: Icons.shield,
              total: totalDef, base: _baseDef, equip: _equipDef, bonus: '-$penaltyRed% штрафа', color: Colors.blueAccent, isMobile: isMobile
            ),
            _buildDetailedCombatStat(
              label: 'УДАЧА', icon: Icons.casino,
              total: totalLuck, base: _baseLuck, equip: _equipLuck, bonus: '+$luckBonus% дропа', color: Colors.orangeAccent, isMobile: isMobile
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAttributeBox(String label, int value, bool isMobile) {
    return Container(
      width: isMobile ? 50 : 60,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1A19),
        border: Border.all(color: bronze.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Text(label, style: TextStyle(fontSize: isMobile ? 8 : 10, color: bronze, fontWeight: FontWeight.bold, letterSpacing: 1)),
          const SizedBox(height: 4),
          Text('$value', style: TextStyle(fontSize: isMobile ? 18 : 22, fontWeight: FontWeight.bold, color: GameTheme.lightSand, fontFamily: 'Neucha')),
        ],
      ),
    );
  }

  Widget _buildDetailedCombatStat({
    required String label, 
    required IconData icon,
    required int total, 
    required int base, 
    required int equip, 
    required String bonus, 
    required Color color,
    required bool isMobile
  }) {
    return Column(
      children: [
        Icon(icon, color: color.withOpacity(0.8), size: isMobile ? 20 : 24),
        const SizedBox(height: 6),
        Text('$total', style: TextStyle(fontSize: isMobile ? 22 : 28, fontWeight: FontWeight.bold, color: color, fontFamily: 'Neucha')),
        Text('($base + $equip)', style: TextStyle(fontSize: isMobile ? 10 : 12, color: bronze.withOpacity(0.7))),
        const SizedBox(height: 4),
        Text(bonus, textAlign: TextAlign.center, style: TextStyle(fontSize: isMobile ? 9 : 11, color: color.withOpacity(0.9), fontWeight: FontWeight.bold)),
        const SizedBox(height: 2),
        Text(label, style: TextStyle(fontSize: isMobile ? 8 : 10, color: bronze, letterSpacing: 1)),
      ],
    );
  }

  IconData _getSlotIcon(String? slot) {
    switch (slot) {
      case 'weapon': return Icons.gavel;
      case 'armor': return Icons.shield;
      case 'accessory': return Icons.diamond;
      default: return Icons.inventory_2;
    }
  }
}