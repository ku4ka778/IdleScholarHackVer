import 'dart:ui';
import 'package:flutter/material.dart';
import '../services/api_client.dart';
import '../services/session.dart';
import '../ui_kit.dart'; 

class CityHallScreen extends StatefulWidget {
  const CityHallScreen({super.key});

  @override
  State<CityHallScreen> createState() => _CityHallScreenState();
}

class _CityHallScreenState extends State<CityHallScreen> {
  int _cityLevel = 1;
  Map<String, int> _upgrades = {};
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
      final resp = await apiClient.getCity(charId);
      if (resp['success'] == true) {
        setState(() {
          _cityLevel = (resp['level'] as num?)?.toInt() ?? 1;
          
          final rawUpgrades = resp['upgrades'] as Map<String, dynamic>? ?? {};
          _upgrades = rawUpgrades.map((key, value) => MapEntry(key, (value as num?)?.toInt() ?? 0));
          
          final rawRes = (resp['resources'] as List<dynamic>?) ?? [];
          _resources = { 
            for (var r in rawRes) 
              if (r['resource_type'] != null) 
                r['resource_type'] : (r['amount'] as num?)?.toInt() ?? 0 
          };
          
          _loading = false;
        });
      }
    } catch (e) {
      debugPrint('Error: $e');
      setState(() => _loading = false);
    }
  }

  Future<void> _upgrade(String code) async {
    final charId = Session.characterId;
    if (charId == null) return;

    try {
      final resp = await apiClient.upgradeBuilding(charId, code);
      if (resp['success'] == true) {
        _load();
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

  Widget _buildUpgradeCard(String code, String name, String desc, IconData icon) {
    final level = _upgrades[code] ?? 0;
    final nextLevel = level + 1;
    final woodCost = nextLevel * 50;
    final stoneCost = nextLevel * 30;

    final haveTwig = _resources['twig'] ?? 0;
    final haveStone = _resources['stone'] ?? 0;
    final canAfford = haveTwig >= woodCost && haveStone >= stoneCost;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF11100F).withOpacity(0.7),
        border: Border.all(color: bronze.withOpacity(0.4), width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: GameTheme.sandGold, size: 32),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontFamily: 'Neucha', fontWeight: FontWeight.bold, fontSize: 22, color: GameTheme.lightSand),
                    ),
                    Text(
                      'Уровень: $level',
                      style: TextStyle(fontSize: 14, color: bronze),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          Text(desc, style: const TextStyle(fontSize: 13, color: Colors.grey, height: 1.4)),
          const SizedBox(height: 20),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Стоимость улучшения:', style: TextStyle(fontSize: 12, color: bronze)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      _buildCostChip(Icons.park, woodCost.toString(), haveTwig >= woodCost),
                      const SizedBox(width: 12),
                      _buildCostChip(Icons.landscape, stoneCost.toString(), haveStone >= stoneCost),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 45,
                child: ElevatedButton(
                  onPressed: canAfford ? () => _upgrade(code) : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: GameTheme.sandGold,
                    foregroundColor: const Color(0xFF1C1A19),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    disabledBackgroundColor: Colors.grey.shade800,
                    disabledForegroundColor: Colors.grey.shade500,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                  ),
                  child: const Text('УЛУЧШИТЬ', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget _buildCostChip(IconData icon, String amount, bool enough) {
    final color = enough ? Colors.greenAccent : Colors.redAccent;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        border: Border.all(color: color.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(amount, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: color)),
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
        iconTheme: const IconThemeData(color: GameTheme.sandGold),
        title: Text('ГЛАВНОЕ ЗДАНИЕ', style: TextStyle(fontFamily: 'Neucha', color: GameTheme.sandGold, fontWeight: FontWeight.bold, fontSize: 24, letterSpacing: 2)),
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
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1A19),
                  border: Border.all(color: bronze, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF11100F),
                        border: Border(bottom: BorderSide(color: bronze.withOpacity(0.3))),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'УРОВЕНЬ ГОРОДА: $_cityLevel',
                        style: const TextStyle(fontFamily: 'Neucha', fontSize: 20, fontWeight: FontWeight.bold, color: GameTheme.sandGold, letterSpacing: 2),
                      ),
                    ),

                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.all(30),
                        children: [
                          _buildUpgradeCard('gold_mine', 'Золотая шахта', 'Увеличивает золото в экспедициях. Дает +10 опыта за уровень шахты.', Icons.monetization_on),
                          _buildUpgradeCard('library', 'Библиотека', 'Увеличивает опыт. Снижает цену крафта в золоте на 2% за уровень.', Icons.menu_book),
                          _buildUpgradeCard('warehouse', 'Улучшенный склад', 'Позволяет уносить больше ресурсов из экспедиций.', Icons.inventory_2),
                          _buildUpgradeCard('barracks', 'Казарма', 'Увеличивает доход казармы и уменьшает штрафы за потерю фокуса на 1% за уровень.', Icons.shield),
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
}