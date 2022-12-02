// ignore_for_file: unnecessary_cast

import 'dart:math';

import 'package:flutter/material.dart';

class BoxPoligonPainter extends CustomPainter {
  const BoxPoligonPainter({
    required this.poligonPoints,
  });
  final List<Point<double>> poligonPoints;

  @override
  void paint(Canvas canvas, Size size) {
    var currentPoligon = Path()
      ..moveTo(poligonPoints.first.x, poligonPoints.first.y);
    var anotherPoints = poligonPoints;
    for (var element in anotherPoints) {
      currentPoligon.lineTo(element.x as double, element.y as double);
    }
    currentPoligon.lineTo(
        poligonPoints.first.x as double, poligonPoints.first.y as double);

    var paint = Paint()
      ..color = Colors.pink.shade300
      ..strokeWidth = 5
      ..blendMode = BlendMode.overlay
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(currentPoligon, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
