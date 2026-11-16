import 'package:flutter/material.dart';
import 'package:task_manager/app/widgets/wrappers/press_detector_builder.dart';

class Clickable extends StatelessWidget {
  const Clickable({
    required this.child,
    this.onTap,
    this.onLongPress,
    this.surfaceColor,
    super.key,
  });

  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  final Color? surfaceColor;

  @override
  Widget build(BuildContext context) {
    return PressDetectorBuilder(
      onTap: onTap,
      onLongPress: onLongPress,
      builder: (context, isPressed) {
        return Stack(
          children: [
            child,
            if (onTap != null)
              AnimatedOpacity(
                duration: const Duration(milliseconds: 60),
                opacity: isPressed ? 1 : 0,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    (surfaceColor ??
                            Theme.of(context).colorScheme.surface)
                        .withValues(alpha: 0.4),
                    BlendMode.srcATop,
                  ),
                  child: child,
                ),
              ),
          ],
        );
      },
    );
  }
}
