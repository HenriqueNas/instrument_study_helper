import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../../entities/accidentals_notes.dart';
import '../../entities/notes_groups.dart';
import 'pratice.provider.dart';
import 'widgets/accidental_tile.widget.dart';
import 'widgets/group_tile.widget.dart';
import 'widgets/timer.widget.dart';

class PraticePage extends StatefulWidget {
  const PraticePage({super.key});

  @override
  State<PraticePage> createState() => _PraticePageState();
}

class _PraticePageState extends State<PraticePage> {
  bool isPlaying = false;

  void _startPlayer() {
    setState(() {
      isPlaying = true;
    });
  }

  void _stopPlayer() {
    setState(() {
      isPlaying = false;
    });
  }

  String _randomAccord() {
    final random = Random();
    final randomGroup =
        NotesGroupsEnum.values[random.nextInt(NotesGroupsEnum.values.length)];
    final randomAccidental = AccidentalsNotesEnum
        .values[random.nextInt(AccidentalsNotesEnum.values.length)];

    final randomNote = NotesGroups.notesGroupsEnumMap[randomGroup]![
        random.nextInt(NotesGroups.notesGroupsEnumMap[randomGroup]!.length)];

    return randomNote + AccidentalsNotes.accidentalFromEnum(randomAccidental);
  }

  double time = 5;

  void setTime(double newTime) {
    setState(() {
      time = newTime;
    });
  }

  Stream<String> randomAccordLoop() async* {
    while (isPlaying) {
      await Future<void>.delayed(Duration(seconds: time.toInt()));
      yield _randomAccord();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = CupertinoTheme.of(context).barBackgroundColor;

    return PraticeProvider(
      time: time,
      setTime: setTime,
      child: SafeArea(
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
                        initialData: _randomAccord(),
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Timer(),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CupertinoButton(
                                onPressed: _startPlayer,
                                child: Icon(
                                  isPlaying
                                      ? CupertinoIcons.play_arrow_solid
                                      : CupertinoIcons.play_arrow,
                                ),
                              ),
                              CupertinoButton(
                                onPressed: _stopPlayer,
                                child: Icon(
                                  isPlaying
                                      ? CupertinoIcons.stop
                                      : CupertinoIcons.stop_fill,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CupertinoListSection.insetGrouped(
                            backgroundColor: bgColor,
                            header: const Text('Acidentes'),
                            margin: const EdgeInsets.all(16),
                            children: [
                              for (var accidental
                                  in AccidentalsNotesEnum.values)
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
      ),
    );
  }
}
