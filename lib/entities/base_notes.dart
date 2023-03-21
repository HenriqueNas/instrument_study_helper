// ignore_for_file: constant_identifier_names

import 'accidentals_notes.dart';

class BaseNotes {
  static const String C = 'C';
  static const String D = 'D';
  static const String E = 'E';
  static const String F = 'F';
  static const String G = 'G';
  static const String A = 'A';
  static const String B = 'B';

  static const String C_SHARP = 'C${AccidentalsNotes.sharp}';
  static const String D_SHARP = 'D${AccidentalsNotes.sharp}';
  static const String F_SHARP = 'F${AccidentalsNotes.sharp}';
  static const String G_SHARP = 'G${AccidentalsNotes.sharp}';
  static const String A_SHARP = 'A${AccidentalsNotes.sharp}';

  static const String D_FLAT = 'D${AccidentalsNotes.flat}';
  static const String E_FLAT = 'E${AccidentalsNotes.flat}';
  static const String G_FLAT = 'G${AccidentalsNotes.flat}';
  static const String B_FLAT = 'B${AccidentalsNotes.flat}';
  static const String A_FLAT = 'A${AccidentalsNotes.flat}';

  static const List<String> notes = [
    C,
    D,
    E,
    F,
    G,
    A,
    B,
    C_SHARP,
    D_SHARP,
    F_SHARP,
    G_SHARP,
    A_SHARP,
    D_FLAT,
    E_FLAT,
    G_FLAT,
    B_FLAT,
    A_FLAT,
  ];
}
