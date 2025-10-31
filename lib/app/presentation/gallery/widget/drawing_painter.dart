import 'package:flutter/material.dart';
import 'dart:ui' as ui show Image;

class DrawingPainter extends CustomPainter {
  final List<Offset?> points;
  final Color color;
  final double strokeWidth;
  final ui.Image? myBackground;

  DrawingPainter({
    required this.points,
    required this.color,
    required this.strokeWidth,
    this.myBackground,
  });

  @override
  void paint(Canvas canvas, Size size) async {
    if (myBackground != null) {
      final src = Rect.fromLTWH(
        0,
        0,
        myBackground!.width.toDouble(),
        myBackground!.height.toDouble(),
      );
      final dst = Rect.fromLTWH(0, 0, size.width, size.height);

      final bgPaint = Paint()..isAntiAlias = true;
      canvas.drawImageRect(myBackground!, src, dst, bgPaint);
    }
    final paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(DrawingPainter oldDelegate) => true;
}
