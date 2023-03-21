import 'package:flutter/cupertino.dart';
import '../../../entities/accidentals_notes.dart';

class AccidentalTile extends StatefulWidget {
  const AccidentalTile({super.key, required this.acidental});

  final AccidentalsNotesEnum acidental;

  @override
  State<AccidentalTile> createState() => _AccidentalTileState();
}

class _AccidentalTileState extends State<AccidentalTile> {
  bool value = false;

  void _toggleValue(bool newValue) {
    setState(() {
      value = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      title: Text(
        AccidentalsNotes.accidentalSemanticsFromEnum(widget.acidental),
        style: const TextStyle(fontSize: 12),
      ),
      leading: Text(
        AccidentalsNotes.accidentalFromEnum(widget.acidental),
        style: const TextStyle(fontSize: 16),
      ),
      leadingToTitle: 8,
      trailing: CupertinoSwitch(
        value: value,
        onChanged: _toggleValue,
      ),
    );
  }
}
