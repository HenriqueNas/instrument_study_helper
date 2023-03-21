import 'package:flutter/cupertino.dart';

class ThemeState extends ChangeNotifier {
  ThemeState({
    required Brightness theme,
  }) : _theme = theme;

  Brightness _theme;

  Brightness get theme => _theme;

  IconData get icon => theme == Brightness.light //
      ? CupertinoIcons.moon_stars
      : CupertinoIcons.sun_max;

  bool get isDark => theme == Brightness.dark;

  void toggleTheme() {
    _theme = theme == Brightness.light //
        ? Brightness.dark //
        : Brightness.light;
    notifyListeners();
  }
}
