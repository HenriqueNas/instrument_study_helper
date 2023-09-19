import 'package:flutter/material.dart' hide Actions;
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
        _theme = ThemeData(
          brightness: themeMode,
          useMaterial3: true,
        );

  ThemeData _theme;

  ThemeData get theme => _theme;

  Brightness _themeMode;

  Brightness get themeMode => _themeMode;

  IconData get themeModeIcon => themeMode == Brightness.light //
      ? Icons.dark_mode
      : Icons.light_mode;

  bool get isDark => themeMode == Brightness.dark;

  void toggleThemeMode() {
    _themeMode = themeMode == Brightness.light //
        ? Brightness.dark //
        : Brightness.light;

    _theme = ThemeData(brightness: themeMode);

    notifyListeners();
  }
}
