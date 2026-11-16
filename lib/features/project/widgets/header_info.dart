import 'package:flutter/material.dart';
import 'package:task_manager/app/localization/generated/l10n.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/features/home/models/task/task.dart';
import 'package:task_manager/features/home/models/task_status/task_status.dart';

class TMProjectHeaderInfo extends StatefulWidget {
  const TMProjectHeaderInfo({
    required this.tasks,
    required this.isEditing,
    required this.nameController,
    required this.projectName,
    super.key,
  });

  final List<TMTask> tasks;
  final bool isEditing;
  final TextEditingController nameController;
  final String projectName;

  @override
  State<TMProjectHeaderInfo> createState() => _TMProjectHeaderInfoState();
}

class _TMProjectHeaderInfoState extends State<TMProjectHeaderInfo> {
  late int tasksCompletedPercent = widget.tasks.isEmpty
      ? 0
      : (widget.tasks.where((task) => task.status == TaskStatus.done).length *
                100 /
                widget.tasks.length)
            .round();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          S.of(context).task_manager,
          style: context.styles.textStyle.copyWith(
            color: context.colors.iconDisable,
          ),
        ),
        TextField(
          readOnly: !widget.isEditing,
          controller: widget.nameController,
          style: context.styles.h1.copyWith(color: context.colors.white),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
            isDense: true,
          ),
        ),
        Text(
          '${widget.tasks.length} Задач всего - выполнены на '
          '$tasksCompletedPercent%',
          style: context.styles.textStyle.copyWith(color: context.colors.white),
        ),
      ],
    );
  }
}
