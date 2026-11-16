import 'package:flutter/material.dart';
import 'package:task_manager/app/localization/generated/l10n.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/app/widgets/wrappers/clickable.dart';

class TMOwnerRow extends StatelessWidget {
  const TMOwnerRow({
    required this.ownerImage,
    required this.onTap,
    super.key,
  });

  final String ownerImage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Clickable(
      onTap: onTap,
      child: Row(
        children: [
          Icon(Icons.person, color: context.colors.white),
          const SizedBox(width: 10),
          Text(
            S.of(context).owner,
            style: TextStyle(color: context.colors.white),
          ),
          const Spacer(),
          CircleAvatar(
            radius: 14,
            backgroundImage:
            ownerImage.isNotEmpty ? NetworkImage(ownerImage) : null,
            child: ownerImage.isEmpty
                ? Icon(Icons.person, color: context.colors.iconColor)
                : null,
          ),
        ],
      ),
    );
  }
}
