
import 'package:flutter/material.dart';

class TrainFirstCarShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();

    paint.color = const Color(0xffE3D2CB);

    final path = Path();

    path.lineTo(
      size.width,
      size.height * 0.6,
    );
    path.cubicTo(
      size.width * 1.03,
      size.height * 1.06,
      size.width * 0.85,
      size.height,
      size.width * 0.48,
      size.height,
    );
    path.cubicTo(
      size.width * 0.11,
      size.height,
      -0.04,
      size.height * 1.07,
      size.width * 0.01,
      size.height * 0.59,
    );
    path.cubicTo(
      size.width * 0.05,
      size.height * 0.12,
      size.width * 0.14,
      0,
      size.width * 0.48,
      0,
    );
    path.cubicTo(
      size.width * 0.87,
      0,
      size.width * 0.95,
      size.height * 0.09,
      size.width,
      size.height * 0.6,
    );
    path.cubicTo(
      size.width,
      size.height * 0.6,
      size.width,
      size.height * 0.6,
      size.width,
      size.height * 0.6,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
