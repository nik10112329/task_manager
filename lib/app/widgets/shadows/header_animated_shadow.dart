import 'package:flutter/material.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';

class TMHeaderAnimatedShadow extends StatelessWidget {
  const TMHeaderAnimatedShadow({required this.showShadow, super.key});

  final bool showShadow;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: showShadow ? 1 : 0,
      duration: const Duration(milliseconds: 500),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: showShadow ? 24 : 0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              context.colors.textColor.withValues(alpha: 0.12),
              context.colors.textColor.withValues(alpha: 0.06),
              context.colors.textColor.withValues(alpha: 0.03),
              context.colors.textColor.withValues(alpha: 0.01),
              context.colors.transparent,
            ],
            stops: const [0.0, 0.2, 0.45, 0.75, 1.0],
          ),
        ),
      ),
    );
  }
}
