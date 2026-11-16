import 'package:flutter/material.dart';
import 'package:task_manager/app/localization/generated/l10n.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/features/home/models/task_status/task_status.dart';

extension TaskStatusUI on TaskStatus {
  Color get color => switch (this) {
    TaskStatus.todo => lightColors.primary,
    TaskStatus.inProgress => lightColors.primary,
    TaskStatus.onReview => lightColors.primary,
    TaskStatus.done => lightColors.completed,
    TaskStatus.blocked => lightColors.error,
    TaskStatus.cancelled => lightColors.iconColor,
  };

  String get label => switch (this) {
    TaskStatus.todo => S.current.todo,
    TaskStatus.inProgress => S.current.in_progress,
    TaskStatus.onReview => S.current.on_review,
    TaskStatus.done => S.current.status_done,
    TaskStatus.blocked => S.current.blocked,
    TaskStatus.cancelled => S.current.cancelled,
  };

  IconData get icon => switch (this) {
    TaskStatus.todo => Icons.circle_outlined,
    TaskStatus.inProgress => Icons.timelapse_rounded,
    TaskStatus.onReview => Icons.remove_red_eye_outlined,
    TaskStatus.done => Icons.check,
    TaskStatus.blocked => Icons.pause,
    TaskStatus.cancelled => Icons.block_rounded,
  };
}
