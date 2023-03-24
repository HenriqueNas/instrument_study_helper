import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'home.page.dart';
import 'modules/pratice/states/actions.state.dart';
import 'modules/pratice/states/notes.state.dart';
import 'theme/theme.state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final themeState = ThemeState(
    theme: WidgetsBinding.instance.window.platformBrightness,
  );

  @override
  void initState() {
    super.initState();

    themeState.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeState>.value(
          value: themeState,
        ),
        ChangeNotifierProvider<NotesState>.value(
          value: NotesState(),
        ),
        ChangeNotifierProvider<ActionsState>.value(
          value: ActionsState(),
        ),
      ],
      child: CupertinoApp(
        title: 'Instrumental Studying Helper',
        builder: (context, child) {
          return ResponsiveWrapper.builder(
            child,
            maxWidth: 1200,
            minWidth: 450,
            background: Container(
              color: CupertinoTheme.of(context).barBackgroundColor,
            ),
          );
        },
        routes: {
          '/': (context) => const HomePage(),
        },
        initialRoute: '/',
        theme: CupertinoThemeData(brightness: themeState.theme),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
