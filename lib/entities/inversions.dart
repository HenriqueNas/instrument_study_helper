abstract class Inversions {
  static const List<InversionsEnum> inversions = [
    InversionsEnum.natural,
    InversionsEnum.first,
    InversionsEnum.second,
  ];

  static String inversionsSemanticsFromEnum(InversionsEnum inversionsEnum) {
    switch (inversionsEnum) {
      case InversionsEnum.natural:
        return 'natural';
      case InversionsEnum.first:
        return '1ª  inversão';
      case InversionsEnum.second:
        return '2ª  inversão';
    }
  }
}

enum InversionsEnum {
  natural,
  first,
  second,
}
