import 'package:flutter/cupertino.dart';

class PraticeProvider extends InheritedWidget {
  const PraticeProvider({
    super.key,
    required super.child,
    required this.setTime,
    this.time = 5,
  });

  final double time;

  final void Function(double newTime) setTime;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return time != (oldWidget as PraticeProvider).time;
  }

  static PraticeProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PraticeProvider>()!;
  }
}
