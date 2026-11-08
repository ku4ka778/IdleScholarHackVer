import 'package:flutter/material.dart';

import 'profile_screen.dart';
import 'character_screen.dart';
import 'talents_screen.dart';
import '../services/session.dart';
import 'city_screen.dart';
import 'dart:ui'; 
import '../ui_kit.dart'; 

class HomeScreen extends StatelessWidget {
  final bool fromCity;
  const HomeScreen({super.key, this.fromCity = false});

  Widget _buildMenuButton(
    BuildContext context,
    String title,
    Widget targetScreen, {
    Color? color,
    IconData? icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => targetScreen),
          );
        },
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            decoration: BoxDecoration(
              color: GameTheme.deepBlue.withOpacity(0.7),
              border: Border.all(color: GameTheme.sandGold.withOpacity(0.3), width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(icon ?? Icons.circle, color: color ?? GameTheme.sandGold, size: 28),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Neucha',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: GameTheme.lightSand,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                Icon(Icons.arrow_forward_ios, color: GameTheme.sandGold.withOpacity(0.5), size: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

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
          
              child: SingleChildScrollView(
                padding: EdgeInsets.all(isMobile ? 16 : 30),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 800),
                  padding: EdgeInsets.all(isMobile ? 20 : 40),
                  decoration: BoxDecoration(
                    color: GameTheme.pixelDark.withOpacity(0.85),
                    border: Border.all(color: GameTheme.sandGold, width: 2),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.6), blurRadius: 30, spreadRadius: 10),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back, color: GameTheme.sandGold, size: 28),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          const Spacer(),
                          GameTheme.buildTitle('ДОМ', isMobile ? 28 : screenWidth * 0.05),
                          const Spacer(),
                          const SizedBox(width: 48),
                        ],
                      ),
                      const SizedBox(height: 30),

                 
                      _buildMenuButton(
                        context, 
                        'ПРОФИЛЬ И СТАТЫ', 
                        const ProfileScreen(),
                        icon: Icons.person,
                      ),
                      _buildMenuButton(
                        context, 
                        'ИНВЕНТАРЬ И ЭКИПИРОВКА', 
                        const CharacterScreen(),
                        icon: Icons.backpack,
                      ),
                      _buildMenuButton(
                        context, 
                        'ДРЕВО НАВЫКОВ', 
                        const TalentsScreen(),
                        color: Colors.indigo,
                        icon: Icons.account_tree,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}