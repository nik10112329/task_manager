import 'package:flutter/material.dart';
import 'package:task_manager/app/localization/generated/l10n.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/app/widgets/avatar/avatar_stack.dart';
import 'package:task_manager/app/widgets/wrappers/clickable.dart';

class TMParticipantsRow extends StatelessWidget {
  const TMParticipantsRow({
    required this.participants,
    required this.onTap,
    super.key,
  });

  final Map<String, String?> participants;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Clickable(
      onTap: onTap,
      child: Row(
        children: [
          Icon(Icons.group, color: context.colors.white),
          const SizedBox(width: 10),
          Text(
            S.of(context).participants ,
            style: TextStyle(color: context.colors.white),
          ),
          const Spacer(),
          AvatarStack(users: participants.values.cast<String>().toList()),
        ],
      ),
    );
  }
}
