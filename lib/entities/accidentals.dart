class Accidentals {
  static const String minus = 'm';
  static const String seven = '7';
  static const String nine = '9';

  static const List<String> accidentals = [
    minus,
    seven,
    nine,
  ];

  static const Map<AccidentalsEnum, String> accidentalsEnumMap = {
    AccidentalsEnum.minus: minus,
    AccidentalsEnum.seven: seven,
    AccidentalsEnum.nine: nine,
  };

  static String accidentalFromEnum(AccidentalsEnum accidentalEnum) {
    return accidentalsEnumMap[accidentalEnum]!;
  }

  static String accidentalSemanticsFromEnum(AccidentalsEnum accidentalEnum) {
    switch (accidentalEnum) {
      case AccidentalsEnum.minus:
        return 'menor';
      case AccidentalsEnum.seven:
        return 'sétima';
      case AccidentalsEnum.nine:
        return 'nona';
    }
  }
}

enum AccidentalsEnum {
  minus,
  seven,
  nine,
}
