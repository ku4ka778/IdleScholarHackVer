import 'dart:ui';
import 'package:flutter/material.dart';

import 'expedition_setup.dart';
import 'city_screen.dart';
import 'auth_screen.dart';
import 'expedition_active_screen.dart';
import '../services/api_client.dart';
import '../services/session.dart';
import 'dart:async';
import 'pvp_screen.dart';
import 'settings_screen.dart';
import '../ui_kit.dart'; 

class LocationSelectScreen extends StatefulWidget {
  const LocationSelectScreen({super.key});

  @override
  State<LocationSelectScreen> createState() => _LocationSelectScreenState();
}

class _LocationSelectScreenState extends State<LocationSelectScreen> {
  int _selectedIndex = 0;
  int _playerLevel = 1;
  Timer? _coopTimer;
  bool _isNavigatingToExpedition = false;

  @override
  void initState() {
    super.initState();
    _loadLevel();
    _checkOfflineStatus();
    _checkTutorial();
    _startCoopChecker();
  }

  @override
  void dispose() {
    _coopTimer?.cancel();
    super.dispose();
  }

  void _startCoopChecker() {
    _coopTimer?.cancel();
    _coopTimer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      if (_isNavigatingToExpedition) return;

      final charId = Session.characterId;
      if (charId == null) return;

      try {
        final resp = await apiClient.getExpeditionStatus(charId);

        if (resp['success'] == true && resp['is_active'] == true) {
          _isNavigatingToExpedition = true;
          _coopTimer?.cancel();

          if (mounted) {
            bool isAlreadyOnExpedition = false;
            Navigator.popUntil(context, (route) {
              if (route.settings.name == '/expedition') {
                isAlreadyOnExpedition = true;
              }
              return true;
            });

            if (!isAlreadyOnExpedition) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  settings: const RouteSettings(name: '/expedition'),
                  builder: (context) => ExpeditionActiveScreen(
                    locationIndex: (resp['activity_level'] as num?)?.toInt() ?? 0,
                    activityType: (resp['activity_type'] as num?)?.toInt() ?? 0,
                    durationMinutes: ((resp['remaining_seconds'] as num? ?? 0) / 60).ceil(),
                    domains: 'google.com',
                    apps: 'emacs.exe',
                  ),
                ),
              ).then((_) {
                _isNavigatingToExpedition = false;
                _startCoopChecker();
              });
            } else {
              _isNavigatingToExpedition = false;
              _startCoopChecker();
            }
          }
        }
      } catch (e) {
        debugPrint('Coop check error: $e');
      }
    });
  }

  Future<void> _loadLevel() async {
    final charId = Session.characterId;
    if (charId == null) return;
    try {
      final resp = await apiClient.getCharacter(charId);
      if (resp['id'] != null) {
        if (mounted) {
          setState(() {
            _playerLevel = resp['level'] ?? 1;
          });
        }
      }
    } catch (e) {
      debugPrint('Error loading level: $e');
    }
  }

  Future<void> _checkOfflineStatus() async {
    final charId = Session.characterId;
    if (charId == null) return;

    try {
      final resp = await apiClient.getExpeditionStatus(charId);

      if (resp['success'] == true && resp['just_finished'] == true) {
        final gold = resp['gold_gained'] ?? 0;
        final exp = resp['exp_gained'] ?? 0;

        if (mounted && ((gold as num) > 0 || (exp as num) > 0)) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              backgroundColor: GameTheme.pixelDark,
              title: const Text('Оффлайн-экспедиция', style: TextStyle(color: GameTheme.sandGold)),
              content: Text(
                'Пока вас не было, вы покинули фокус-режим досрочно.\n\n'
                'Заработано: $gold золота (на 50% меньше из-за потери фокуса).\n'
                'Вы получили дебафф к следующим наградам.',
                style: const TextStyle(color: GameTheme.lightSand),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Забрать', style: TextStyle(color: GameTheme.sandGold)),
                ),
              ],
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Offline check error: $e');
    }
  }

    Future<void> _checkTutorial() async {
    final charId = Session.characterId;
    if (charId == null) return;

    try {
      final resp = await apiClient.getCharacter(charId);
      final tutorialStep = (resp['tutorial_step'] as num?)?.toInt() ?? 0;

      if (tutorialStep == 0 && mounted) {
        _showTutorialDialog();
      }
    } catch (e) {
      debugPrint('Tutorial check error: $e');
    }
  }

  void _showTutorialDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
        content: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFFEADDCD), 
            border: Border.all(color: const Color(0xFF4A3C31), width: 3),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 20, spreadRadius: 5),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'ДОБРО ПОЖАЛОВАТЬ, УЧЕНЫЙ!',
                style: TextStyle(
                  fontFamily: 'Neucha',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2A2624),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Твоя цель -- исследовать этот мир, добывать ресурсы и строить город. '
                'А помогать тебе будет Фокус-режим: пока ты сидишь на вкладке, ты зарабатываешь.',
                style: TextStyle(fontSize: 16, color: Color(0xFF4A3C31), height: 1.5),
              ),
              const SizedBox(height: 20),
              const Text(
                'ПЛАН НА СТАРТ:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF8B0000)),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Выбери Локацию 1.\n'
                '2. Нажми ВЫБРАТЬ и запусти фокус-режим.\n'
                '3. Собери награду и загляни в город, советую пройтись по всем зданиям т.к там много полезного!',
                style: TextStyle(fontSize: 16, color: Color(0xFF2A2624), height: 1.6),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2A2624),
                    foregroundColor: const Color(0xFFEADDCD),
                    shape: const BeveledRectangleBorder(),
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                    final charId = Session.characterId;
                    if (charId != null) {
                      await apiClient.completeTutorial(charId);
                    }
                  },
                  child: const Text(
                    'НАЧАТЬ ПУТЬ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openSetup(BuildContext context, int locIndex, int actType) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExpeditionSetupScreen(
          locationIndex: locIndex,
          activityType: actType,
        ),
      ),
    );
  }

  final List<Map<String, dynamic>> _locations = [
		{
      'name': '1. Лес', 
      'level': 'Уровни 1 - 10', 
      'number': 1,
      'desc': 'Древний лес, полный простых ресурсов. Идеальное место для любого новичка.',
      'mechanic': 'Стандартный фарм золота, опыта и базовых материалов.'
    },
    {
      'name': '2. Зачарованное озеро', 
      'level': 'Уровни 11 - 20', 
      'number': 2,
      'desc': 'Воды этого озера обладают магической силой, создавая опасные отражения.',
      'mechanic': '20% шанс встретить Эхо (вашу копию). Победа даёт бонусы, поражение отнимает награду.'
    },
    {
      'name': '3. Зимний лес', 
      'level': 'Уровни 21 - 30', 
      'number': 3,
      'desc': 'Вечная мерзлота и сильнейший холод. Выжить здесь могут только самые стойкие.',
      'mechanic': '15% шанс попасть в Метель. Без еды из Трактира вы потеряете 30% добычи.'
    },
    {
      'name': '4. Кровавое озеро', 
      'level': 'Уровни 31 - 40', 
      'number': 4,
      'desc': 'Вода здесь перенасыщена железом и кислотой. Она разъедает любой металл.',
      'mechanic': 'Коррозия: вся металлическая экипировка (железо/серебро) теряет 20% статов за предмет.'
    },
    {
      'name': '5. Башня Архимага', 
      'level': 'Уровни 41 - 60', 
      'number': 5,
      'desc': 'Логово древнего мага, парящее в небесах. Источник невероятной силы.',
      'mechanic': '20% шанс Магического Резонанса. Может утроить награду или урезать её вдвое.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Scaffold(
      backgroundColor: GameTheme.deepBlue,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: GameTheme.sandGold),
        title: Text(
          'КАРТА МИРА', 
          style: TextStyle(
            fontFamily: 'Neucha', 
            color: GameTheme.sandGold, 
            fontWeight: FontWeight.bold, 
            fontSize: isMobile ? 20 : 24, 
            letterSpacing: 2
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: GameTheme.sandGold, size: 28),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.redAccent, size: 28),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: GameTheme.pixelDark,
                  title: const Text('Выход', style: TextStyle(color: GameTheme.sandGold)),
                  content: const Text('Вы уверены, что хотите выйти из аккаунта?', style: TextStyle(color: GameTheme.lightSand)),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Отмена', style: TextStyle(color: Colors.grey)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const AuthScreen()),
                          (route) => false,
                        );
                      },
                      child: const Text('Выйти', style: TextStyle(color: Colors.redAccent)),
                    ),
                  ],
                ),
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
                constraints: const BoxConstraints(maxWidth: 1000),
                margin: EdgeInsets.all(isMobile ? 10 : 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1A19),
                  border: Border.all(color: const Color(0xFF8B7D6B), width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: isMobile 
                  ? _buildMobileLayout() 
                  : _buildDesktopLayout(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout() {
    final currentLoc = _locations[_selectedIndex];
    return Column(
      children: [
        const SizedBox(height: 15),
        _buildMiniMap(),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: GameTheme.pixelDark.withOpacity(0.8),
            border: Border.all(color: GameTheme.sandGold.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            children: [
              Text(currentLoc['name'], style: const TextStyle(fontFamily: 'Neucha', fontSize: 18, color: GameTheme.sandGold, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(currentLoc['mechanic'], style: const TextStyle(color: Colors.orangeAccent, fontSize: 11, fontStyle: FontStyle.italic), textAlign: TextAlign.center),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: _locations.length,
            itemBuilder: (context, index) => _buildLocationButton(index),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: GameTheme.buildButton(text: "РЕЙД", onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PvPScreen())))),
                  const SizedBox(width: 10),
                  Expanded(child: GameTheme.buildButton(text: "ГОРОД", onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CityScreen(), settings: const RouteSettings(name: '/city'))))),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: GameTheme.buildButton(
                  text: "ВЫБРАТЬ", 
                  isMain: true, 
                  onTap: () => _showActivityBottomSheet(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    final currentLoc = _locations[_selectedIndex];
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                _buildMiniMap(),
               	const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: GameTheme.pixelDark.withOpacity(0.8),
                    border: Border.all(color: GameTheme.sandGold.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentLoc['name'],
                        style: const TextStyle(fontFamily: 'Neucha', fontSize: 24, color: GameTheme.sandGold, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        currentLoc['desc'],
                        style: const TextStyle(color: GameTheme.lightSand, fontSize: 14, height: 1.4),
                      ),
                      const SizedBox(height: 12),
                      const Divider(color: Colors.grey),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.warning_amber_rounded, color: Colors.orangeAccent, size: 18),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              currentLoc['mechanic'],
                              style: const TextStyle(color: Colors.orangeAccent, fontSize: 12, fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: GameTheme.pixelDark.withOpacity(0.8),
                        border: Border.all(color: GameTheme.sandGold.withOpacity(0.5)),
                      ),
                      child: Text(
                        Session.characterName ?? 'Гость',
                        style: const TextStyle(color: GameTheme.sandGold, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            decoration: BoxDecoration(
              color: GameTheme.pixelDark.withOpacity(0.9),
              border: const Border(left: BorderSide(color: GameTheme.sandGold, width: 2)),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    'ВЫБОР ЛОКАЦИИ',
                    style: TextStyle(
                      fontFamily: 'Neucha',
                      fontSize: 24,
                      color: GameTheme.sandGold,
                      letterSpacing: 4,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    itemCount: _locations.length,
                    itemBuilder: (context, index) => _buildLocationButton(index),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: GameTheme.buildButton(
                    text: "РЕЙД (PvP)",
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PvPScreen())),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: GameTheme.buildButton(
                    text: "ГОРОД",
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CityScreen(), settings: const RouteSettings(name: '/city'))),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: GameTheme.buildButton(
                    text: "ВЫБРАТЬ",
                    isMain: true, 
                    onTap: () => _showActivityBottomSheet(),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showActivityBottomSheet() {
    final requiredLevel = _selectedIndex * 10;
    if (_playerLevel < requiredLevel) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Требуется уровень: $requiredLevel'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    showModalBottomSheet(
      context: context,
      backgroundColor: GameTheme.deepBlue,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        side: BorderSide(color: GameTheme.sandGold, width: 2),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text('Кампания (Золото и опыт)', style: TextStyle(color: GameTheme.sandGold, fontWeight: FontWeight.bold)),
                  onTap: () => _openSetup(context, _selectedIndex, 0),
                ),
                if (_selectedIndex == 0) ...[
                  ListTile(title: const Text('Лесопилка (Дерево)', style: TextStyle(color: GameTheme.lightSand)), onTap: () => _openSetup(context, 0, 1)),
                  ListTile(title: const Text('Шахта (Камень)', style: TextStyle(color: GameTheme.lightSand)), onTap: () => _openSetup(context, 0, 2)),
                  ListTile(title: const Text('Охота (Кожа)', style: TextStyle(color: GameTheme.lightSand)), onTap: () => _openSetup(context, 0, 3)),
                ],
                if (_selectedIndex == 1) ...[
                  ListTile(title: const Text('Роща духов (Магическое дерево)', style: TextStyle(color: GameTheme.lightSand)), onTap: () => _openSetup(context, 1, 4)),
                  ListTile(title: const Text('Затонувшие руины (Серебро)', style: TextStyle(color: GameTheme.lightSand)), onTap: () => _openSetup(context, 1, 5)),
                  ListTile(title: const Text('Лунный берег (Кристаллы)', style: TextStyle(color: GameTheme.lightSand)), onTap: () => _openSetup(context, 1, 6)),
                ],
                if (_selectedIndex == 2) ...[
                  ListTile(title: const Text('Мерзлая шахта (Морозная руда)', style: TextStyle(color: GameTheme.lightSand)), onTap: () => _openSetup(context, 2, 7)),
                  ListTile(title: const Text('Ледяная чаща (Мерзлая древесина)', style: TextStyle(color: GameTheme.lightSand)), onTap: () => _openSetup(context, 2, 8)),
                  ListTile(title: const Text('Снежные поля (Снежная кожа)', style: TextStyle(color: GameTheme.lightSand)), onTap: () => _openSetup(context, 2, 9)),
                ],
                if (_selectedIndex == 3) ...[
                  ListTile(title: const Text('Ржавая шахта (Железо)', style: TextStyle(color: GameTheme.lightSand)), onTap: () => _openSetup(context, 3, 10)),
                  ListTile(title: const Text('Кислотные пещеры (Железы)', style: TextStyle(color: GameTheme.lightSand)), onTap: () => _openSetup(context, 3, 11)),
                  ListTile(title: const Text('Коралловый риф (Кораллы)', style: TextStyle(color: GameTheme.lightSand)), onTap: () => _openSetup(context, 3, 12)),
                ],
                if (_selectedIndex == 4) ...[
                  ListTile(title: const Text('Библиотека магии (Эссенция)', style: TextStyle(color: GameTheme.lightSand)), onTap: () => _openSetup(context, 4, 13)),
                  ListTile(title: const Text('Разлом пустоты (Осколки)', style: TextStyle(color: GameTheme.lightSand)), onTap: () => _openSetup(context, 4, 14)),
                  ListTile(title: const Text('Звездный сад (Пыль)', style: TextStyle(color: GameTheme.lightSand)), onTap: () => _openSetup(context, 4, 15)),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLocationButton(int index) {
    final isSelected = _selectedIndex == index;
    final loc = _locations[index];
    final requiredLevel = index * 10;
    final isLocked = _playerLevel < requiredLevel;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        onTap: isLocked ? null : () => setState(() => _selectedIndex = index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          height: 70,
          decoration: BoxDecoration(
            color: isLocked
                ? Colors.black.withOpacity(0.3)
                : (isSelected ? GameTheme.twilightPurple.withOpacity(0.8) : Colors.transparent),
            border: Border.all(
              color: isSelected && !isLocked ? GameTheme.sandGold : GameTheme.sandGold.withOpacity(0.2),
              width: isSelected && !isLocked ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              Container(
                width: 50,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: isSelected && !isLocked ? GameTheme.sandGold : GameTheme.deepBlue.withOpacity(0.5),
                  border: Border(right: BorderSide(color: GameTheme.sandGold.withOpacity(0.5))),
                ),
                alignment: Alignment.center,
                child: isLocked
                    ? Icon(Icons.lock, color: Colors.white.withOpacity(0.3), size: 20)
                    : Text(
                        '${loc['number']}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? GameTheme.pixelDark : GameTheme.sandGold,
                        ),
                      ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      loc['name'],
                      style: TextStyle(
                        fontFamily: 'Neucha',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isLocked ? Colors.grey.shade600 : (isSelected ? Colors.white : GameTheme.lightSand),
                      ),
                    ),
                    Text(
                      isLocked ? 'Требуется уровень: $requiredLevel' : loc['level'],
                      style: TextStyle(
                        fontFamily: 'Neucha',
                        fontSize: 14,
                        color: isLocked ? Colors.redAccent.withOpacity(0.8) : (isSelected ? GameTheme.sandGold : Colors.grey.shade500),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMiniMap() {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: GameTheme.pixelDark.withOpacity(0.8),
        shape: BoxShape.circle,
        border: Border.all(color: GameTheme.sandGold.withOpacity(0.5), width: 2),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 20)],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(200, 200),
            painter: MapLinesPainter(color: GameTheme.sandGold.withOpacity(0.2)),
          ),
          ...List.generate(_locations.length, (index) {
            final radius = 70.0;
            return Positioned(
              left: 100 + (radius * (index / 10)) * (index % 2 == 0 ? 1 : -1) - 6,
              top: 100 + (radius * (index / 10)) * (index % 3 == 0 ? 1 : -1) - 6,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: _selectedIndex == index ? Colors.redAccent : GameTheme.sandGold,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 1),
                ),
              ),
            );
          }),
          const Icon(Icons.explore_outlined, color: GameTheme.sandGold, size: 40),
        ],
      ),
    );
  }
}

class MapLinesPainter extends CustomPainter {
  final Color color;
  MapLinesPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 20;
    canvas.drawCircle(center, radius, paint);
    canvas.drawCircle(center, radius * 0.6, paint);
    canvas.drawCircle(center, radius * 0.3, paint);
    canvas.drawLine(Offset(center.dx, 20), Offset(center.dx, size.height - 20), paint);
    canvas.drawLine(Offset(20, center.dy), Offset(size.width - 20, center.dy), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
