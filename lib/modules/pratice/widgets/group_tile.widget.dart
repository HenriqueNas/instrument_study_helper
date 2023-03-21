import 'package:flutter/cupertino.dart';
import 'package:instrumental_studying_helper/modules/pratice/states/notes.state.dart';
import 'package:provider/provider.dart';

import '../../../entities/notes_groups.dart';

class GroupTile extends StatefulWidget {
  const GroupTile({super.key, required this.group});

  final NotesGroupsEnum group;

  @override
  State<GroupTile> createState() => _GroupTileState();
}

class _GroupTileState extends State<GroupTile> {
  @override
  Widget build(BuildContext context) {
    final notes = context.watch<NotesState>();

    bool value = notes.getValueByGroup(widget.group);

    return CupertinoListTile(
      title: Text(NotesGroups.notesEnumSemanticsFromEnum(widget.group)),
      subtitle: Text(
        NotesGroups.notesFromEnumToString(widget.group),
        maxLines: 1,
      ),
      leadingToTitle: 8,
      trailing: CupertinoSwitch(
        value: value,
        onChanged: (_) => notes.toggleGroup(widget.group),
      ),
    );
  }
}
