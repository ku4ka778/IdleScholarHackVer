import 'dart:ui';
import 'package:flutter/material.dart';

import '../services/api_client.dart';
import '../services/session.dart';
import '../services/localization.dart';
import '../widgets/resource_bar.dart';
import 'character_screen.dart';
import 'city_screen.dart';
import '../ui_kit.dart';

class ForgeScreen extends StatefulWidget {
  const ForgeScreen({super.key});

  @override
  State<ForgeScreen> createState() => _ForgeScreenState();
}

class _ForgeScreenState extends State<ForgeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final GlobalKey<_CraftTabState> _craftKey = GlobalKey<_CraftTabState>();
  final GlobalKey<_SalvageTabState> _salvageKey = GlobalKey<_SalvageTabState>();
  final GlobalKey<ResourceBarState> _resourceKey = GlobalKey<ResourceBarState>();

  final Color bronze = const Color(0xFF8B7D6B);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      if (_tabController.index == 0) {
        _craftKey.currentState?._load();
      } else {
        _salvageKey.currentState?._load();
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
          onPressed: () {
            Navigator.popUntil(
              context,
              (route) => route.settings.name == '/city' || route.isFirst,
            );
          },
        ),
        title: Text('КУЗНЯ', style: TextStyle(fontFamily: 'Neucha', color: GameTheme.sandGold, fontWeight: FontWeight.bold, fontSize: 24, letterSpacing: 2)),
        actions: [
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
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFF11100F),
                        border: Border(bottom: BorderSide(color: bronze.withOpacity(0.3))),
                      ),
                      child: ResourceBar(key: _resourceKey),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
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
                          Tab(text: 'КРАФТ'),
                          Tab(text: 'ПЕРЕПЛАВКА'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          _CraftTab(
                            key: _craftKey,
                            onUpdate: () => _resourceKey.currentState?.loadResources(),
                          ),
                          _SalvageTab(
                            key: _salvageKey,
                            onUpdate: () => _resourceKey.currentState?.loadResources(),
                          ),
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

class _CraftTab extends StatefulWidget {
  final VoidCallback onUpdate;
  const _CraftTab({super.key, required this.onUpdate});

  @override
  State<_CraftTab> createState() => _CraftTabState();
}

class _CraftTabState extends State<_CraftTab> with AutomaticKeepAliveClientMixin {
  List<Map<String, dynamic>> _recipes = [];
  int _playerGold = 0;
  bool _loading = true;

  final Color bronze = const Color(0xFF8B7D6B);

  @override
  bool get wantKeepAlive => true;

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
      final charResp = await apiClient.getCharacter(charId);
      _playerGold = (charResp['gold'] as num?)?.toInt() ?? 0;

      final resp = await apiClient.getRecipes(charId);
      if (resp['success'] == true) {
        final rawRecipes = (resp['recipes'] as List<dynamic>?) ?? [];
        setState(() {
          _recipes = rawRecipes.cast<Map<String, dynamic>>();
          _loading = false;
        });
      }
    } catch (e) {
      debugPrint('Error loading recipes: $e');
      setState(() => _loading = false);
    }
  }

  Future<void> _craft(Map<String, dynamic> recipe, int amount) async {
    final charId = Session.characterId;
    if (charId == null) return;

    try {
      final resp = await apiClient.craftItem(charId, recipe['id'], amount);
      if (resp['success'] == true) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Создано: ${recipe['result_name']} x$amount'), backgroundColor: Colors.green),
          );
        }
        widget.onUpdate();
        await _load();
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(resp['message'] ?? 'Ошибка'), backgroundColor: Colors.redAccent),
          );
        }
      }
    } catch (e) {
      debugPrint('Craft error: $e');
    }
  }

  int _getMaxCraftable(Map<String, dynamic> r) {
    final ingredients = (r['ingredients'] as List<dynamic>?)?.cast<Map<String, dynamic>>() ?? [];
    final goldCost = (r['gold_cost'] as num?)?.toInt() ?? 0;

    int maxCraft = 999;
    for (var ing in ingredients) {
      final available = (ing['available'] as num?)?.toInt() ?? 0;
      final amount = (ing['amount'] as num?)?.toInt() ?? 1;
      if (amount > 0) {
        final possible = available ~/ amount;
        if (possible < maxCraft) maxCraft = possible;
      }
    }

    if (goldCost > 0) {
      final goldPossible = _playerGold ~/ goldCost;
      if (goldPossible < maxCraft) maxCraft = goldPossible;
    }

    return maxCraft == 999 ? 1 : maxCraft;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_loading) return const Center(child: CircularProgressIndicator(color: GameTheme.sandGold));
    if (_recipes.isEmpty) return const Center(child: Text('Нет рецептов', style: TextStyle(color: Colors.grey)));

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
            color: const Color(0xFF11100F),
            border: Border.all(color: GameTheme.sandGold.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.monetization_on, color: GameTheme.sandGold, size: 20),
              const SizedBox(width: 8),
              Text('$_playerGold', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: GameTheme.lightSand)),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: _recipes.length,
            itemBuilder: (context, index) {
              final r = _recipes[index];
              final maxCraft = _getMaxCraftable(r);
              final goldCost = (r['gold_cost'] as num?)?.toInt() ?? 0;
              final canAffordGold = _playerGold >= goldCost;

              return _RecipeCard(
                recipe: r,
                maxCraft: maxCraft,
                canAffordGold: canAffordGold,
                bronze: bronze,
                onCraft: (amount) => _craft(r, amount),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _RecipeCard extends StatefulWidget {
  final Map<String, dynamic> recipe;
  final int maxCraft;
  final bool canAffordGold;
  final Color bronze;
  final Function(int) onCraft;

  const _RecipeCard({
    required this.recipe,
    required this.maxCraft,
    required this.canAffordGold,
    required this.bronze,
    required this.onCraft,
  });

  @override
  State<_RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<_RecipeCard> {
  late int currentAmount;
  final TextEditingController _controller = TextEditingController(text: "1");

  @override
  void initState() {
    super.initState();
    currentAmount = 1;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final r = widget.recipe;
    final bronze = widget.bronze;
    final goldCost = (r['gold_cost'] as num?)?.toInt() ?? 0;
    final ingredients = (r['ingredients'] as List<dynamic>?)?.cast<Map<String, dynamic>>() ?? [];
    final canCraft = (r['can_craft'] == true && widget.canAffordGold && widget.maxCraft > 0);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF11100F).withOpacity(0.6),
        border: Border.all(color: bronze.withOpacity(0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${r['result_name']} x${r['result_quantity']}',
                style: const TextStyle(fontFamily: 'Neucha', fontWeight: FontWeight.bold, fontSize: 18, color: GameTheme.lightSand),
              ),
              if (goldCost > 0)
                Text(
                  '$goldCost золота',
                  style: TextStyle(color: widget.canAffordGold ? GameTheme.sandGold : Colors.redAccent, fontWeight: FontWeight.bold),
                ),
            ],
          ),
          if (r['result_slot'] != 'material') ...[
            const SizedBox(height: 4),
            Text(
              'ATK: ${r['result_attack']} | DEF: ${r['result_defense']} | LUCK: ${r['result_luck']}',
              style: TextStyle(fontSize: 12, color: bronze),
            ),
          ],
          const SizedBox(height: 12),
          ...ingredients.map((ing) {
            final available = (ing['available'] as num?)?.toInt() ?? 0;
            final amountPerOne = (ing['amount'] as num?)?.toInt() ?? 0;
            final totalNeeded = amountPerOne * currentAmount;
            final resType = ing['resource_type'] as String? ?? 'unknown';

            return Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                children: [
                  Icon(Icons.circle, size: 8, color: available >= totalNeeded ? Colors.green : Colors.red),
                  const SizedBox(width: 8),
                  Text('${resourceName(resType)}: $available / $totalNeeded',
                      style: TextStyle(color: available >= totalNeeded ? Colors.grey : Colors.red.shade300, fontSize: 13)),
                ],
              ),
            );
          }),
          const SizedBox(height: 16),
          
          if (widget.maxCraft > 0) ...[
            Row(
              children: [
                Expanded(
                  child: Slider(
                    value: currentAmount.toDouble(),
                    min: 1,
                    max: widget.maxCraft.toDouble(),
                    divisions: widget.maxCraft > 1 ? widget.maxCraft - 1 : 1,
                    activeColor: GameTheme.sandGold,
                    inactiveColor: bronze.withOpacity(0.3),
                    onChanged: (val) {
                      setState(() {
                        currentAmount = val.round();
                        _controller.text = currentAmount.toString();
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 60,
                  height: 35,
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: GameTheme.sandGold, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      filled: true,
                      fillColor: GameTheme.sandGold.withOpacity(0.1),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: GameTheme.sandGold.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: GameTheme.sandGold),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    onChanged: (val) {
                      int parsed = int.tryParse(val) ?? 1;
                      if (parsed < 1) parsed = 1;
                      if (parsed > widget.maxCraft) parsed = widget.maxCraft;
                      setState(() {
                        currentAmount = parsed;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],

          SizedBox(
            width: double.infinity,
            height: 40,
            child: ElevatedButton(
              onPressed: canCraft 
                  ? () {
                      int finalAmount = int.tryParse(_controller.text) ?? currentAmount;
                      if (finalAmount < 1) finalAmount = 1;
                      if (finalAmount > widget.maxCraft) finalAmount = widget.maxCraft;
                      
                      widget.onCraft(finalAmount); 
                    } 
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: GameTheme.sandGold,
                foregroundColor: const Color(0xFF1C1A19),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                disabledBackgroundColor: Colors.grey.shade800,
                disabledForegroundColor: Colors.grey,
              ),
              child: Text(
                'СОЗДАТЬ (x${_controller.text})', 
                style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SalvageTab extends StatefulWidget {
  final VoidCallback onUpdate;
  const _SalvageTab({super.key, required this.onUpdate});

  @override
  State<_SalvageTab> createState() => _SalvageTabState();
}

class _SalvageTabState extends State<_SalvageTab> with AutomaticKeepAliveClientMixin {
  List<Map<String, dynamic>> _items = [];
  bool _loading = true;

  final Color bronze = const Color(0xFF8B7D6B);

  @override
  bool get wantKeepAlive => true;

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
      final resp = await apiClient.getSalvageableItems(charId);
      if (resp['success'] == true) {
        final rawItems = (resp['items'] as List<dynamic>?) ?? [];
        setState(() {
          _items = rawItems.cast<Map<String, dynamic>>();
          _loading = false;
        });
      }
    } catch (e) {
      debugPrint('Error loading salvageables: $e');
      setState(() => _loading = false);
    }
  }

  Future<void> _salvage(Map<String, dynamic> item) async {
    final charId = Session.characterId;
    if (charId == null) return;

    final previewList = (item['preview'] as List<dynamic>?)?.cast<Map<String, dynamic>>() ?? [];
    final preview = previewList.map((r) {
      final resKey = r['resource_type'] ?? r['type'] ?? r['key'] ?? r['id'] ?? 'unknown';
      final amount = r['amount'] ?? r['count'] ?? r['quantity'] ?? 0;
      return '${resourceName(resKey.toString())} x$amount';
    }).join(', ');

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1C1A19),
        title: const Text('Переплавить?', style: TextStyle(color: GameTheme.sandGold, fontFamily: 'Neucha')),
        content: Text('${item['name']}\n\nПолучите: ${preview.isEmpty ? "Неизвестно" : preview}', style: const TextStyle(color: GameTheme.lightSand)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Отмена', style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Переплавить', style: TextStyle(color: GameTheme.sandGold)),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    try {
      final resp = await apiClient.salvageItem(charId, item['id']);
      if (resp['success'] == true) {
        final results = (resp['results'] as List<dynamic>?)?.cast<Map<String, dynamic>>() ?? [];
        final got = results.map((r) {
          final resKey = r['resource_type'] ?? r['type'] ?? r['key'] ?? r['id'] ?? 'unknown';
          final amount = r['amount'] ?? r['count'] ?? r['quantity'] ?? 0;
          return '${resourceName(resKey.toString())} x$amount';
        }).join(', ');

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Получено: $got'), backgroundColor: Colors.green));
        widget.onUpdate();
        _load();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(resp['message'] ?? 'Error'), backgroundColor: Colors.redAccent));
      }
    } catch (e) {
      debugPrint('Salvage error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_loading) return const Center(child: CircularProgressIndicator(color: GameTheme.sandGold));
    if (_items.isEmpty) return const Center(child: Text('Нет предметов для переплавки', style: TextStyle(color: Colors.grey)));

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final item = _items[index];
        final previewList = (item['preview'] as List<dynamic>?)?.cast<Map<String, dynamic>>() ?? [];
        
        final preview = previewList.map((r) {
          final resKey = r['resource_type'] ?? r['type'] ?? r['key'] ?? r['id'] ?? 'unknown';
          final amount = r['amount'] ?? r['count'] ?? r['quantity'] ?? 0;
          return '${resourceName(resKey.toString())} x$amount';
        }).join(', ');

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: const Color(0xFF11100F).withOpacity(0.6),
            border: Border.all(color: bronze.withOpacity(0.4)),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: const Icon(Icons.hardware, color: GameTheme.sandGold),
            title: Text(
              '${item['name'] ?? 'Неизвестный предмет'} (тир ${item['tier'] ?? 1})',
              style: const TextStyle(color: GameTheme.lightSand, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              '${item['slot'] ?? 'item'} → ${preview.isEmpty ? "Неизвестно" : preview}',
              style: TextStyle(color: bronze, fontSize: 12),
            ),
            trailing: ElevatedButton(
              onPressed: () => _salvage(item),
              style: ElevatedButton.styleFrom(
                backgroundColor: GameTheme.sandGold.withOpacity(0.1),
                foregroundColor: GameTheme.sandGold,
                side: BorderSide(color: GameTheme.sandGold.withOpacity(0.5)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                padding: const EdgeInsets.symmetric(horizontal: 12),
              ),
              child: const Text('СПЛАВИТЬ', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            ),
          ),
        );
      },
    );
  }
}