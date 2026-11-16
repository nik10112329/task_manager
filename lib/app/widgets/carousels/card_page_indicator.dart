import 'package:flutter/material.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';

class TMCardPageIndicator extends StatelessWidget {
  const TMCardPageIndicator({
    required this.count,
    required this.currentIndex,
    super.key,
  });

  final int count;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: SizeTransition(sizeFactor: animation, child: child),
      ),
      child: currentIndex < count
          ? Center(
              child: Row(
                key: const ValueKey('indicator'),
                mainAxisSize: MainAxisSize.min,
                children: List.generate(count, (index) {
                  final isActive = index == currentIndex;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: isActive ? 42 : 10,
                    height: 10,
                    decoration: BoxDecoration(
                      gradient: isActive
                          ? context.colors.primaryGradient
                          : null,
                      color: isActive
                          ? context.colors.white
                          : context.colors.iconDisable,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  );
                }),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
