import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter_shaders/flutter_shaders.dart';

class ShaderMaskWidget extends StatefulWidget {
  const ShaderMaskWidget({
    required this.shaderFile,
    required this.child,
    super.key,
  });

  final Widget child;
  final String shaderFile;

  @override
  State<ShaderMaskWidget> createState() => _ShaderMaskWidgetState();
}

class _ShaderMaskWidgetState extends State<ShaderMaskWidget>
    with TickerProviderStateMixin {
  double updateTime = 0;
  late Ticker _ticker;
  @override
  void initState() {
    super.initState();
    _ticker = createTicker((elapsed) {
      updateTime = elapsed.inMilliseconds / 5000;
      setState(() {});
    })..start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShaderBuilder((context, shader, shaderWidget) {
      return ShaderMask(
        shaderCallback: (Rect bounds) {
          return shader
            ..setFloat(0, updateTime)
            ..setFloat(1, bounds.width)
            ..setFloat(2, bounds.height);
        },
        child: widget.child,
      );
    }, assetKey: widget.shaderFile);
  }
}
