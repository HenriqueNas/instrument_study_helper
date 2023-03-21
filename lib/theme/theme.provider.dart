import 'package:flutter/cupertino.dart';

class ThemeProvider extends InheritedWidget {
  const ThemeProvider({
    super.key,
    required super.child,
    required this.toggleTheme,
    this.themeMode = Brightness.light,
  });

  final Brightness themeMode;
  final VoidCallback toggleTheme;

  bool get isDark => themeMode == Brightness.dark;
  IconData get icon => isDark //
      ? CupertinoIcons.moon_stars //
      : CupertinoIcons.sun_max;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return themeMode != (oldWidget as ThemeProvider).themeMode;
  }

  static ThemeProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeProvider>()!;
  }
}
