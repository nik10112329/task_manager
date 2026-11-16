import 'package:flutter/material.dart';

class Disabler extends StatelessWidget {
  const Disabler({
    required this.child,
    required this.enabled,
    this.surfaceColor,
    super.key,
  });

  final bool enabled;
  final Widget child;

  /// The scaffold background color (or any other widget that is in background)
  final Color? surfaceColor;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !enabled,
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          enabled
              ? Colors.transparent
              : (surfaceColor ?? Theme.of(context).colorScheme.surface)
                  .withValues(alpha: 0.5),
          BlendMode.srcATop,
        ),
        child: child,
      ),
    );
  }
}
