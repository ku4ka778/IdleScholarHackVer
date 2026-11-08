import 'package:flutter/gestures.dart'; 
import 'package:flutter/material.dart';
import '../services/api_client.dart';
import '../services/session.dart';
import '../services/localization.dart';
import '../ui_kit.dart';

class ResourceBar extends StatefulWidget {
  const ResourceBar({super.key});

  @override
  State<ResourceBar> createState() => ResourceBarState();
}

class ResourceBarState extends State<ResourceBar> {
  Map<String, int> _resources = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    loadResources();
  }

  Future<void> loadResources() async {
    final charId = Session.characterId;
    if (charId == null) return;

    try {
      final resp = await apiClient.getCity(charId);
      if (resp['success'] == true) {
        final rawRes = (resp['resources'] as List<dynamic>?) ?? [];
        setState(() {
          _resources = {
            for (var r in rawRes) 
              if ((r['amount'] as num? ?? 0) > 0)
                r['resource_type'] : (r['amount'] as num).toInt()
          };
          _loading = false;
        });
      }
    } catch (e) {
      debugPrint('Resource bar error: $e');
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return const SizedBox(height: 40);

    if (_resources.isEmpty) {
      return const SizedBox(
        height: 40,
        child: Center(child: Text('Ресурсов нет', style: TextStyle(color: Colors.grey))),
      );
    }

    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
          scrollbars: false,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: _resources.entries.map((entry) {
              return Container(
                margin: const EdgeInsets.only(right: 12.0),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF11100F),
                  border: Border.all(color: const Color(0xFF8B7D6B).withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    Text(
                      resourceName(entry.key),
                      style: const TextStyle(fontSize: 13, color: GameTheme.lightSand, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'x${entry.value}',
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.greenAccent),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}