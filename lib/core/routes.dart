import 'package:flutter/material.dart' hide Actions;

import '../home.page.dart';
import '../modules/pratice/advanced.page.dart';
import '../modules/pratice/settings.page.dart';

abstract class Routes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    home: (context) => const HomePage(),
    praticeSettings: (context) => const PraticeSettingsPage(),
    advanced: (context) => const AdvancedPage(),
  };
  static const String initialRoute = home;

  static const String home = '/';

  static const String praticeSettings = '/pratice-settings';
  static const String advanced = '/advanced';
}
