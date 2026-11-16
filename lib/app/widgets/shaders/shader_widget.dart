import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

class ShaderWidget extends StatefulWidget {
  const ShaderWidget({super.key});

  @override
  State<ShaderWidget> createState() => _ShaderWidgetState();
}

class _ShaderWidgetState extends State<ShaderWidget>
    with TickerProviderStateMixin {
  double updateTime = 0;
  Offset? tapPosition;
  Offset? lastTapPosition;
  Size? widgetSize;
  bool mouseDown = false;


  @override
  void initState() {
    super.initState();
    createTicker((elapsed) {
      updateTime = elapsed.inMilliseconds / 700;
      setState(() {});
    }).start();
  }

  void clearEffect() {
    setState(() {
      tapPosition = null;
      lastTapPosition = null;
    });
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: Listener(
        onPointerDown: (event) {
          setState(() {
            mouseDown = true;
            tapPosition = event.localPosition;
          });
        },
        onPointerMove: (event) {
          setState(() {
            tapPosition = event.localPosition;
          });
        },
        onPointerUp: (event) {
          setState(() {
            mouseDown = false;
          });
        },
        child: ShaderBuilder((context, shader, widget) {
          return CustomPaint(
            painter: RipplePainter(
              shader: shader,
              updateTime: updateTime,
              tapPosition: tapPosition,
              mouseDown: mouseDown,
            ),
          );
        }, assetKey: 'shaders/shader.frag'),
      ),
    );
  }
}

class RipplePainter extends CustomPainter {
  RipplePainter({
    required this.shader,
    required this.updateTime,
    required this.tapPosition,
    required this.mouseDown,
  });

  final FragmentShader shader;
  final double updateTime;
  final Offset? tapPosition;
  final bool mouseDown;

  @override
  void paint(Canvas canvas, Size size) {
    // shader
    //   ..setFloat(0, size.width) // uResolution.x
    //   ..setFloat(1, size.height) // uResolution.y
    //   ..setFloat(2, updateTime) // uTime
    //   ..setFloat(3, tapPosition?.dx ?? size.width / 2) // uMouse.x
    //   ..setFloat(4, tapPosition?.dy ?? size.height / 2) // uMouse.y
    //   ..setFloat(5, mouseDown ? 1.0 : 0.0) // uMouse.z
    //   ..setFloat(6, 0); // uMouse.w
    shader
      ..setFloat(0, updateTime)
      ..setFloat(1, 1000)
      ..setFloat(2, 1000);
    // ..setFloat(0, size.width)
    // ..setFloat(1, size.height)
    // ..setFloat(2, color.r)
    // ..setFloat(3, color.g)
    // ..setFloat(4, color.b)
    // ..setFloat(5, color.a);

    final paint = Paint()..shader = shader;
    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(covariant RipplePainter oldDelegate) {
    return oldDelegate.updateTime != updateTime ||
        oldDelegate.tapPosition != tapPosition ||
        oldDelegate.mouseDown != mouseDown ||
        oldDelegate.shader != shader;
  }
}
