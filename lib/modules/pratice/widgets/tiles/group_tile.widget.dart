import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../entities/notes_groups.dart';
import '../../states/accord.state.dart';

class GroupTile extends StatefulWidget {
  const GroupTile({super.key, required this.group});

  final NotesGroupsEnum group;

  @override
  State<GroupTile> createState() => _GroupTileState();
}

class _GroupTileState extends State<GroupTile> {
  @override
  Widget build(BuildContext context) {
    final pageWidth = MediaQuery.of(context).size.width;
    final isMobileSize = pageWidth < 600;

    final groupName = isMobileSize
        ? NotesGroups.notesGroupShortSemanticsFromEnum(widget.group)
        : NotesGroups.notesGroupSemanticsFromEnum(widget.group);

    final accord = context.watch<AccordState>();

    bool value = accord.getValueByGroup(widget.group);

    return CupertinoListTile(
      title: Text(groupName),
      subtitle: Text(
        NotesGroups.notesFromEnumToString(widget.group),
        maxLines: 1,
      ),
      leadingToTitle: 8,
      trailing: CupertinoSwitch(
        value: value,
        onChanged: (_) => accord.toggleGroup(widget.group),
      ),
    );
  }
}
