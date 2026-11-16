import 'package:flutter/material.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/app/widgets/wrappers/clickable.dart';

class TMButton extends StatelessWidget {
  const TMButton({required this.onTap, required this.content, super.key});

  final VoidCallback onTap;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Clickable(
      onTap: onTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: context.colors.primary,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [context.colors.standardShadow],
        ),
        child: Center(child: content),
      ),
    );
  }
}
