import 'package:flutter/material.dart';

class GridPainter extends CustomPainter {
  final double gridSpacing;
  final Paint gridPaint;

  GridPainter({this.gridSpacing = 20.0})
      : gridPaint = Paint()
          ..color = Colors.grey.shade500
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.5;

  @override
  void paint(Canvas canvas, Size size) {
    for (double i = 0; i <= size.width; i += gridSpacing) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), gridPaint);
    }
    for (double i = 0; i <= size.height; i += gridSpacing) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), gridPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
