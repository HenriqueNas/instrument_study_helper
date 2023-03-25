import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart' hide Actions;
import 'package:provider/provider.dart';

import '../../core/tuple.dart';
import 'states/accord.state.dart';
import 'states/actions.state.dart';
import 'widgets/actions.widget.dart';

class PraticePage extends StatefulWidget {
  const PraticePage({super.key});

  @override
  State<PraticePage> createState() => _PraticePageState();
}

class _PraticePageState extends State<PraticePage> {
  final player = AudioPlayer();

  @override
  void dispose() {
    super.dispose();

    context.read<AccordState>().dispose();
    context.read<ActionsState>().dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accord = context.watch<AccordState>();
    final actions = context.watch<ActionsState>();

    String randomAccord() {
      if (accord.notes.isEmpty) return '';

      final random = Random();

      final nextNote = random.nextInt(accord.notes.length);
      final randomNote = accord.notes[nextNote];

      if (accord.variants.isEmpty || random.nextBool()) {
        return randomNote;
      }

      final nextVariant = random.nextInt(accord.variants.length);
      final randomVariant = accord.variants[nextVariant];

      return randomNote + randomVariant;
    }

    String randomInversion() {
      if (accord.inversions.isEmpty) return '';

      final random = Random();

      final nextInversion = random.nextInt(accord.inversions.length);
      final randomInversion = accord.inversions[nextInversion];

      return randomInversion;
    }

    Stream<Tuple<String, String>> randomAccordLoop() async* {
      while (actions.isPlaying) {
        await Future<void>.delayed(Duration(seconds: actions.time.toInt()));

        if (actions.useAudio) await player.play(AssetSource('metronome.mp3'));

        yield Tuple(randomAccord(), randomInversion());
      }
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.all(40),
              child: StreamBuilder<Tuple<String, String>>(
                initialData: Tuple(randomAccord(), randomInversion()),
                stream: randomAccordLoop(),
                builder: (context, snapshot) {
                  final tuple = snapshot.data;

                  return Column(
                    children: [
                      Text(
                        tuple?.$0 ?? '',
                        style: const TextStyle(
                          fontSize: 120,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        tuple?.$1 ?? '',
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const Actions(),
          ],
        ),
      ),
    );
  }
}
