import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class RippleEffectPainter extends CustomPainter {
  RippleEffectPainter({
    required this.shader,
    required this.time,
    required this.tapPosition,
    this.maxLineOpacity = 0.4,
    this.ringWidth = 0.2,
    this.animationSpeed = 1,
    this.intensityMultiplier = 0.3,
    this.colorBrightness = 0.95,
  });

  final Offset? tapPosition;
  final ui.FragmentShader shader;
  final double time;
  final double maxLineOpacity;
  final double ringWidth;
  final double animationSpeed;
  final double intensityMultiplier;
  final double colorBrightness;

  @override
  void paint(Canvas canvas, Size size) {
    final maxSize = size.width < size.height ? size.height : size.width;
    shader
      ..setFloat(0, maxSize)
      ..setFloat(1, maxSize)
      ..setFloat(2, tapPosition?.dx ?? size.width / 2)
      ..setFloat(3, tapPosition?.dy ?? size.height / 2)
      ..setFloat(4, time)
      ..setFloat(5, maxLineOpacity)
      ..setFloat(6, ringWidth)
      ..setFloat(7, animationSpeed)
      ..setFloat(8, intensityMultiplier)
      ..setFloat(9, colorBrightness);
    final paint = Paint()..shader = shader;
    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
