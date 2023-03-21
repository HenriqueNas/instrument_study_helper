import 'package:flutter/cupertino.dart';

import '../pratice.provider.dart';

class Timer extends StatefulWidget {
  const Timer({super.key});

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  @override
  Widget build(BuildContext context) {
    final provider = PraticeProvider.of(context);

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${provider.time.toStringAsFixed(2)} segundos',
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
              value: provider.time,
              onChanged: provider.setTime,
            ),
          ),
        ],
      ),
    );
  }
}
