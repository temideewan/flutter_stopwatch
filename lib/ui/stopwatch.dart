import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_stopwatch_flutter/ui/stopwatch_renderer.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({super.key});
  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch>
    with SingleTickerProviderStateMixin {
  Duration _elapsedTime = Duration.zero;
  late final Ticker _ticker;
  @override
  void initState() {
    super.initState();
    _ticker = createTicker((elapsed) {
      setState(() {
        _elapsedTime = elapsed;
      });
    });
    // need to start the ticker
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final radius = constraints.maxWidth / 2;
      return StopWatchRenderer(
        elapsed: _elapsedTime,
        radius: radius,
      );
    });
  }
}
