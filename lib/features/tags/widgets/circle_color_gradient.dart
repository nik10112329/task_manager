import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';

class TMCircleColorGradient extends StatefulWidget {
  const TMCircleColorGradient({
    required this.controller,
    required this.gradient,
    this.size = const Size(300, 300),
    this.strokeWidth = 15,
    this.thumbSize = 30,
    super.key,
  });

  final CircleColorPickerController controller;
  final Gradient gradient;
  final Size size;
  final double strokeWidth;
  final double thumbSize;

  @override
  State<TMCircleColorGradient> createState() => _TMCircleColorGradientState();
}

class _TMCircleColorGradientState extends State<TMCircleColorGradient>
    with TickerProviderStateMixin {
  late AnimationController _angleController;
  late AnimationController _lightnessController;

  Color get _color {
    final base = _getColorFromGradient(_angleController.value);
    return HSLColor.fromColor(
      base,
    ).withLightness(_lightnessController.value).toColor();
  }

  @override
  void initState() {
    super.initState();

    _angleController = AnimationController(
      vsync: this,
      upperBound: 360,
      value: 0,
    )..addListener(_notify);

    _lightnessController = AnimationController(vsync: this, value: 0.5)
      ..addListener(_notify);

    widget.controller.addListener(_syncFromController);
  }

  void _notify() {
    widget.controller.color = _color;
  }

  void _syncFromController() {
    final hsl = HSLColor.fromColor(widget.controller.color);
    _lightnessController.value = hsl.lightness;
  }

  @override
  void dispose() {
    widget.controller.removeListener(_syncFromController);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = widget.size.width;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          CustomPaint(
            size: widget.size,
            painter: _GradientRingPainter(
              strokeWidth: widget.strokeWidth,
              gradient: widget.gradient,
            ),
          ),

          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 110,
                  height: 36,
                  child: TextField(
                    readOnly: true,
                    textAlign: TextAlign.center,
                    textCapitalization: TextCapitalization.characters,
                    style: context.styles.h1.copyWith(
                      fontSize: 16,
                      color: context.colors.textColor,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      prefixText: '#',
                      prefixStyle: context.styles.h1.copyWith(
                        fontSize: 16,
                        color: context.colors.textColor,
                        fontWeight: FontWeight.w600,
                      ),
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 4,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: context.colors.white.withValues(alpha: 0.5),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: context.colors.white.withValues(alpha: 0.5),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 8),
                AnimatedBuilder(
                  animation: _lightnessController,
                  builder: (_, _) {
                    return Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _color,
                        border: Border.all(width: 3, style: BorderStyle.none),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getColorFromGradient(double angle) {
    final t = (angle % 360) / 360;

    if (widget.gradient is SweepGradient) {
      return _lerpColors(widget.gradient.colors, t);
    }

    if (widget.gradient is LinearGradient) {
      return _lerpColors(widget.gradient.colors, t);
    }

    return context.colors.white;
  }

  Color _lerpColors(List<Color> colors, double t) {
    final scaled = t * (colors.length - 1);
    final i = scaled.floor();
    final next = (i + 1).clamp(0, colors.length - 1);
    final localT = scaled - i;

    return Color.lerp(colors[i], colors[next], localT)!;
  }
}

class _GradientRingPainter extends CustomPainter {
  const _GradientRingPainter({
    required this.strokeWidth,
    required this.gradient,
  });

  final double strokeWidth;
  final Gradient gradient;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.width / 2 - strokeWidth;

    final rect = Rect.fromCircle(center: center, radius: radius);

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..shader = gradient.createShader(rect);

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
