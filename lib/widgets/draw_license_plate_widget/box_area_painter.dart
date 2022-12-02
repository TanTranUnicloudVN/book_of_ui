import 'package:book_of_ui/entity/box.dart';
import 'package:flutter/material.dart';

class BoxAreaPainter extends CustomPainter {
  BoxAreaPainter({
    required this.box,
  });
  final Box box;
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromLTWH(
      box.x,
      box.y,
      box.width,
      box.height,
    );
    var paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
