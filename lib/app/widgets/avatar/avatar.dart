import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';

class Avatar extends StatelessWidget {
  const Avatar({required this.user, required this.size, super.key});

  final String user;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: const EdgeInsets.only(right: 2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: context.colors.white, width: 2),
      ),
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: user,
          fit: BoxFit.cover,
          errorWidget: (_, _, _) => const Icon(Icons.person),
        ),
      ),
    );
  }
}
