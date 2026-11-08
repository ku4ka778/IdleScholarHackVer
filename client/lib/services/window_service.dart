import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter/foundation.dart' show kIsWeb; 

class WindowService {
  static Future<void> init() async {
    if (kIsWeb) return;

    await windowManager.ensureInitialized();

    const opts = WindowOptions(
      size: Size(1200, 800),
      center: true,
      title: 'IdleScholar',
    );

    await windowManager.waitUntilReadyToShow(opts, () async {
      await windowManager.show();
      await windowManager.focus();
    });

    await windowManager.setResizable(false);
    await windowManager.setPreventClose(true);
  }

  static Future<void> setAlwaysOnTop(bool value) async {
    if (kIsWeb) return; 
    await windowManager.setAlwaysOnTop(value);
  }

  static Future<void> hide() async {
    if (kIsWeb) return; 
    await windowManager.hide();
  }

  static Future<void> show() async {
    if (kIsWeb) return; 
    await windowManager.show();
    await windowManager.focus();
  }
}
