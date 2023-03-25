abstract class Variants {
  static const String minus = 'm';
  static const String seven = '7';
  static const String nine = '9';

  static const List<String> variants = [
    minus,
    seven,
    nine,
  ];

  static const Map<VariantsEnum, String> variantsEnumMap = {
    VariantsEnum.minus: minus,
    VariantsEnum.seven: seven,
    VariantsEnum.nine: nine,
  };

  static String variantsFromEnum(VariantsEnum variantsEnum) {
    return variantsEnumMap[variantsEnum]!;
  }

  static String variantsSemanticsFromEnum(VariantsEnum variantsEnum) {
    switch (variantsEnum) {
      case VariantsEnum.minus:
        return 'menor';
      case VariantsEnum.seven:
        return 'sétima';
      case VariantsEnum.nine:
        return 'nona';
    }
  }
}

enum VariantsEnum {
  minus,
  seven,
  nine,
}
