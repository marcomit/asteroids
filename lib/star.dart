import 'dart:math';

import 'package:asteroids/default.dart';
import 'package:asteroids/functions.dart';
import 'package:flutter/material.dart';

class Star extends Default {
  static double maxSpeed = 3;

  Star() : super();

  factory Star.random() {
    return Star()
      ..position = const Offset(0, 0)
      ..angle = random(0, 2 * pi)
      ..speed = random(-maxSpeed, maxSpeed);
  }

  @override
  void draw(Canvas canvas) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(position, 2, paint);
  }

  @override
  void move() => position += Offset(cos(angle) * speed, sin(angle) * speed);
}
