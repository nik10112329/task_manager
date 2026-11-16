import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';

class TMAppBar extends StatefulWidget implements PreferredSizeWidget {
  const TMAppBar({
    this.shadowNotifier,
    this.profileWidgetNotifier,
    this.title,
    this.leading,
    this.trailing,
    this.leadingPadding,
    this.trailingPadding,
    this.backgroundColor,
    this.bottom,
    super.key,
  });

  final Widget? title;
  final Widget? leading;
  final Widget? trailing;
  final EdgeInsets? leadingPadding;
  final EdgeInsets? trailingPadding;
  final Color? backgroundColor;
  final PreferredSizeWidget? bottom;
  final ValueListenable<bool>? shadowNotifier;
  final ValueListenable<Widget?>? profileWidgetNotifier;

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));

  @override
  State<TMAppBar> createState() => _TMAppBarState();
}

class _TMAppBarState extends State<TMAppBar> {
  late final _fallbackShadowNotifier = ValueNotifier<bool>(false);
  late final _fallbackProfileNotifier = ValueNotifier<Widget?>(null);

  @override
  void dispose() {
    _fallbackShadowNotifier.dispose();
    _fallbackProfileNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: widget.shadowNotifier ?? _fallbackShadowNotifier,
      builder: (context, showShadow, _) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color:
                widget.backgroundColor ??
                Theme.of(context).scaffoldBackgroundColor,
            boxShadow: showShadow
                ? [
                    BoxShadow(
                      color: context.colors.textColor.withValues(alpha: 0.15),
                      blurRadius: 14,
                      offset: const Offset(0, 5),
                      spreadRadius: -6,
                    ),
                  ]
                : [],
          ),
          child: AppBar(
            backgroundColor: context.colors.transparent,
            elevation: 0,
            scrolledUnderElevation: 0,
            centerTitle: true,
            title: widget.title,
            leading: widget.leading != null
                ? Padding(
                  padding: widget.leadingPadding??EdgeInsets.zero,
                  child: widget.leading,
                )
                : null,
            actionsPadding: widget.trailingPadding,
            actions: [
              if (widget.trailing != null) widget.trailing!,
              ValueListenableBuilder<Widget?>(
                valueListenable:
                    widget.profileWidgetNotifier ?? _fallbackProfileNotifier,
                builder: (context, profileWidget, _) =>
                    profileWidget ?? const SizedBox.shrink(),
              ),
            ],
          ),
        );
      },
    );
  }
}
