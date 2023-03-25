import 'package:flutter/cupertino.dart';

import '../home.page.dart';
import '../modules/pratice/settings.page.dart';

abstract class Routes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    home: (context) => const HomePage(),
    praticeSettings: (context) => const PraticeSettingsPage(),
  };
  static const String initialRoute = home;

  static const String home = '/';

  static const String praticeSettings = '/pratice-settings';
}
