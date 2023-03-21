class AccidentalsNotes {
  // static const String flat = '♭';
  static const String flat = 'b';
  // static const String sharp = '♯';
  static const String sharp = '#';
  static const String minus = 'm';
  static const String seven = '7';
  static const String nine = '9';

  static const List<String> accidentals = [
    minus,
    seven,
    nine,
  ];

  static const Map<AccidentalsNotesEnum, String> accidentalsEnumMap = {
    AccidentalsNotesEnum.minus: minus,
    AccidentalsNotesEnum.seven: seven,
    AccidentalsNotesEnum.nine: nine,
    AccidentalsNotesEnum.flat: flat,
    AccidentalsNotesEnum.sharp: sharp,
  };

  static String accidentalFromEnum(AccidentalsNotesEnum accidentalEnum) {
    return accidentalsEnumMap[accidentalEnum]!;
  }

  static String accidentalSemanticsFromEnum(
      AccidentalsNotesEnum accidentalEnum) {
    switch (accidentalEnum) {
      case AccidentalsNotesEnum.minus:
        return 'menor';
      case AccidentalsNotesEnum.seven:
        return 'sétima';
      case AccidentalsNotesEnum.nine:
        return 'nona';
      case AccidentalsNotesEnum.flat:
        return 'bemol';
      case AccidentalsNotesEnum.sharp:
        return 'sustenido';
    }
  }
}

enum AccidentalsNotesEnum {
  flat,
  sharp,
  minus,
  seven,
  nine,
}
