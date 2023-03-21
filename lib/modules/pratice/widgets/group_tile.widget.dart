import 'package:flutter/cupertino.dart';

import '../../../entities/notes_groups.dart';

class GroupTile extends StatefulWidget {
  const GroupTile({super.key, required this.group});

  final NotesGroupsEnum group;

  @override
  State<GroupTile> createState() => _GroupTileState();
}

class _GroupTileState extends State<GroupTile> {
  bool value = false;

  void _toggleValue(bool newValue) {
    setState(() {
      value = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      title: Text(NotesGroups.notesEnumSemanticsFromEnum(widget.group)),
      subtitle: Text(
        NotesGroups.notesFromEnum(widget.group),
        maxLines: 1,
      ),
      leadingToTitle: 8,
      trailing: CupertinoSwitch(
        value: value,
        onChanged: _toggleValue,
      ),
    );
  }
}
