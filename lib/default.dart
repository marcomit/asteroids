import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

abstract class Default extends Component {
  Offset position;
  double speed;
  double angle;
  Default({this.position= const Offset(0, 0), this.speed = 0, this.angle = 0});
  void draw(Canvas canvas) {
    throw UnimplementedError("This should be overridden because it's abstract");
  }
  void move() {
    position += Offset(cos(angle) * speed, sin(angle) * speed);
  }
}
