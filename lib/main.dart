import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Actions;
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'core/theme/theme.state.dart';
import 'home.page.dart';
import 'modules/pratice/advanced.page.dart';
import 'modules/pratice/settings.page.dart';
import 'modules/pratice/states/accord.state.dart';
import 'modules/pratice/states/actions.state.dart';
import 'modules/settings/settings.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

final a = Container();

class _MyAppState extends State<MyApp> {
  final themeState = ThemeState(
    themeMode: Brightness.light,
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
        ThemeState.provider(themeState),
        AccordState.provider(),
        ActionsState.provider(),
      ],
      child: MaterialApp(
        title: 'Instrumental Studying Helper',
        builder: (cupertinoCtx, child) {
          // final backgroundColor = CupertinoDynamicColor.resolve(
          //   Colors.systemBackground,
          //   cupertinoCtx,
          // );

          return ResponsiveWrapper.builder(
            child,
            maxWidth: 1200,
            minWidth: 450,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(450, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            ],
            // backgroundColor: backgroundColor,
            // background: Container(color: backgroundColor),
          );
        },
        theme: themeState.theme,
        debugShowCheckedModeBanner: kDebugMode,
        initialRoute: '/',
        routes: {
          '/': (_) => const HomePage(),
          '/settings': (_) => const SettingsPage(),
          AdvancedPage.routeName: (_) => const AdvancedPage(),
          PraticeSettingsPage.routeName: (_) => const PraticeSettingsPage(),
        },
      ),
    );
  }
}
