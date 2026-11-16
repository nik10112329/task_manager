import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:task_manager/app/widgets/ripple_effect/ripple_effect_painter.dart';

class RippleEffect extends StatefulWidget {
  const RippleEffect({
    required this.child,
    this.borderRadius = BorderRadius.zero,
    this.maxLineOpacity = 0.4,
    this.ringWidth = 0.2,
    this.animationSpeed = 1,
    this.intensityMultiplier = 1,
    this.colorBrightness = 1,
    super.key,
  });

  final Widget child;
  final BorderRadius borderRadius;
  final double maxLineOpacity;
  final double ringWidth;
  final double animationSpeed;
  final double intensityMultiplier;
  final double colorBrightness;

  @override
  State<RippleEffect> createState() => _RippleEffectState();
}

class _RippleEffectState extends State<RippleEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  ui.FragmentShader? shader;
  Offset? tapPosition;
  Offset? lastTapPosition;
  Size? widgetSize;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
      value: 10,
    );
    loadShader();
  }

  Future<void> loadShader() async {
    final program = await ui.FragmentProgram.fromAsset(
      'shaders/rosa_shader.frag',
    );
    setState(() {
      shader = program.fragmentShader();
    });
  }

  void clearEffect() {
    setState(() {
      tapPosition = null;
      lastTapPosition = null;
      controller.value = 10;
    });
  }

  void fadeOutEffect() {
    controller.animateTo(10).then((_) {
      if (mounted) {
        clearEffect();
      }
    });
  }

  bool isPointerInBounds(Offset position) {
    if (widgetSize == null) return false;
    return position.dx >= 0 &&
        position.dy >= 0 &&
        position.dx <= widgetSize!.width &&
        position.dy <= widgetSize!.height;
  }

  @override
  Widget build(BuildContext context) {
    if (shader == null) return widget.child;
    return ClipRRect(
      borderRadius: widget.borderRadius,
      child: LayoutBuilder(
        builder: (context, constraints) {
          widgetSize = Size(constraints.maxWidth, constraints.maxHeight);
          return Listener(
            onPointerDown: (pointerDown) => setState(() {
              tapPosition = pointerDown.localPosition;
              lastTapPosition = pointerDown.localPosition;
              controller
                ..reset()
                ..animateTo(3);
            }),
            onPointerUp: (pointerUp) => fadeOutEffect(),
            onPointerCancel: (pointerCancel) => fadeOutEffect(),
            onPointerMove: (pointerMove) {
              if (!isPointerInBounds(pointerMove.localPosition)) {
                fadeOutEffect();
              } else {
                setState(() {
                  tapPosition = pointerMove.localPosition;
                  lastTapPosition = pointerMove.localPosition;
                });
              }
            },
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return CustomPaint(
                  foregroundPainter:
                      tapPosition != null || lastTapPosition != null
                      ? RippleEffectPainter(
                          shader: shader!,
                          time: controller.value,
                          tapPosition: tapPosition ?? lastTapPosition,
                          maxLineOpacity: widget.maxLineOpacity,
                          ringWidth: widget.ringWidth,
                          animationSpeed: widget.animationSpeed,
                          intensityMultiplier: widget.intensityMultiplier,
                          colorBrightness: widget.colorBrightness,
                        )
                      : null,
                  size: widgetSize!,
                  child: widget.child,
                );
              },
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
