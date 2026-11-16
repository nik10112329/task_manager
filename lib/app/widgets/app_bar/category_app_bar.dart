import 'package:flutter/material.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/app/widgets/wrappers/paddings.dart';

class CategoryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CategoryAppBar({
    required this.categoryName,
    this.onActionButtonTap,
    super.key,
  });

  final String categoryName;

  final Future<void> Function()? onActionButtonTap;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        categoryName,
        style: context.styles.h1.copyWith(fontSize: 20),
      ),
      actions: [
        if (onActionButtonTap != null)
          RightPadding(
            child: GestureDetector(
              onTap: onActionButtonTap,
              child: const Icon(Icons.search),
            ),
          ),
      ],
    );
  }
}
