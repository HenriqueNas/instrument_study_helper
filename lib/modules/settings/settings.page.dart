import 'package:flutter/cupertino.dart';
import 'package:instrumental_studying_helper/theme/theme.state.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeState>();

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 1),
          Expanded(
            flex: 1,
            child: CupertinoButton(
              onPressed: theme.toggleTheme,
              child: Icon(theme.icon, size: 48),
            ),
          ),
          const Spacer(flex: 1),
          Expanded(
            flex: 3,
            child: Column(children: [
              CupertinoButton(
                onPressed: () => launchUrl(
                  Uri.parse('https://www.henriquenas.dev/'),
                ),
                child: const Text('made with ❤️ by @henriquenas'),
              ),
              QrImage(
                data: "https://nubank.com.br/pagar/osldl/7uh3iUTW5v",
                version: QrVersions.auto,
                size: MediaQuery.of(context).size.height * 0.25,
                semanticsLabel: 'Pix QR Code',
                foregroundColor: theme.isDark
                    ? CupertinoColors.white
                    : CupertinoColors.black,
              ),
              const Text('buy me a coffee'),
            ]),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
