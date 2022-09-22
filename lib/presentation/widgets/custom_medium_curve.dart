import 'package:flutter/material.dart';
import '../../core/constants/hex_color_code.dart';
import '../../core/tools/color_tools.dart';

class CustomMediumCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    paint.color = HexColor(HexColorCode.appPrimaryColor);
    path = Path();
    path.lineTo(0, size.height * 0.52);
    path.cubicTo(0, size.height * 0.52, 0, 0, 0, 0);
    path.cubicTo(0, 0, size.width, 0, size.width, 0);
    path.cubicTo(size.width, 0, size.width, size.height, size.width, size.height);
    path.cubicTo(size.width, size.height * 0.87, size.width * 0.95, size.height * 0.76, size.width * 0.88, size.height * 0.76);
    path.cubicTo(size.width * 0.88, size.height * 0.76, size.width * 0.12, size.height * 0.76, size.width * 0.12, size.height * 0.76);
    path.cubicTo(size.width * 0.05, size.height * 0.76, 0, size.height * 0.65, 0, size.height * 0.52);
    path.cubicTo(0, size.height * 0.52, 0, size.height * 0.52, 0, size.height * 0.52);
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}