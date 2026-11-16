import 'package:flutter/material.dart';
import 'package:task_manager/app/widgets/ghost_swipe_controller.dart';

class GhostSwipeHint extends StatefulWidget {
  const GhostSwipeHint({
    required this.child,
    required this.backgroundColor,
    this.offset = 20,
    this.duration = const Duration(milliseconds: 800),
    this.delay = const Duration(milliseconds: 400),
    this.show = true,
    this.controller,
    super.key,
  });

  final Widget child;
  final Color backgroundColor;
  final double offset;
  final Duration duration;
  final Duration delay;
  final bool show;
  final GhostSwipeHintController? controller;

  @override
  State<GhostSwipeHint> createState() => _GhostSwipeHintState();
}

class _GhostSwipeHintState extends State<GhostSwipeHint>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    widget.controller?.attach(start: _startAnimation, reset: _resetAnimation);

    if (widget.show) {
      Future.delayed(widget.delay, () {
        if (!mounted || _isDisposed) return;
        _startAnimation();
      });
    }
  }

  void _startAnimation() {
    if (!mounted || _isDisposed) return;
    _controller
      ..reset()
      ..forward();
  }

  void _resetAnimation() {
    if (!mounted || _isDisposed) return;
    _controller.reset();
  }

  @override
  Widget build(BuildContext context) {
    final slide = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 0, end: -widget.offset),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: -widget.offset, end: 0),
        weight: 1,
      ),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            color: widget.backgroundColor,
            child: const Icon(Icons.delete, color: Colors.white),
          ),
        ),
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(slide.value, 0),
              child: child,
            );
          },
          child: widget.child,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _isDisposed = true;
    _controller.dispose();
    super.dispose();
  }
}
