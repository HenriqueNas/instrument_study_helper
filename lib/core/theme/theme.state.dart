import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ThemeState extends ChangeNotifier {
  static ChangeNotifierProvider<ThemeState> provider([ThemeState? themeState]) {
    return ChangeNotifierProvider<ThemeState>.value(
      value: themeState ?? ThemeState(themeMode: Brightness.light),
    );
  }

  ThemeState({
    required Brightness themeMode,
  })  : _themeMode = themeMode,
        _theme = CupertinoThemeData(brightness: themeMode);

  CupertinoThemeData _theme;

  CupertinoThemeData get theme => _theme;

  Brightness _themeMode;

  Brightness get themeMode => _themeMode;

  IconData get themeModeIcon => themeMode == Brightness.light //
      ? CupertinoIcons.moon_stars
      : CupertinoIcons.sun_max;

  bool get isDark => themeMode == Brightness.dark;

  void toggleThemeMode() {
    _themeMode = themeMode == Brightness.light //
        ? Brightness.dark //
        : Brightness.light;

    _theme = CupertinoThemeData(brightness: themeMode);

    notifyListeners();
  }
}
