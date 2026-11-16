import 'package:flutter/material.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/app/widgets/wrappers/clickable.dart';

class TMIconButton extends StatefulWidget {
  const TMIconButton({
    required this.iconData,
    required this.onTap,
    this.enabled = true,
    this.color,
    this.disabledColor,
    this.iconSize,
    this.paddings = EdgeInsets.zero,
    this.blendMode,
    super.key,
  });

  final IconData iconData;
  final VoidCallback onTap;
  final Color? color;
  final Color? disabledColor;
  final bool enabled;
  final double? iconSize;
  final EdgeInsets? paddings;
  final BlendMode? blendMode;

  @override
  State<TMIconButton> createState() => _TMIconButtonState();
}

class _TMIconButtonState extends State<TMIconButton> {
  DateTime? _lastTapTime;
  static const _throttleDuration = Duration(milliseconds: 500);

  void _handleTap() {
    final now = DateTime.now();
    if (_lastTapTime != null &&
        now.difference(_lastTapTime!) < _throttleDuration) {
      return;
    }
    _lastTapTime = now;
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.enabled,
      child: Clickable(
        onTap: _handleTap,
        child: Padding(
          padding: widget.paddings ?? EdgeInsets.zero,
          child: Icon(
            widget.iconData,
            size: widget.iconSize ?? 24,
            color: widget.enabled
                ? widget.color ?? context.colors.primary
                : widget.disabledColor ??
                      widget.color ??
                      context.colors.primary,
            blendMode: widget.blendMode,
          ),
        ),
      ),
    );
  }
}
