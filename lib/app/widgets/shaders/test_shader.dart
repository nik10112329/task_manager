import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';

class TestShader extends StatefulWidget {
  const TestShader({super.key});

  @override
  State<TestShader> createState() => _TestShaderState();
}

class _TestShaderState extends State<TestShader> with TickerProviderStateMixin {
  double updateTime = 0;

  @override
  void initState() {
    createTicker((elapsed) {
      updateTime = elapsed.inMilliseconds / 5000;
      setState(() {});
    }).start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ShaderBuilder((context, shader, widget) {
      return SizedBox(
        width: 300,
        height: 300,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: ShaderMask(
            shaderCallback: (_) => shader,
            child: CustomPaint(
              painter: ShaderCustomPainter(
                color: context.colors.primary,
                shader: shader,
                updateTime: updateTime,
              ),
            ),
          ),
        ),
      );
    }, assetKey: 'shaders/test_shader.frag');
  }
}

class ShaderCustomPainter extends CustomPainter {
  ShaderCustomPainter({
    required this.updateTime,
    required this.color,
    required this.shader,
  });

  final Color color;
  final FragmentShader shader;
  final double updateTime;

  @override
  void paint(Canvas canvas, Size size) {

    shader
      ..setFloat(0, size.width)
      ..setFloat(1, size.height)
      ..setFloat(2, updateTime);
    // ..setFloat(0, color.r)
    // ..setFloat(1, color.g)
    // ..setFloat(2, color.b)
    // ..setFloat(3, color.a);
    final paint = Paint()..shader = shader;
    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(ShaderCustomPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.shader != shader ||
        oldDelegate.updateTime != updateTime;
  }
}
