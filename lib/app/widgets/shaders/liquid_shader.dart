import 'dart:ui';
import 'package:flutter/material.dart';

class LiquidGlass extends StatefulWidget {
  const LiquidGlass({
    required this.child,
    required this.width,
    required this.height,
    super.key,
  });

  final Widget child;
  final double width;
  final double height;

  @override
  State<LiquidGlass> createState() => _LiquidGlassState();
}

class _LiquidGlassState extends State<LiquidGlass>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: Stack(
        children: [
          // 🔹 Blur background
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
            child: Container(
              width: widget.width,
              height: widget.height,
              color: Colors.white.withValues(alpha: 0.02),
            ),
          ),

          // 🔹 Liquid highlight
          AnimatedBuilder(
            animation: _controller,
            builder: (_, _) {
              return CustomPaint(
                size: Size(widget.width, widget.height),
                painter: _LiquidHighlightPainter(_controller.value),
              );
            },
          ),

          // 🔹 Border + content
          Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: Colors.white.withValues(alpha: 0.35)),
            ),
            alignment: Alignment.center,
            child: widget.child,
          ),
        ],
      ),
    );
  }
}

class _LiquidHighlightPainter extends CustomPainter {
  _LiquidHighlightPainter(this.t);

  final double t;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    final gradient = LinearGradient(
      // begin: Alignment(-1.2 + dx, -1),
      // end: Alignment(1.2 + dx, 1),
      begin: Alignment(-2.7 + t * 2, -2),
      end: Alignment(1.0 + t * 2, 1),
      colors: [
        Colors.white.withValues(alpha: 0),
        Colors.white.withValues(alpha: 0.10),
        Colors.white.withValues(alpha: 0),
      ],
      stops: const [0.46, 0.5, 0.54],
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..blendMode = BlendMode.plus;

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
