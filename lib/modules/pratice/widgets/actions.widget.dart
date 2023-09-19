import 'package:flutter/material.dart' hide Actions;
import 'package:instrumental_studying_helper/modules/pratice/advanced.page.dart';
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
              TextButton(
                onPressed: actions.startPlayer,
                child: Icon(
                  actions.isPlaying
                      ? Icons.play_arrow
                      : Icons.play_arrow_outlined,
                ),
              ),
              TextButton(
                onPressed: actions.stopPlayer,
                child: Icon(
                  actions.isPlaying ? Icons.stop : Icons.stop_outlined,
                ),
              ),
              TextButton(
                onPressed: actions.toggleAudio,
                child: Icon(
                  actions.useAudio
                      ? Icons.volume_mute
                      : Icons.volume_off_outlined,
                ),
              ),
            ]),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            _ActionButton(
              title: 'Acordes',
              navigateTo: PraticeSettingsPage.routeName,
            ),
            _ActionButton(
              title: 'Avançado',
              navigateTo: AdvancedPage.routeName,
            ),
          ],
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.title,
    required this.navigateTo,
  });

  final String title;
  final String navigateTo;

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400, minWidth: 200),
      child: ElevatedButton(
        onPressed: () => navigator.pushNamed(navigateTo),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16),
        ),
        child: Text(title),
      ),
    );
  }
}
