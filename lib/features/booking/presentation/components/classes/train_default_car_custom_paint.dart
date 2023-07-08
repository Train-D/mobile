import 'package:flutter/material.dart';

import '../../../../../core/global/theme/app_color/app_color_light.dart';

class TrainDefaultCarShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    final Path path = Path();

    paint.color = trainColor;

    path.lineTo(
      0,
      size.height * 0.45,
    );
    path.cubicTo(
      0,
      -0.03,
      size.width * 0.14,
      0,
      size.width * 0.52,
      0,
    );
    path.cubicTo(
      size.width * 0.89,
      0,
      size.width * 0.97,
      -0.03,
      size.width,
      size.height * 0.46,
    );
    path.cubicTo(
      size.width * 1.02,
      size.height * 0.95,
      size.width * 0.86,
      size.height,
      size.width * 0.52,
      size.height,
    );
    path.cubicTo(
      size.width * 0.14,
      size.height,
      0,
      size.height * 0.96,
      0,
      size.height * 0.45,
    );
    path.cubicTo(
      0,
      size.height * 0.45,
      0,
      size.height * 0.45,
      0,
      size.height * 0.45,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
