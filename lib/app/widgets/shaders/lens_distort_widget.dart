import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

class LensDistortWidget extends StatefulWidget {
  const LensDistortWidget({required this.child, super.key});

  final Widget child;

  @override
  State<LensDistortWidget> createState() => _LensDistortWidgetState();
}

class _LensDistortWidgetState extends State<LensDistortWidget> {
  Offset _lensPos = Offset.zero;
  bool _mode = false;
  bool _isDragging = false;
  bool _showLens = false;

  @override
  Widget build(BuildContext context) {
    return ShaderBuilder(
      assetKey: 'shaders/liquid_glass_lens.frag',
      (context, shader, child) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          // Только переключаем мод при обычном тапе
          setState(() {
            _mode = !_mode;
          });
        },
        onPanStart: (details) {
          setState(() {
            _isDragging = true;
            _showLens = true; // Показываем линзу только при нажатии
            _lensPos = details.localPosition;
          });
        },
        onPanUpdate: (details) {
          if (_isDragging) {
            setState(() {
              _lensPos = details.localPosition;
            });
          }
        },
        onPanEnd: (details) {
          setState(() {
            _isDragging = false;
            _showLens = false; // Скрываем линзу при отпускании
            _lensPos = details.localPosition;
          });
        },
        onPanCancel: () {
          setState(() {
            _isDragging = false;
            _showLens = false; // Скрываем линзу при отмене
          });
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            final size = Size(constraints.maxWidth, constraints.maxHeight);
            if (size.isEmpty) return child ?? const SizedBox();
            final normalizedLens = Offset(
              1.0 - (_lensPos.dx / size.width),
              1.0 - (_lensPos.dy / size.height),
            );

            shader
              // ..setFloat(0, 0.5)
              ..setFloat(0, size.width)
              ..setFloat(1, size.height)
              ..setFloat(2, normalizedLens.dx)
              ..setFloat(3, normalizedLens.dy)
              ..setFloat(4, _mode ? 1.0 : 0.0)
              ..setFloat(5, 0.25) // u_SizeLens = 0.35
              ..setFloat(6, 1); // u_hasLens = 1
            //}
            if (_showLens) {
              return ImageFiltered(
                imageFilter: ui.ImageFilter.shader(shader),
                child: child,
              );
            } else {
              return child ?? const SizedBox();
            }
          },
        ),
      ),
      child: widget.child,
    );
  }
}
