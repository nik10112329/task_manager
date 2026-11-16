import 'package:flutter/material.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';

class ExtraAvatar extends StatelessWidget {
  const ExtraAvatar({required this.count, required this.size, super.key});

  final int count;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: context.colors.iconDisable,
        shape: BoxShape.circle,
        border: Border.all(color: context.colors.white, width: 2),
      ),
      child: Center(
        child: Text(
          '+$count',
          style: TextStyle(
            color: context.colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
