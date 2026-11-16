// lib/app/widgets/debug/debug_overlay.dart
import 'package:flutter/material.dart';

class TMDebugOverlay extends StatefulWidget {
  const TMDebugOverlay({required this.child, super.key});

  final Widget child;

  static final _logs = ValueNotifier<List<String>>([]);

  static void log(String message) {
    final logs = List<String>.from(_logs.value)
      ..insert(0, '[${DateTime.now().toString().substring(11, 19)}] $message');
    if (logs.length > 20) logs.removeLast();
    _logs.value = logs;
  }

  @override
  State<TMDebugOverlay> createState() => _DebugOverlayState();
}

class _DebugOverlayState extends State<TMDebugOverlay> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          widget.child,
          Positioned(
            bottom: 100,
            right: 16,
            child: GestureDetector(
              onTap: () => setState(() => _visible = !_visible),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.7),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _visible ? 'Hide' : 'Debug',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          ),
          if (_visible)
            Positioned(
              bottom: 140,
              left: 16,
              right: 16,
              child: ValueListenableBuilder<List<String>>(
                valueListenable: TMDebugOverlay._logs,
                builder: (context, logs, _) {
                  return Container(
                    height: 300,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.85),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListView.builder(
                      itemCount: logs.length,
                      itemBuilder: (context, index) => Text(
                        logs[index],
                        style: const TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 11,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
