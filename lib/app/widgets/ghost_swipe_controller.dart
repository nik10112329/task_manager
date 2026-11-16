import 'dart:ui';

class GhostSwipeHintController {
  VoidCallback? _start;
  VoidCallback? _reset;

  void attach({required VoidCallback start, required VoidCallback reset}) {
    _start = start;
    _reset = reset;
  }

  void start() => _start?.call();

  void reset() => _reset?.call();

  void replay() {
    _reset?.call();
    Future.microtask(() => _start?.call());
  }
}
