import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../entities/inversions.dart';
import '../../../entities/notes_groups.dart';
import '../../../entities/variants.dart';

class AccordState extends ChangeNotifier {
  AccordState._();

  static ChangeNotifierProvider<AccordState> provider() {
    return ChangeNotifierProvider<AccordState>.value(
      value: AccordState._(),
    );
  }

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
    if (_groups.values.where((element) => element).length == 1 &&
        _groups[group]!) {
      return;
    }

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

  final Map<VariantsEnum, bool> _variants = {
    VariantsEnum.minus: false,
    VariantsEnum.seven: false,
    VariantsEnum.nine: false,
  };

  bool getValueByVariant(VariantsEnum variant) {
    return _variants[variant]!;
  }

  void toggleVariant(VariantsEnum variant) {
    _variants[variant] = !_variants[variant]!;
    notifyListeners();
  }

  List<String> get variants {
    final List<String> variantsList = [];

    _variants.forEach((variant, selected) {
      if (selected) {
        variantsList.add(
          Variants.variantsFromEnum(variant),
        );
      }
    });

    return variantsList;
  }

  final Map<InversionsEnum, bool> _inversions = {
    InversionsEnum.natural: true,
    InversionsEnum.first: false,
    InversionsEnum.second: false,
  };

  bool getValueByInversion(InversionsEnum inversion) {
    return _inversions[inversion]!;
  }

  void toggleInversion(InversionsEnum inversion) {
    if (_inversions.values.where((element) => element).length == 1 &&
        _inversions[inversion]!) {
      return;
    }

    _inversions[inversion] = !_inversions[inversion]!;
    notifyListeners();
  }

  List<String> get inversions {
    final List<String> inversionsList = [];

    _inversions.forEach((inversion, selected) {
      if (selected) {
        inversionsList.add(
          Inversions.inversionsSemanticsFromEnum(inversion),
        );
      }
    });

    return inversionsList;
  }

  void reset() {
    _groups.forEach((group, selected) {
      if (group == NotesGroupsEnum.first) {
        _groups[group] = true;
        return;
      }

      _groups[group] = false;
    });

    _variants.forEach((variant, selected) {
      _variants[variant] = false;
    });

    _inversions.forEach((inversion, selected) {
      if (inversion == InversionsEnum.natural) {
        _inversions[inversion] = true;
        return;
      }

      _inversions[inversion] = false;
    });

    notifyListeners();
  }
}
