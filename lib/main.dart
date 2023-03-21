import 'package:flutter/cupertino.dart';

import 'home.page.dart';
import 'theme/theme.provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Brightness theme = Brightness.light;

  void toggleTheme() {
    setState(() {
      theme = theme == Brightness.light //
          ? Brightness.dark //
          : Brightness.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      themeMode: theme,
      toggleTheme: toggleTheme,
      child: CupertinoApp(
        title: 'Instrumental Studying Helper',
        theme: CupertinoThemeData(brightness: theme),
        home: const HomePage(),
      ),
    );
  }
}
