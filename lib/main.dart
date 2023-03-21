import 'package:flutter/cupertino.dart';
import 'package:piano_tools/theme/theme.provider.dart';

import 'home.page.dart';

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
        title: 'Piano Tools',
        theme: CupertinoThemeData(brightness: theme),
        home: const HomePage(),
      ),
    );
  }
}
