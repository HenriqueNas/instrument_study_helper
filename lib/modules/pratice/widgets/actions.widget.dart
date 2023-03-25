import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../settings.page.dart';
import '../states/actions.state.dart';
import 'timer.widget.dart';

class Actions extends StatefulWidget {
  const Actions({super.key});

  @override
  State<Actions> createState() => _ActionsState();
}

class _ActionsState extends State<Actions> {
  @override
  Widget build(BuildContext context) {
    final actions = context.watch<ActionsState>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Timer(),
            Row(children: [
              CupertinoButton(
                onPressed: actions.startPlayer,
                child: Icon(
                  actions.isPlaying
                      ? CupertinoIcons.play_arrow_solid
                      : CupertinoIcons.play_arrow,
                ),
              ),
              CupertinoButton(
                onPressed: actions.stopPlayer,
                child: Icon(
                  actions.isPlaying
                      ? CupertinoIcons.stop
                      : CupertinoIcons.stop_fill,
                ),
              ),
              CupertinoButton(
                onPressed: actions.toggleAudio,
                child: Icon(
                  actions.useAudio
                      ? CupertinoIcons.volume_mute
                      : CupertinoIcons.volume_off,
                ),
              ),
            ]),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400, minWidth: 200),
              child: CupertinoButton.filled(
                padding: const EdgeInsets.all(16),
                onPressed: () => Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => const PraticeSettingsPage(),
                )),
                child: const Text('Configurações'),
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400, minWidth: 200),
              child: CupertinoButton.filled(
                padding: const EdgeInsets.all(16),
                onPressed: () => Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => const PraticeSettingsPage(),
                )),
                child: const Text('Acordes'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
