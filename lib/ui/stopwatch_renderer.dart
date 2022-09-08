import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_stopwatch_flutter/ui/clock_markers.dart';
import 'package:my_stopwatch_flutter/ui/elapsed_time_text.dart';

import 'clock_hand.dart';

// import 'elapsed_time_text.dart';

class StopWatchRenderer extends StatelessWidget {
  final double radius;
  const StopWatchRenderer(
      {Key? key, required this.elapsed, required this.radius})
      : super(key: key);
  final Duration elapsed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (var i = 0; i < 60; i++)
          Positioned(
              left: radius,
              top: radius,
              child: ClockSecondsTickMarker(radius: radius, seconds: i)),
        for (var i = 5; i <= 60; i += 5)
          Positioned(
              left: radius,
              top: radius,
              child: ClockTextMarkers(
                radius: radius,
                value: i,
                maxValue: 60,
              )),
        Positioned(
          left: radius,
          top: radius,
          child: ClockHand(
            handLength: radius,
            handThickness: 2,
            rotationZAngle: pi + (2 * pi / 60000) * elapsed.inMilliseconds,
            color: Colors.orange,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: radius * 1.3,
          child: ElapsedTimeText(
            elapsed: elapsed,
          ),
        ),
      ],
    );
  }
}
