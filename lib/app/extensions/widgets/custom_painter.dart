import 'package:flutter/material.dart';

class GradientBorderPainter extends CustomPainter {
  const GradientBorderPainter({
    required this.gradient,
    required this.borderRadius,
    required this.strokeWidth,
  });

  final Gradient gradient;
  final double borderRadius;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    // Создаём внешний RRect
    final outerRRect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(borderRadius),
    );

    // Создаём внутренний RRect (чтобы бордер был равномерным)
    final innerRRect = RRect.fromRectAndRadius(
      rect.deflate(strokeWidth), // сжимаем на половину толщины
      Radius.circular(borderRadius - strokeWidth / 2),
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeJoin = StrokeJoin.round; // сглаживаем углы

    // Рисуем бордер между внешним и внутренним путём
    final path = Path()
      ..addRRect(outerRRect)
      ..addRRect(innerRRect)
      ..fillType = PathFillType.evenOdd;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant GradientBorderPainter oldDelegate) {
    return oldDelegate.gradient != gradient ||
        oldDelegate.borderRadius != borderRadius ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
