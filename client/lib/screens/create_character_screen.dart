import 'dart:ui';
import 'package:flutter/material.dart';

import '../services/session.dart';
import '../services/api_client.dart';
import 'map_screen.dart';
import '../ui_kit.dart';

class CharacterCreateScreen extends StatefulWidget {
  const CharacterCreateScreen({super.key});

  @override
  State<CharacterCreateScreen> createState() => _CharacterCreateScreenState();
}

class _CharacterCreateScreenState extends State<CharacterCreateScreen> {
  int _selectedIndex = 0;
  bool _isLoading = false;
  final _nameController = TextEditingController();

  final List<Map<String, dynamic>> _classes = [
    {
      'name': 'Рыцарь',
      'id': 'warrior',
      'desc': 'Стойкий воин, обладающий высокой выживаемостью и тяжелой броней.',
      'color': const Color(0xFF8B0000),
      'stats': {'Сила': 4, 'Ловкость': 3, 'Интеллект': 1, 'Удача': 2, 'Хп': 275, 'Мана': 83},
      'image': 'assets/images/warrior.png', 
    },
    {
      'name': 'Маг',
      'id': 'mage',
      'desc': 'Хрупкий, но обладающий огромным запасом маны для разрушительных заклинаний.',
      'color': const Color(0xFF2E8B57),
      'stats': {'Сила': 2, 'Ловкость': 3, 'Интеллект': 4, 'Удача': 2, 'Хп': 85, 'Мана': 120},
      'image': 'assets/images/mage.png', 
    },
    {
      'name': 'Бард',
      'id': 'bard',
      'desc': 'Универсальный класс, сочетающий в себе поддержку союзников и средний урон.',
      'color': const Color(0xFF483D8B),
      'stats': {'Сила': 2, 'Ловкость': 4, 'Интеллект': 3, 'Удача': 1, 'Хп': 195, 'Мана': 120},
      'image': 'assets/images/bard.png', 
    },
    {
      'name': 'Алхимик',
      'id': 'alchemist',
      'desc': 'Мастер зелий и взрывчатых веществ. Высокий запас маны и неплохая сила.',
      'color': const Color(0xFFDAA520),
      'stats': {'Сила': 1, 'Ловкость': 1, 'Интеллект': 3, 'Удача': 4, 'Хп': 200, 'Мана': 140},
      'image': 'assets/images/alchemist.png',
    },
  ];

  final Color bronze = const Color(0xFF8B7D6B);

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _createCharacter() async {
    if (_nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Введите имя персонажа'), backgroundColor: Colors.redAccent),
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      final charClass = _classes[_selectedIndex]['id'];

      final resp = await apiClient.createCharacter(
        Session.accountId ?? 0,
        _nameController.text,
        charClass,
      );

      if (resp['success'] != true) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(resp['message'] ?? 'Ошибка'), backgroundColor: Colors.redAccent),
          );
        }
        return;
      }

      Session.characterId = resp['character_id'];
      Session.characterName = resp['character_name'];

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LocationSelectScreen()),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка: $e'), backgroundColor: Colors.redAccent),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    return Scaffold(
      backgroundColor: GameTheme.deepBlue,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: GameTheme.sandGold),
        title: Text(
          'СОЗДАНИЕ ПЕРСОНАЖА', 
          style: TextStyle(
            fontFamily: 'Neucha', 
            color: GameTheme.sandGold, 
            fontWeight: FontWeight.bold, 
            fontSize: isMobile ? 18 : 28, 
            letterSpacing: 2
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
  child: BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0), // 👈 Вот этот параметр делает размытие
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
            child: isMobile 
              ? _buildMobileLayout() 
              : _buildDesktopLayout(),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          SizedBox(
            height: 350,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _classes.length,
              itemBuilder: (context, index) => _buildHeroCard(index, true),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF1C1A19),
              border: Border.all(color: bronze, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: _buildInfoPanel(),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 80, bottom: 40, right: 20),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final double cardWidth = (constraints.maxWidth / 4) - 20; 
                
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(_classes.length, (index) {
                    return _buildHeroCard(index, false, height: constraints.maxHeight, width: cardWidth);
                  }),
                );
              },
            ),
          ),
        ),
        
        Expanded(
          flex: 3,
          child: Container(
            margin: const EdgeInsets.only(right: 20, top: 80, bottom: 40),
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: const Color(0xFF1C1A19),
              border: Border.all(color: bronze, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: _buildInfoPanel(),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoPanel() {
    final currentHero = _classes[_selectedIndex];
    final heroColor = currentHero['color'] as Color;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          currentHero['name'],
          style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold, color: heroColor, letterSpacing: 2, fontFamily: 'Neucha'),
        ),
        const SizedBox(height: 10),
        Divider(color: bronze.withOpacity(0.3), thickness: 2),
        const SizedBox(height: 15),
        
        Text(
          currentHero['desc'],
          style: TextStyle(fontSize: 14, color: Colors.grey[400], height: 1.5),
        ),
        
        const SizedBox(height: 30),
        
        Text('ХАРАКТЕРИСТИКИ', style: TextStyle(fontSize: 12, color: bronze, letterSpacing: 2, fontWeight: FontWeight.bold)),
        const SizedBox(height: 15),
        ..._buildStats(currentHero['stats']),
        
        const Spacer(),
        
        TextField(
          controller: _nameController,
          style: const TextStyle(color: GameTheme.lightSand, fontSize: 16),
          decoration: InputDecoration(
            labelText: 'ИМЯ ПЕРСОНАЖА',
            labelStyle: TextStyle(color: bronze, fontSize: 14),
            filled: true,
            fillColor: const Color(0xFF0D0D0D),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: bronze.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(4),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: heroColor),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        
        const SizedBox(height: 20),
        
        SizedBox(
          width: double.infinity,
          height: 55,
          child: _isLoading
              ? Center(child: CircularProgressIndicator(color: heroColor))
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: heroColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  ),
                  onPressed: _createCharacter,
                  child: const Text('ВЫБРАТЬ', style: TextStyle(fontSize: 20, letterSpacing: 2, fontWeight: FontWeight.bold)),
                ),
        ),
      ],
    );
  }

  Widget _buildHeroCard(int index, bool isMobile, {double? height, double? width}) {
    final isSelected = _selectedIndex == index;
    final hero = _classes[index];

    final double cardHeight = height ?? 300;
    final double cardWidth = width ?? 160;
    final double opacity = isSelected ? 1.0 : 0.5;

    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        width: cardWidth,
        height: isSelected && !isMobile ? cardHeight : cardHeight * 0.85, 
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? hero['color'] : Colors.transparent, width: isSelected ? 3 : 1),
          boxShadow: isSelected ? [BoxShadow(color: hero['color'].withOpacity(0.4), blurRadius: 20, spreadRadius: 2)] : [],
          color: Colors.black.withOpacity(0.3), 
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Opacity(
              opacity: opacity,
              child: Image.asset(
                hero['image'],
                fit: BoxFit.contain, 
                alignment: Alignment.bottomCenter,
                errorBuilder: (context, error, stackTrace) => const Center(
                  child: Icon(Icons.broken_image, color: Colors.grey, size: 50),
                ),
              ),
            ),
            
            Positioned(
              bottom: 0, left: 0, right: 0,
              height: 80,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, GameTheme.pixelDark.withOpacity(0.95)],
                  ),
                ),
              ),
            ),
            
            Positioned(
              bottom: 15, left: 0, right: 0,
              child: Text(
                hero['name'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isSelected ? 20 : 16,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.white54,
                  letterSpacing: 1,
                  fontFamily: 'Neucha',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildStats(Map<String, dynamic> stats) {
    final List<String> attributes = ['Сила', 'Ловкость', 'Интеллект', 'Броня'];
    final List<String> resources = ['Хп', 'Мана'];
    final heroColor = _classes[_selectedIndex]['color'] as Color;

    return [
      ...attributes.map((attr) {
        final value = stats[attr] ?? 0;
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(attr, style: TextStyle(color: bronze, fontSize: 14)),
                  Text('$value / 10', style: const TextStyle(color: GameTheme.lightSand, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 6),
              LinearProgressIndicator(
                value: value / 10.0,
                backgroundColor: const Color(0xFF0D0D0D),
                color: heroColor,
                minHeight: 6,
              ),
            ],
          ),
        );
      }),
      
      const SizedBox(height: 15),
      Divider(color: bronze.withOpacity(0.2)),
      const SizedBox(height: 15),
      
      ...resources.map((res) {
        final value = stats[res] ?? 0;
        final isHp = res == 'Хп';
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            children: [
              Icon(isHp ? Icons.favorite : Icons.water_drop, color: isHp ? Colors.redAccent : Colors.blueAccent, size: 20),
              const SizedBox(width: 8),
              Text(res, style: TextStyle(color: bronze, fontSize: 14)),
              const Spacer(),
              Text('$value', style: TextStyle(color: isHp ? Colors.redAccent : Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 18)),
            ],
          ),
        );
      }),
    ];
  }
}