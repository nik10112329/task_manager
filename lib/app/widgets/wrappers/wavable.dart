import 'package:flutter/material.dart';
import 'package:task_manager/app/widgets/wrappers/press_detector_builder.dart';

class Wavable extends StatefulWidget {
  const Wavable({
    required this.child,
    this.onTap,
    this.onLongPress,
    this.waveColor,
    this.borderRadius,
    super.key,
  });

  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Color? waveColor;
  final BorderRadius? borderRadius;

  @override
  State<Wavable> createState() => _WavableState();
}

class _WavableState extends State<Wavable> with TickerProviderStateMixin {
  late final fullDuration = const Duration(milliseconds: 240);

  late final radiusController = AnimationController(
    vsync: this,
    duration: fullDuration,
    upperBound: 6,
  );
  late final opacityController = AnimationController(
    vsync: this,
    duration: fullDuration ~/ 2,
    upperBound: 0.36,
    value: 0.36,
  );

  @override
  Widget build(BuildContext context) {
    return PressDetectorBuilder(
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      builder: (context, isPressed) {
        if (isPressed) {
          radiusController.reset();
          opacityController.value = 0.5;
          radiusController.animateTo(
            radiusController.upperBound,
            curve: Curves.ease,
          );
          Future.delayed(radiusController.duration! ~/ 3).then((_) {
            opacityController.animateTo(
              opacityController.lowerBound,
              curve: Curves.ease,
            );
          });
        }
        return AnimatedBuilder(
          animation: Listenable.merge([radiusController, opacityController]),
          builder: (context, _) {
            final normalizedRadius =
                (radiusController.value - radiusController.lowerBound) /
                (radiusController.upperBound - radiusController.lowerBound);
            return DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: widget.borderRadius,
                boxShadow: [
                  BoxShadow(
                    color:
                        (widget.waveColor ??
                                Theme.of(context).colorScheme.onSurface)
                            .withValues(alpha: opacityController.value),
                    blurRadius: radiusController.value * normalizedRadius * 0.5,
                    spreadRadius: radiusController.value,
                  ),
                ],
              ),
              child: widget.child,
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    radiusController.dispose();
    super.dispose();
  }
}
