import 'package:flutter/cupertino.dart';
import 'package:instrumental_studying_helper/modules/pratice/states/actions.state.dart';
import 'package:provider/provider.dart';

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

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Timer(),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
            ],
          ),
        ),
      ],
    );
  }
}
