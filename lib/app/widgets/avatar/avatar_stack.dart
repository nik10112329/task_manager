import 'package:flutter/material.dart';
import 'package:task_manager/app/widgets/avatar/avatar.dart';
import 'package:task_manager/app/widgets/avatar/extra_avatar.dart';

class AvatarStack extends StatelessWidget {
  const AvatarStack({
    required this.users,
    this.maxVisible = 3,
    this.size = 30,
    super.key,
  });

  final List<String> users;
  final int maxVisible;
  final double size;

  @override
  Widget build(BuildContext context) {
    final visibleUsers = users.take(maxVisible).toList();
    final extraCount = users.length - visibleUsers.length;

    return SizedBox(
      height: size,
      width: size + (visibleUsers.length - 1) * size,
      child: Stack(
        children: [
          for (int i = 0; i < visibleUsers.length; i++)
            Positioned(
              left: i * (size * 0.6),
              child: Avatar(user: visibleUsers[i], size: size),
            ),

          if (extraCount > 0)
            Positioned(
              left: visibleUsers.length * size * 0.6,
              child: ExtraAvatar(count: extraCount, size: size),
            ),
        ],
      ),
    );
  }
}
