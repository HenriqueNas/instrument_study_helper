import 'package:flutter/material.dart' hide Actions;
import 'package:provider/provider.dart';

class ActionsState extends ChangeNotifier {
  ActionsState._();

  static ChangeNotifierProvider<ActionsState> provider() {
    return ChangeNotifierProvider<ActionsState>.value(
      value: ActionsState._(),
    );
  }

  double _time = 5;

  double get time => _time;

  void setTime(double value) {
    stopPlayer();

    _time = value;
    notifyListeners();
  }

  bool _isPlaying = (false);
  bool _useAudio = (true);

  bool get isPlaying => _isPlaying;
  bool get useAudio => _useAudio;

  void startPlayer() {
    _isPlaying = true;
    notifyListeners();
  }

  void stopPlayer() {
    _isPlaying = false;
    notifyListeners();
  }

  void toggleAudio() {
    _useAudio = !useAudio;
    notifyListeners();
  }

  @override
  void dispose() {
    stopPlayer();
    super.dispose();
  }
}
