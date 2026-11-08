import 'dart:ui';

import 'package:flutter/material.dart';
import '../ui_kit.dart';
import 'create_character_screen.dart';
import '../services/api_client.dart';
import '../services/session.dart';
import 'map_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  bool _isLoading = false;

  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final confirmController = TextEditingController();

  final Color deepBlue = const Color(0xFF1B243B);
  final Color twilightPurple = const Color(0xFF2B2542);
  final Color sandGold = const Color(0xFFD4A373);
  final Color lightSand = const Color(0xFFFAEDCD);
  final Color pixelDark = const Color(0xFF0F1523);

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    emailController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  String? validatePassword(String pass) {
    if (pass.length < 8) return 'Пароль должен быть минимум 8 символов';
    if (!RegExp(r'[0-9]').hasMatch(pass))
      return 'Пароль должен содержать хотя бы одну цифру';
    return null;
  }

  String? validateEmail(String email) {
    if (email.isEmpty) return 'Введите email';
    final emailRegex = RegExp(r'^[\w\.\-]+@[\w\-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(email)) return 'Некорректный email';
    return null;
  }

  Future<void> submit() async {
    final login = loginController.text.trim();
    final pass = passwordController.text.trim();

    if (login.isEmpty) {
      _snack('Введите логин');
      return;
    }

    if (isLogin) {
      if (pass.isEmpty) {
        _snack('Введите пароль');
        return;
      }
      if (pass.length < 8 || !RegExp(r'[0-9]').hasMatch(pass)) {
        _snack('Пароль не верный');
        return;
      }
    } else {
      final passError = validatePassword(pass);
      if (passError != null) {
        _snack(passError);
        return;
      }
    }

    if (!isLogin) {
      final email = emailController.text.trim();
      final emailError = validateEmail(email);
      if (emailError != null) {
        _snack(emailError);
        return;
      }

      final confirm = confirmController.text.trim();
      if (pass != confirm) {
        _snack('Пароли не совпадают');
        return;
      }
    }

    setState(() => _isLoading = true);

    try {
      if (isLogin) {
        final resp = await apiClient.login(login, pass);

        if (resp['success'] != true) {
          _snack(resp['message'] ?? 'Ошибка входа');
          return;
        }

        Session.accountId = resp['account_id'];
        Session.characterId = resp['character_id'];
        Session.characterName = resp['character_name'];

        if (!mounted) return;

        if (Session.characterId == 0 || Session.characterId == null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const CharacterCreateScreen(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LocationSelectScreen(),
            ),
          );
        }
      } else {
        final email = emailController.text.trim();
        final resp = await apiClient.register(login, pass, email);

        if (resp['success'] != true) {
          _snack(resp['message'] ?? 'Ошибка регистрации');
          return;
        }

        _snack('Успешная регистрация! Теперь войдите.');
        setState(() => isLogin = true);
      }
    } catch (e) {
      _snack('Ошибка соединения: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _snack(String text) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(text, style: const TextStyle(color: Colors.white)),
          backgroundColor: twilightPurple,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final formWidth = (screenWidth * 0.45).clamp(320.0, 480.0);

    return Scaffold(
      backgroundColor: deepBlue,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/backroung_art.jpg',
              fit: BoxFit.cover,
            ),
          ),

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

          Center(
            child: SingleChildScrollView(
              child: SizedBox(
                width: formWidth,
                child: Container(
                  padding: EdgeInsets.all(screenWidth * 0.03),
                  decoration: BoxDecoration(
                    color: pixelDark.withOpacity(0.85),
                    border: Border.all(
                      color: sandGold.withOpacity(0.5),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 30,
                        spreadRadius: 10,
                      ),
                    ],
                  ),
                  child: _isLoading
                      ? Center(
                          child: CircularProgressIndicator(color: sandGold),
                        )
                      : _buildForm(screenWidth, screenHeight),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm(double screenWidth, double screenHeight) {
    final gap = (screenHeight * 0.025).clamp(12.0, 25.0);
    final fontTitle = (screenWidth * 0.04).clamp(28.0, 48.0);
    final fontLabel = (screenWidth * 0.012).clamp(12.0, 16.0);
    final fontInput = (screenWidth * 0.018).clamp(16.0, 22.0);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildPixelTitle(fontTitle),
        const SizedBox(height: 8),
        Text(
          isLogin ? "С ВОЗВРАЩЕНИЕМ" : "СОЗДАНИЕ АККАУНТА",
          style: TextStyle(
            fontSize: fontLabel * 1.2,
            color: sandGold.withOpacity(0.7),
            letterSpacing: 3,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: gap * 1.5),

        _buildField(
          label: "ЛОГИН",
          controller: loginController,
          icon: Icons.person_outline,
          fontLabel: fontLabel,
          fontInput: fontInput,
        ),
        SizedBox(height: gap),

        if (!isLogin) ...[
          _buildField(
            label: "EMAIL",
            controller: emailController,
            icon: Icons.email_outlined,
            fontLabel: fontLabel,
            fontInput: fontInput,
          ),
          SizedBox(height: gap),
        ],

        _buildField(
          label: "ПАРОЛЬ",
          controller: passwordController,
          icon: Icons.lock_outline,
          obscure: _obscurePassword,
          showToggle: true,
          onToggle: () => setState(() => _obscurePassword = !_obscurePassword),
          fontLabel: fontLabel,
          fontInput: fontInput,
        ),
        SizedBox(height: gap),

        if (!isLogin) ...[
          _buildField(
            label: "ПОВТОРИТЕ ПАРОЛЬ",
            controller: confirmController,
            icon: Icons.lock_outline,
            obscure: _obscureConfirm,
            showToggle: true,
            onToggle: () => setState(() => _obscureConfirm = !_obscureConfirm),
            fontLabel: fontLabel,
            fontInput: fontInput,
          ),
          SizedBox(height: gap),
        ],

        SizedBox(height: gap),

        _buildButton(
          text: isLogin ? "ВОЙТИ В ИГРУ" : "СОЗДАТЬ АККАУНТ",
          fontSize: fontLabel * 1.5,
          onTap: submit,
        ),

        SizedBox(height: gap),

        GestureDetector(
          onTap: () => setState(() => isLogin = !isLogin),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Text(
              isLogin
                  ? "Нет аккаунта? Зарегистрироваться"
                  : "Уже есть аккаунт? Войти",
              style: TextStyle(
                fontSize: fontLabel,
                color: lightSand.withOpacity(0.6),
                decoration: TextDecoration.underline,
                decorationColor: sandGold.withOpacity(0.5),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPixelTitle(double fontSize) {
    const text = "IdleScholar";

    Widget shadowLayer(double offsetX, double offsetY, Color color) {
      return Transform.translate(
        offset: Offset(offsetX, offsetY),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: 'Neucha',
            fontWeight: FontWeight.w900,
            color: color,
            letterSpacing: 2,
          ),
        ),
      );
    }

    return Stack(
      children: [
        shadowLayer(4, 4, Colors.black.withOpacity(0.8)),
        shadowLayer(2, 2, Colors.black),

        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFAEDCD), Color(0xFFD4A373), Color(0xFFB07D4A)],
            stops: [0.0, 0.5, 1.0],
          ).createShader(bounds),
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontFamily: 'Neucha',
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: 2,
              shadows: [
                Shadow(
                  color: const Color(0xFFFAEDCD).withOpacity(0.5),
                  blurRadius: 10,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    required double fontLabel,
    required double fontInput,
    bool obscure = false,
    VoidCallback? onToggle,
    bool showToggle = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 6),
          child: Text(
            label,
            style: TextStyle(
              fontSize: fontLabel,
              color: sandGold.withOpacity(0.8),
              letterSpacing: 1.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: deepBlue.withOpacity(0.4),
            border: Border.all(color: sandGold.withOpacity(0.3), width: 1),
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 55,
          child: Row(
            children: [
              Icon(
                icon,
                color: sandGold.withOpacity(0.6),
                size: fontInput * 1.2,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  controller: controller,
                  obscureText: obscure,
                  style: TextStyle(fontSize: fontInput, color: lightSand),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isCollapsed: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
              if (showToggle)
                GestureDetector(
                  onTap: onToggle,
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      obscure
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: sandGold.withOpacity(0.6),
                      size: fontInput * 1.2,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButton({
    required String text,
    required double fontSize,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [sandGold.withOpacity(0.8), sandGold.withOpacity(0.5)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(color: sandGold, width: 2),
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                color: sandGold.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              color: pixelDark,
            ),
          ),
        ),
      ),
    );
  }
}
