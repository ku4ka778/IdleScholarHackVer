import 'dart:ui';
import 'package:flutter/material.dart';
import '../services/api_client.dart';
import '../services/session.dart';
import '../services/localization.dart';
import '../widgets/resource_bar.dart';
import 'character_screen.dart';
import 'city_screen.dart';
import '../ui_kit.dart';

class TavernScreen extends StatefulWidget {
  const TavernScreen({super.key});

  @override
  State<TavernScreen> createState() => _TavernScreenState();
}

class _TavernScreenState extends State<TavernScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final GlobalKey<ResourceBarState> _resourceKey = GlobalKey<ResourceBarState>();

  bool _loading = true;
  List<Map<String, dynamic>> _foodRecipes = [];
  List<Map<String, dynamic>> _potionRecipes = [];
  int _activeG = 0, _activeE = 0, _activeL = 0;
  
  int _playerGold = 0;

  final Color bronze = const Color(0xFF8B7D6B);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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

      final charResp = await apiClient.getCharacter(charId);
      final foodResp = await apiClient.getFoodRecipes(charId);
      final potionResp = await apiClient.getPotionRecipes(charId);

      if (mounted) {
        setState(() {
          _playerGold = (charResp['gold'] as num?)?.toInt() ?? 0; 

          if (foodResp['success'] == true) {
            _foodRecipes = (foodResp['recipes'] as List<dynamic>?)?.cast<Map<String, dynamic>>() ?? [];
            _activeG = foodResp['active_food_gold_pct'] ?? 0;
            _activeE = foodResp['active_food_exp_pct'] ?? 0;
            _activeL = foodResp['active_food_luck_pct'] ?? 0;
          }
          if (potionResp['success'] == true) {
            _potionRecipes = (potionResp['recipes'] as List<dynamic>?)?.cast<Map<String, dynamic>>() ?? [];
          }
          _loading = false;
        });
      }
    } catch (e) {
      debugPrint('Tavern load error: $e');
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _buyFood(String code) async {
    final charId = Session.characterId;
    if (charId == null) return;

    try {
      final resp = await apiClient.buyFood(charId, code);
      if (resp['success'] == true) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Еда куплена!'), backgroundColor: Colors.green),
          );
        }
        _load();
        _resourceKey.currentState?.loadResources();
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(resp['message'] ?? 'Ошибка'), backgroundColor: Colors.redAccent),
          );
        }
      }
    } catch (e) {
      debugPrint('Buy error: $e');
    }
  }

  Future<void> _drinkPotion(String code) async {
    final charId = Session.characterId;
    if (charId == null) return;

    try {
      final resp = await apiClient.drinkPotion(charId, code);
      if (resp['success'] == true) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Зелье выпито!'), backgroundColor: Colors.green),
          );
        }
        _load();
        _resourceKey.currentState?.loadResources();
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(resp['message'] ?? 'Ошибка'), backgroundColor: Colors.redAccent),
          );
        }
      }
    } catch (e) {
      debugPrint('Drink error: $e');
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
        leading: IconButton(
          icon: const Icon(Icons.home),
          tooltip: 'В город',
          onPressed: () {
            Navigator.popUntil(
              context,
              (route) => route.settings.name == '/city' || route.isFirst,
            );
          },
        ),
        title: Text('ТРАКТИР', style: TextStyle(fontFamily: 'Neucha', color: GameTheme.sandGold, fontWeight: FontWeight.bold, fontSize: 24, letterSpacing: 2)),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF11100F),
              border: Border.all(color: GameTheme.sandGold.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Icon(Icons.monetization_on, color: GameTheme.sandGold, size: 18),
                const SizedBox(width: 6),
                Text(
                  '$_playerGold',
                  style: const TextStyle(color: GameTheme.lightSand, fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'Инвентарь',
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const CharacterScreen()),
              );
            },
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
                child: _loading
                    ? const Center(child: CircularProgressIndicator(color: GameTheme.sandGold))
                    : Column(
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFF11100F),
                              border: Border(bottom: BorderSide(color: bronze.withOpacity(0.3))),
                            ),
                            child: ResourceBar(key: _resourceKey),
                          ),

                          if (_activeG > 0 || _activeE > 0 || _activeL > 0)
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: GameTheme.twilightPurple.withOpacity(0.4),
                                border: Border.all(color: GameTheme.sandGold.withOpacity(0.5)),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Column(
                                children: [
                                  const Text(
                                    'АКТИВНЫЙ БАФФ',
                                    style: TextStyle(fontWeight: FontWeight.bold, color: GameTheme.sandGold, letterSpacing: 1.5),
                                  ),
                                  const SizedBox(height: 8),
                                  Wrap(
                                    spacing: 16,
                                    children: [
                                      if (_activeG > 0)
                                        _buildBuffText('+$_activeG% Золота', Colors.amber),
                                      if (_activeE > 0)
                                        _buildBuffText('+$_activeE% Опыта', Colors.cyanAccent),
                                      if (_activeL > 0)
                                        _buildBuffText('+$_activeL% Удачи', Colors.orangeAccent),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                          Container(
                            margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
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
                                Tab(text: 'ЕДА (БАФФЫ)'),
                                Tab(text: 'ЗЕЛЬЯ'),
                              ],
                            ),
                          ),

                          Expanded(
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                _buildList(_foodRecipes, true),
                                _buildList(_potionRecipes, false),
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

  Widget _buildBuffText(String text, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.arrow_upward, size: 14, color: color),
        const SizedBox(width: 4),
        Text(text, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildList(List<Map<String, dynamic>> items, bool isFood) {
    if (items.isEmpty) {
      return Center(child: Text(isFood ? 'Нет еды' : 'Нет зелий', style: const TextStyle(color: Colors.grey)));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final r = items[index];
        final costResource = r['cost_resource'] ?? 'unknown';
        final costGold = (r['cost_gold'] as num?)?.toInt() ?? 0;
        
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF11100F).withOpacity(0.6),
            border: Border.all(color: bronze.withOpacity(0.4)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '[Тир ${r['tier']}] ${r['name']}',
                      style: const TextStyle(fontFamily: 'Neucha', fontWeight: FontWeight.bold, fontSize: 18, color: GameTheme.lightSand),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      r['description'] ?? '',
                      style: TextStyle(fontSize: 12, color: Colors.grey[400]),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(getResourceIcon(costResource.toString()), size: 16, color: bronze),
                        const SizedBox(width: 6),
                        Text(
                          '${r['cost_amount']} ${resourceName(costResource.toString())}', 
                          style: TextStyle(fontSize: 13, color: bronze, fontWeight: FontWeight.bold),
                        ),
                        
                        if (!isFood && costGold > 0) ...[
                          const SizedBox(width: 12),
                          Icon(
                            Icons.monetization_on, 
                            size: 16, 
                            color: _playerGold >= costGold ? GameTheme.sandGold : Colors.redAccent,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '$costGold', 
                            style: TextStyle(
                              fontSize: 13, 
                              color: _playerGold >= costGold ? GameTheme.sandGold : Colors.redAccent, 
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: isFood ? () => _buyFood(r['code']) : () => _drinkPotion(r['code']),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: GameTheme.sandGold,
                    foregroundColor: const Color(0xFF1C1A19),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  ),
                  child: Text(isFood ? 'КУПИТЬ' : 'ВЫПИТЬ', style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}