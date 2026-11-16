import 'package:flutter/material.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/app/values/tm_icons.dart';
import 'package:task_manager/app/widgets/icon_button.dart';

class TMNavBar extends StatefulWidget {
  const TMNavBar({required this.currentIndex, required this.onTap, super.key});

  final Function(int) onTap;
  final int currentIndex;

  @override
  State<TMNavBar> createState() => _TMNavBarState();
}

class _TMNavBarState extends State<TMNavBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: context.colors.background,
      selectedIndex: widget.currentIndex,
      destinations: [
        Center(
          child: widget.currentIndex == 0
              ? ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return context.colors.primaryGradient.createShader(bounds);
                  },
                  child: TMIconButton(
                    iconData: widget.currentIndex == 0
                        ? TmIcons.homeFill
                        : TmIcons.homeOutline,
                    iconSize: 30,
                    color: context.colors.iconDisable,
                    onTap: () => setState(() => widget.onTap(0)),
                  ),
                )
              : TMIconButton(
                iconData: widget.currentIndex == 0
                    ? TmIcons.homeFill
                    : TmIcons.homeOutline,
                iconSize: 30,
                color: context.colors.iconDisable,
                onTap: () => setState(() => widget.onTap(0)),
              ),
        ),
        // selectedIndex == 1
        //     ? ShaderMask(
        //         shaderCallback: (Rect bounds) {
        //           return context.colors.primaryGradient.createShader(bounds);
        //         },
        //         child: TMIconButton(
        //           iconData: TmIcons.calendar,
        //           iconSize: 30,
        //           color: context.colors.iconDisable,
        //           onTap: () => setState(() => selectedIndex = 1),
        //         ),
        //       )
        //     : TMIconButton(
        //         iconData: TmIcons.calendar,
        //         iconSize: 30,
        //         color: context.colors.iconDisable,
        //         onTap: () => setState(() => selectedIndex = 1),
        //       ),
        Center(
          child: widget.currentIndex == 1
              ? ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return context.colors.primaryGradient.createShader(bounds);
                  },
                  child: TMIconButton(
                    iconData: TmIcons.notification,
                    iconSize: 30,
                    color: context.colors.iconDisable,
                    onTap: () => setState(() => widget.onTap(1)),
                  ),
                )
              : TMIconButton(
                  iconData: TmIcons.notification,
                  iconSize: 30,
                  color: context.colors.iconDisable,
                  onTap: () => setState(() => widget.onTap(1)),
                ),
        ),
      ],
    );
  }
}
