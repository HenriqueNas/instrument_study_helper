import 'package:flutter/cupertino.dart';
import 'package:piano_tools/theme/theme.provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context);

    return Center(
      child: CupertinoButton(
        onPressed: theme.toggleTheme,
        child: Icon(theme.icon),
      ),
    );
  }
}
