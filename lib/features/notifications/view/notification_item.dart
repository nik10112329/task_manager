import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/app/values/tm_icons.dart';
import 'package:task_manager/app/widgets/wrappers/clickable.dart';
import 'package:task_manager/features/notifications/models/notification.dart';

class TMNotificationItem extends StatelessWidget {
  const TMNotificationItem({
    required this.onDismissed,
    required this.onTap,
    required this.notification,
    super.key,
  });

  final TMNotification notification;
  final VoidCallback onDismissed;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(notification.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        onDismissed.call();
      },
      background: Container(
        color: context.colors.primary,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: Icon(Icons.delete, color: context.colors.secondary),
      ),
      child: Clickable(
        onTap: onTap,
        child: Container(
          height: 100,
          color: context.colors.secondary,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: context.colors.primaryGradient,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: notification.imageUrl ?? '',
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                    errorWidget: (_, _, _) => Icon(
                      TmIcons.notification,
                      color: context.colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      notification.title,
                      style: context.styles.textStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      notification.text,
                      style: context.styles.textStyle.copyWith(fontSize: 14),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              if (!notification.isRead)
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: context.colors.primary,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
