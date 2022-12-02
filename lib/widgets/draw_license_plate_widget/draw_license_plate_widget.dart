import 'dart:math';

import 'package:book_of_ui/entity/box.dart';
import 'package:book_of_ui/entity/obj_detected.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'box_area_painter.dart';
import 'box_poligon_painter.dart';

WidgetbookUseCase drawLicensePlateUseCase() {
  return WidgetbookUseCase.center(
    name: "Draw license plate",
    child: DrawLicensePlateWidget(
      image: Image.asset(
        'assets/korone.jpg',
        height: 200,
        width: 200,
        fit: BoxFit.cover,
      ),
      height: 200,
      width: 200,
      objectDetected: const ObjectDetected(
        box: Box(
          x: 10,
          y: 15,
          height: 125,
          width: 150,
        ),
        content: "Yubi yubi",
        poligonPoints: [
          Point<double>(50, 45),
          Point<double>(125, 40),
          Point<double>(125, 125),
          Point<double>(50, 130),
        ],
      ),
    ),
  );
}

/// [width] và [height] của toàn vùng được vẽ canvas
/// [objectDetected] là object được vẽ trong canvas này
class DrawLicensePlateWidget extends StatelessWidget {
  const DrawLicensePlateWidget({
    required this.height,
    required this.width,
    required this.objectDetected,
    this.image,
    super.key,
  });
  final ObjectDetected objectDetected;
  final double height;
  final double width;

  final Image? image;
  @override
  Widget build(BuildContext context) {
    /// cho mặc định những thông số
    /// [textWidth] là độ dài tối đa hiển thị tên object,
    /// [textHeight] là độ cao tối đa vùng bao phủ tên object,
    /// [textFontSize] là size của tên object,
    /// [textPositionX] và [textPositionY] là góc trên bên trái vùng vẽ tên object
    double textWidth = 75;
    double textHeight = 12;
    double textFontSize = 10;
    double textPositionX = 50;
    double textPositionY = 28;

    List<double> listX = [];
    List<double> listY = [];

    for (var element in objectDetected.poligonPoints) {
      listY.add(element.y * 1.0);
      listX.add(element.x * 1.0);
    }

    textPositionX = listX.reduce(min);
    textWidth = listX.reduce(max) - textPositionX;
    textHeight = textWidth / 6;
    textFontSize = textWidth / 15 * 2;
    textPositionY = listY.reduce(min) - textHeight;
    // return Container();
    return Stack(
      children: [
        if (image != null) image!,
        CustomPaint(
          size: Size(width, height),
          // đây là vùng được vẽ trên cùng của canvas
          foregroundPainter: BoxAreaPainter(
            box: objectDetected.box,
          ),
          // đây là vùng được vẽ ở background của canvas
          painter: BoxPoligonPainter(
            poligonPoints: objectDetected.poligonPoints,
          ),
          // đây là vùng vẽ trên backgound của canvas
          child: Container(
            height: objectDetected.box.height,
            width: objectDetected.box.width,
            color: Colors.transparent,
            child: Stack(
              children: [
                Positioned(
                  left: textPositionX,
                  top: textPositionY,
                  child: Container(
                    width: textWidth,
                    height: textHeight,
                    // màu của vùng chứa tên object
                    color: Colors.yellow.withAlpha(70),
                    child: Center(
                      child: Text(
                        objectDetected.content,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          // màu của tên object
                          color: Colors.purple,
                          fontSize: textFontSize,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
