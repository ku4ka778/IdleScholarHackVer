import 'dart:ui';
import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'forge_screen.dart';
import 'warehouse_screen.dart';
import 'city_hall_screen.dart';
import 'tavern_screen.dart';
import 'barracks_screen.dart';
import 'wall_screen.dart';
import 'post_office_screen.dart';

import '../ui_kit.dart'; 

class CityScreen extends StatelessWidget {
  const CityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: GameTheme.deepBlue,
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
                margin: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: GameTheme.pixelDark.withOpacity(0.85),
                  border: Border.all(color: GameTheme.sandGold, width: 2),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.6), blurRadius: 30, spreadRadius: 10),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: GameTheme.sandGold.withOpacity(0.3), width: 1)),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back, color: GameTheme.sandGold, size: 28),
                            onPressed: () => Navigator.pop(context),
                          ),
                          
                          Expanded(
                            child: _buildDecorativeLine(isLeft: true),
                          ),
                          
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: GameTheme.buildTitle('ГОРОД', screenWidth * 0.04),
                          ),
                          
                          Expanded(
                            child: _buildDecorativeLine(isLeft: false),
                          ),
                          
                          const SizedBox(width: 48), 
                        ],
                      ),
                    ),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: GridView.builder(
                          itemCount: 8,
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 240,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            childAspectRatio: 1.1,
                          ),
                          itemBuilder: (context, index) {
                            return _buildBuildingCard(context, index);
                          },
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

  Widget _buildDecorativeLine({required bool isLeft}) {
    return Row(
      children: [
        if (isLeft) Expanded(child: Container(height: 1, color: GameTheme.sandGold.withOpacity(0.3))),
        
  
        Transform.rotate(
          angle: 0.785, 
          child: Container(
            width: 8, 
            height: 8, 
            decoration: BoxDecoration(
              color: GameTheme.sandGold,
              border: Border.all(color: GameTheme.sandGold),
            ),
          ),
        ),
        
        const SizedBox(width: 8),
        Expanded(child: Container(height: 1, color: GameTheme.sandGold.withOpacity(0.3))),
      ],
    );
  }

  Widget _buildBuildingCard(BuildContext context, int index) {
    final List<Map<String, dynamic>> buildings = [
      {'title': 'Дом', 'icon': Icons.home, 'route': const HomeScreen(), 'routeName': '/home'},
      {'title': 'Главное здание', 'icon': Icons.account_balance, 'route': const CityHallScreen(), 'routeName': ''},
      {'title': 'Кузня', 'icon': Icons.hardware, 'route': const ForgeScreen(), 'routeName': ''},
      {'title': 'Трактир', 'icon': Icons.local_bar, 'route': const TavernScreen(), 'routeName': ''},
      {'title': 'Склад', 'icon': Icons.inventory_2, 'route': const WarehouseScreen(), 'routeName': ''},
      {'title': 'Казарма', 'icon': Icons.shield, 'route': const BarracksScreen(), 'routeName': ''},
      {'title': 'Почтовый двор', 'icon': Icons.mail, 'route': const PostOfficeScreen(), 'routeName': ''},
      {'title': 'Стена', 'icon': Icons.fort, 'route': const WallScreen(), 'routeName': ''},
    ];

    final building = buildings[index];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => building['route'],
            settings: RouteSettings(name: building['routeName']),
          ),
        );
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          decoration: BoxDecoration(
            color: GameTheme.deepBlue.withOpacity(0.6),
            border: Border.all(color: GameTheme.sandGold.withOpacity(0.3), width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                building['icon'],
                size: 48,
                color: GameTheme.sandGold.withOpacity(0.8),
              ),
              const SizedBox(height: 16),
              Text(
                building['title'],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Neucha',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: GameTheme.lightSand,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}