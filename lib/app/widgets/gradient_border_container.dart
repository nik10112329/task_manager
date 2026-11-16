import 'package:flutter/material.dart';
import 'package:task_manager/app/extensions/widgets/custom_painter.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';

class GradientBorderContainer extends StatelessWidget {
  const GradientBorderContainer({
    required this.child,
    this.backgroundColor,
    this.gradient,
    this.borderRadius = 24,
    this.strokeWidth = 1,
    super.key,
  });

  final Widget child;
  final Color? backgroundColor;
  final Gradient? gradient;
  final double borderRadius;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1. Фон + контент
        DecoratedBox(
          decoration: BoxDecoration(
            color: backgroundColor ?? context.colors.white,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: child,
          ),
        ),

        // 2. Градиентная граница поверх всего
        CustomPaint(
          painter: GradientBorderPainter(
            gradient: gradient ?? context.colors.primaryGradient,
            borderRadius: borderRadius,
            strokeWidth: strokeWidth,
          ),
          child: const SizedBox.expand(),
        ),
      ],
    );
  }
}
