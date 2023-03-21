import 'package:flutter/cupertino.dart';
import 'package:instrumental_studying_helper/modules/pratice/states/actions.state.dart';
import 'package:provider/provider.dart';

class Timer extends StatefulWidget {
  const Timer({super.key});

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  @override
  Widget build(BuildContext context) {
    final actions = context.watch<ActionsState>();

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${actions.time.toStringAsFixed(2)} segundos',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: CupertinoSlider(
              min: 1,
              max: 15,
              value: actions.time,
              onChanged: actions.setTime,
            ),
          ),
        ],
      ),
    );
  }
}
