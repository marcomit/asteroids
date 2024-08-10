import 'dart:math';
import 'dart:ui';

import 'package:asteroids/default.dart';
import 'package:flutter/material.dart';

class Spacecraft extends Default {
  double size;
  Spacecraft([this.size = 20]);


  @override
  void draw(Canvas canvas) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    final points = [
      Offset(position.dx, position.dy),
      Offset(cos(angle) * size + position.dx, sin(angle) * size + position.dy),
      Offset(cos(pi / 3 * 2 + angle) * size + position.dx,
          sin(pi / 3 * 2 + angle) * size + position.dy),
      Offset(cos(pi / 3 * 4 + angle) * size + position.dx,
          sin(pi / 3 * 4 + angle) * size + position.dy),
      Offset(position.dx, position.dy),

    ];

    canvas.drawPoints(PointMode.polygon, points, paint);
  }
}
