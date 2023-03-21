import 'base_notes.dart';

class NotesGroups {
  static final List<String> first = [
    BaseNotes.C,
    BaseNotes.F,
    BaseNotes.G,
  ];

  static final List<String> second = [
    BaseNotes.D,
    BaseNotes.E,
    BaseNotes.A,
  ];

  static final List<String> thirdSharp = [
    BaseNotes.C_SHARP,
    BaseNotes.D_SHARP,
    BaseNotes.G_SHARP,
  ];

  static final List<String> thirdFlat = [
    BaseNotes.D_FLAT,
    BaseNotes.E_FLAT,
    BaseNotes.A_FLAT,
  ];

  static final List<String> fourth = [
    BaseNotes.F_SHARP,
    BaseNotes.B_FLAT,
    BaseNotes.B,
  ];

  static final Map<NotesGroupsEnum, List<String>> notesGroupsEnumMap = {
    NotesGroupsEnum.first: first,
    NotesGroupsEnum.second: second,
    NotesGroupsEnum.thirdFlat: thirdFlat,
    NotesGroupsEnum.fourth: fourth,
  };

  static String notesFromEnumToString(NotesGroupsEnum notesEnum) {
    return notesGroupsEnumMap[notesEnum]!.join(' ');
  }

  static String notesEnumSemanticsFromEnum(NotesGroupsEnum notesEnum) {
    switch (notesEnum) {
      case NotesGroupsEnum.first:
        return '1º grupo';
      case NotesGroupsEnum.second:
        return '2º grupo';
      case NotesGroupsEnum.thirdFlat:
        return '3º grupo';
      case NotesGroupsEnum.fourth:
        return '4º grupo';
    }
  }
}

enum NotesGroupsEnum {
  first,
  second,
  thirdFlat,
  fourth;
}
