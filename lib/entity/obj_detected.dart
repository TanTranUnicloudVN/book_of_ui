import 'dart:math';

import 'box.dart';

/// [ObjectDetected] là Oject chứa thông tin của render,
/// bao gồm box, [content] là tên của object và
/// danh sách các tọa độ điểm trong poligon của vùng tô đậm bên trong box
class ObjectDetected {
  const ObjectDetected({
    required this.box,
    required this.content,
    required this.poligonPoints,
  });
  final Box box;
  final List<Point<double>> poligonPoints;
  final String content;
}
