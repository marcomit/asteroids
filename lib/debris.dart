import 'package:asteroids/default.dart';
import 'package:asteroids/functions.dart';
import 'package:flutter/widgets.dart';

class Debris extends Default {
  final List<double> corners;
  Debris(this.corners) : super();
  factory Debris.fromCorners(int cornersCount) {
    return Debris(List.generate(cornersCount, (i) => random()))
      ..position = const Offset(0, 0)
      ..angle = 0
      ..speed = 0;
  }
}
