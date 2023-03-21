import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart' hide Actions;
import 'package:instrumental_studying_helper/modules/pratice/states/actions.state.dart';
import 'package:provider/provider.dart';

import '../../entities/accidentals.dart';
import '../../entities/notes_groups.dart';
import 'states/notes.state.dart';
import 'widgets/accidental_tile.widget.dart';
import 'widgets/actions.widget.dart';
import 'widgets/group_tile.widget.dart';

class PraticePage extends StatefulWidget {
  const PraticePage({super.key});

  @override
  State<PraticePage> createState() => _PraticePageState();
}

class _PraticePageState extends State<PraticePage> {
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    final notes = context.watch<NotesState>();
    final actions = context.watch<ActionsState>();

    final bgColor = CupertinoTheme.of(context).barBackgroundColor;

    String randomAccord() {
      if (notes.notes.isEmpty) return '';

      final random = Random();

      final nextNote = random.nextInt(notes.notes.length);
      final randomNote = notes.notes[nextNote];

      if (notes.accidentals.isEmpty || random.nextBool()) {
        return randomNote;
      }

      final nextAccidental = random.nextInt(notes.accidentals.length);
      final randomAccidental = notes.accidentals[nextAccidental];

      return randomNote + randomAccidental;
    }

    Stream<String> randomAccordLoop() async* {
      while (actions.isPlaying) {
        await Future<void>.delayed(Duration(seconds: actions.time.toInt()));

        if (actions.useAudio) await player.play(AssetSource('metronome.mp3'));

        yield randomAccord();
      }
    }

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraint) => SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            decoration: BoxDecoration(color: bgColor),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox.shrink(),
                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: StreamBuilder<String>(
                      initialData: randomAccord(),
                      stream: randomAccordLoop(),
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.data ?? '',
                          style: const TextStyle(
                            fontSize: 120,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ),
                  const Actions(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CupertinoListSection.insetGrouped(
                          backgroundColor: bgColor,
                          header: const Text('Acidentes'),
                          margin: const EdgeInsets.all(16),
                          children: [
                            for (var accidental in AccidentalsEnum.values)
                              AccidentalTile(acidental: accidental),
                          ],
                        ),
                      ),
                      Expanded(
                        child: CupertinoListSection.insetGrouped(
                          backgroundColor: bgColor,
                          header: const Text('Grupos'),
                          margin: const EdgeInsets.all(16),
                          topMargin: 0,
                          additionalDividerMargin: 0,
                          children: [
                            for (var group in NotesGroupsEnum.values)
                              GroupTile(group: group),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
