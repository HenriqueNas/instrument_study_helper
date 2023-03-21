import 'package:flutter/cupertino.dart';

import '../../../entities/accidentals.dart';
import '../../../entities/notes_groups.dart';

class NotesState extends ChangeNotifier {
  final Map<NotesGroupsEnum, bool> _groups = {
    NotesGroupsEnum.first: true,
    NotesGroupsEnum.second: false,
    NotesGroupsEnum.thirdFlat: false,
    NotesGroupsEnum.fourth: false,
  };

  bool getValueByGroup(NotesGroupsEnum group) {
    return _groups[group]!;
  }

  void toggleGroup(NotesGroupsEnum group) {
    _groups[group] = !_groups[group]!;
    notifyListeners();
  }

  List<String> get notes {
    final List<String> notes = [];

    _groups.forEach((group, selected) {
      if (selected) {
        notes.addAll(NotesGroups.notesGroupsEnumMap[group]!);
      }
    });

    return notes;
  }

  final Map<AccidentalsEnum, bool> _accidentals = {
    AccidentalsEnum.minus: false,
    AccidentalsEnum.seven: false,
    AccidentalsEnum.nine: false,
  };

  bool getValueByAccidental(AccidentalsEnum accidental) {
    return _accidentals[accidental]!;
  }

  void toggleAccidental(AccidentalsEnum accidental) {
    _accidentals[accidental] = !_accidentals[accidental]!;
    notifyListeners();
  }

  List<String> get accidentals {
    final List<String> accidentalsList = [];

    _accidentals.forEach((accidental, selected) {
      if (selected) {
        accidentalsList.add(Accidentals.accidentalFromEnum(accidental));
      }
    });

    return accidentalsList;
  }
}
