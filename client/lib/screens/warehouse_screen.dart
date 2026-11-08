import 'dart:ui';
import 'package:flutter/material.dart';
import '../services/api_client.dart';
import '../services/session.dart';
import '../services/localization.dart';
import '../ui_kit.dart';

class WarehouseScreen extends StatefulWidget {
  const WarehouseScreen({super.key});

  @override
  State<WarehouseScreen> createState() => _WarehouseScreenState();
}

class _WarehouseScreenState extends State<WarehouseScreen> {
  List<Map<String, dynamic>> _resources = [];
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
        final rawRes = (resp['resources'] as List<dynamic>?) ?? [];
        
        final filteredRes = rawRes.where((r) {
          final amount = (r['amount'] as num?)?.toInt() ?? 0;
          return amount > 0;
        }).cast<Map<String, dynamic>>().toList();
        
        filteredRes.sort((a, b) => (a['resource_type'] as String).compareTo(b['resource_type'] as String));
        
        setState(() {
          _resources = filteredRes;
          _loading = false;
        });
      } else {
        setState(() => _loading = false);
      }
    } catch (e) {
      debugPrint('Warehouse load error: $e');
      setState(() => _loading = false);
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
        title: Text('СКЛАД', style: TextStyle(fontFamily: 'Neucha', color: GameTheme.sandGold, fontWeight: FontWeight.bold, fontSize: 24, letterSpacing: 2)),
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
                constraints: const BoxConstraints(maxWidth: 1000),
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
                        'РЕСУРСЫ НА СКЛАДЕ',
                        style: const TextStyle(fontFamily: 'Neucha', fontSize: 20, fontWeight: FontWeight.bold, color: GameTheme.sandGold, letterSpacing: 2),
                      ),
                    ),

                    Expanded(
                      child: _loading
                        ? const Center(child: CircularProgressIndicator(color: GameTheme.sandGold))
                        : _resources.isEmpty
                            ? const Center(child: Text('Склад пуст', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic)))
                            : GridView.builder(
                                padding: const EdgeInsets.all(30),
                                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 220,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                  childAspectRatio: 1.5, 
                                ),
                                itemCount: _resources.length,
                                itemBuilder: (context, index) {
                                  return _buildResourceCard(_resources[index]);
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

  Widget _buildResourceCard(Map<String, dynamic> res) {
    final type = res['resource_type'] as String;
    final name = resourceName(type);
    final amount = res['amount'];

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF11100F).withOpacity(0.7),
        border: Border.all(color: bronze.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(getResourceIcon(type), color: GameTheme.sandGold, size: 28),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: GameTheme.sandGold.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '$amount',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: GameTheme.lightSand),
                ),
              ),
            ],
          ),
          
          const Spacer(),
          Text(
            name,
            style: const TextStyle(
              fontFamily: 'Neucha', 
              fontSize: 16, 
              color: GameTheme.lightSand, 
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
            maxLines: 2, 
            overflow: TextOverflow.visible,
          ),
        ],
      ),
    );
  }
}