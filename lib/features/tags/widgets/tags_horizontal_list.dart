import 'package:flutter/material.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/app/widgets/wrappers/clickable.dart';
import 'package:task_manager/features/tags/models/tag/tag.dart';

class TMScrollableFade extends StatefulWidget {
  const TMScrollableFade({
    required this.child,
    required this.scrollDirection,
    super.key,
  });

  final Widget child;
  final Axis scrollDirection;

  @override
  State<TMScrollableFade> createState() => _TMScrollableFadeState();
}

class _TMScrollableFadeState extends State<TMScrollableFade> {
  final _controller = ScrollController();

  bool _showStartFade = false;
  bool _showEndFade = false;

  bool get _isHorizontal => widget.scrollDirection == Axis.horizontal;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateFades());
  }

  void _onScroll() => _updateFades();

  void _updateFades() {
    if (!_controller.hasClients) return;

    final max = _controller.position.maxScrollExtent;
    final offset = _controller.offset;

    final showStart = offset > 0;
    final showEnd = offset < max;

    if (showStart != _showStartFade || showEnd != _showEndFade) {
      setState(() {
        _showStartFade = showStart;
        _showEndFade = showEnd;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollMetricsNotification>(
      onNotification: (notification) {
        final max = notification.metrics.maxScrollExtent;
        final offset = notification.metrics.pixels;

        final showStart = offset > 0;
        final showEnd = max > 0 && offset < max;

        if (showStart != _showStartFade || showEnd != _showEndFade) {
          setState(() {
            _showStartFade = showStart;
            _showEndFade = showEnd;
          });
        }
        return false;
      },
      child: Stack(
        children: [
          SingleChildScrollView(
            controller: _controller,
            scrollDirection: widget.scrollDirection,
            child: widget.child,
          ),
          Positioned(
            left: 0,
            top: 0,
            right: _isHorizontal ? null : 0,
            bottom: _isHorizontal ? 0 : null,
            child: IgnorePointer(
              child: AnimatedOpacity(
                opacity: _showStartFade ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: _fade(
                  context,
                  begin: _isHorizontal
                      ? Alignment.centerLeft
                      : Alignment.topCenter,
                  end: _isHorizontal
                      ? Alignment.centerRight
                      : Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            left: _isHorizontal ? null : 0,
            top: _isHorizontal ? 0 : null,
            child: IgnorePointer(
              child: AnimatedOpacity(
                opacity: _showEndFade ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: _fade(
                  context,
                  begin: _isHorizontal
                      ? Alignment.centerRight
                      : Alignment.bottomCenter,
                  end: _isHorizontal
                      ? Alignment.centerLeft
                      : Alignment.topCenter,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _fade(
    BuildContext context, {
    required Alignment begin,
    required Alignment end,
  }) {
    return Container(
      width: _isHorizontal ? 20 : null,
      height: _isHorizontal ? null : 20,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: [
            context.colors.secondary,
            context.colors.secondary.withValues(alpha: 0),
          ],
        ),
      ),
    );
  }
}

class TMTagChip extends StatelessWidget {
  const TMTagChip({
    required this.tag,
    required this.onTap,
    this.padding,
    this.fontSize,
    this.isActive = false,
    super.key,
  });

  final TMTaskTag tag;
  final EdgeInsets? padding;
  final double? fontSize;
  final VoidCallback onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Clickable(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: tag.color == null
              ? context.colors.primaryGradient.withOpacity(isActive ? 0.5 : 0.3)
              : null,
          color: tag.color != null
              ? Color(tag.color!).withValues(alpha: isActive ? 0.8 : 0.5)
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isActive)
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 3),
                child: Icon(
                  Icons.check,
                  color: context.colors.textColor,
                  size: 15,
                ),
              ),
            Flexible(
              child: Padding(
                padding:
                    padding ??
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                child: Text(
                  tag.name.toUpperCase(),
                  style: context.styles.textStyle.copyWith(
                    fontSize: fontSize ?? 10,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const SizedBox(width: 4),
          ],
        ),
      ),
    );
  }
}
