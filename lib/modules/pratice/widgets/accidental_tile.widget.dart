import 'package:flutter/cupertino.dart';
import 'package:instrumental_studying_helper/modules/pratice/states/notes.state.dart';
import 'package:provider/provider.dart';
import '../../../entities/accidentals.dart';

class AccidentalTile extends StatefulWidget {
  const AccidentalTile({super.key, required this.acidental});

  final AccidentalsEnum acidental;

  @override
  State<AccidentalTile> createState() => _AccidentalTileState();
}

class _AccidentalTileState extends State<AccidentalTile> {
  @override
  Widget build(BuildContext context) {
    final notes = context.watch<NotesState>();

    bool value = notes.getValueByAccidental(widget.acidental);

    return CupertinoListTile(
      title: Text(
        Accidentals.accidentalSemanticsFromEnum(widget.acidental),
        style: const TextStyle(fontSize: 12),
      ),
      leading: Text(
        Accidentals.accidentalFromEnum(widget.acidental),
        style: const TextStyle(fontSize: 16),
      ),
      leadingToTitle: 8,
      trailing: CupertinoSwitch(
        value: value,
        onChanged: (_) => notes.toggleAccidental(widget.acidental),
      ),
    );
  }
}
