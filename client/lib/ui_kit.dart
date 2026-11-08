import 'package:flutter/material.dart';

class GameTheme {
  // Цвета из твоего арта (Глубокий синий, фиолетовый, песочное золото)
  static const Color deepBlue = Color(0xFF1B243B);
  static const Color twilightPurple = Color(0xFF2B2542);
  static const Color pixelDark = Color(0xFF0F1523);
  static const Color sandGold = Color(0xFFD4A373);
  static const Color lightSand = Color(0xFFFAEDCD);

  // Красивый заголовок с пиксельным градиентом (как мы делали на авторизации)
  static Widget buildTitle(String text, double fontSize) {
    return Stack(
      children: [
        Transform.translate(
          offset: const Offset(4, 4),
          child: Text(
            text,
            style: TextStyle(fontSize: fontSize, fontFamily: 'Neucha', fontWeight: FontWeight.w900, color: Colors.black.withOpacity(0.8), letterSpacing: 2),
          ),
        ),
        Transform.translate(
          offset: const Offset(2, 2),
          child: Text(
            text,
            style: TextStyle(fontSize: fontSize, fontFamily: 'Neucha', fontWeight: FontWeight.w900, color: Colors.black, letterSpacing: 2),
          ),
        ),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [GameTheme.lightSand, GameTheme.sandGold, Color(0xFFB07D4A)],
            stops: [0.0, 0.5, 1.0],
          ).createShader(bounds),
          child: Text(
            text,
            style: TextStyle(fontSize: fontSize, fontFamily: 'Neucha', fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: 2),
          ),
        ),
      ],
    );
  }

  // Красивая кнопка
  static Widget buildButton({required String text, required VoidCallback onTap, bool isMain = false}) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          height: isMain ? 60 : 50,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isMain 
                  ? [sandGold.withOpacity(0.9), sandGold.withOpacity(0.6)] 
                  : [pixelDark.withOpacity(0.8), twilightPurple.withOpacity(0.8)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(color: sandGold, width: isMain ? 2 : 1),
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(color: isMain ? sandGold.withOpacity(0.3) : Colors.black.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 4)),
            ]
          ),
          alignment: Alignment.center,
          child: Text(
            text, 
            style: TextStyle(
              fontSize: isMain ? 20 : 16, 
              fontWeight: FontWeight.bold, 
              letterSpacing: 2, 
              fontFamily: 'Neucha',
              color: isMain ? pixelDark : lightSand,
            ),
          ),
        ),
      ),
    );
  }
}