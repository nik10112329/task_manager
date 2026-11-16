import 'package:flutter/material.dart';
import 'package:task_manager/app/extensions/date_time.dart';
import 'package:task_manager/app/localization/generated/l10n.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/features/tasks_archive/widgets/models/archive_month.dart';

class TMArchiveFolderCard extends StatefulWidget {
  const TMArchiveFolderCard({required this.archiveMonth, super.key});

  final ArchiveMonth archiveMonth;

  @override
  State<TMArchiveFolderCard> createState() => _TMArchiveFolderCardState();
}

class _TMArchiveFolderCardState extends State<TMArchiveFolderCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ...List.generate(3, (index) {
          final task = widget.archiveMonth.tasks[index];
          return Dismissible(
            key: ValueKey('restore_task ${task.name}'),
            direction: DismissDirection.endToStart,
            background: AnimatedSize(
              duration: const Duration(milliseconds: 300),
              child: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: context.colors.primary,
                  border: Border.all(color: context.colors.white),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Восстановить',
                      style: context.styles.textStyle.copyWith(
                        color: context.colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Icon(Icons.restore, color: context.colors.white),
                  ],
                ),
              ),
            ),
            confirmDismiss: (direction) async {
              return showModalBottomSheet<bool>(
                context: context,
                builder: (context) {
                  return SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Восстановить задачу?',
                            style: context.styles.h1.copyWith(fontSize: 18),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () =>
                                      Navigator.pop(context, false),
                                  child: Text(
                                    S.of(context).cancel,
                                    style: context.styles.textStyle.copyWith(
                                      color: context.colors.textColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: context.colors.primary,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context, true);
                                  },
                                  child: Text(
                                    'Восстановить',
                                    style: context.styles.textStyle.copyWith(
                                      color: context.colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.name,
                    style: context.styles.textStyle.copyWith(
                      color: context.colors.textColor,
                    ),
                  ),
                  Text(
                    'Тег',
                    style: context.styles.textStyle.copyWith(
                      color: context.colors.textColor,
                    ),
                  ),
                  Text(
                    'Исполнители:',
                    style: context.styles.textStyle.copyWith(
                      color: context.colors.textColor,
                    ),
                  ),
                  // if (_participants[task.id] != null &&
                  //     _participants[task.id]!.isNotEmpty)
                  //   Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       ...List.generate(_participants[task.id]!.length, (
                  //         usersIndex,
                  //       ) {
                  //         final user = _participants[task.id]![usersIndex];
                  //         return Text(
                  //           user.displayNameOrEmail,
                  //           style: context.styles.textStyle.copyWith(
                  //             color: context.colors.textColor,
                  //           ),
                  //         );
                  //       }),
                  //     ],
                  //   ),
                  if (task.archivedAt != null)
                    Text(
                      'Перенесена в архив: '
                      '${task.archivedAt!.toRuDate}',
                      style: context.styles.textStyle.copyWith(
                        color: context.colors.textColor,
                      ),
                    ),
                  if (task.endDate != null)
                    Text(
                      'Завершена: ${task.endDate!.toRuDate}',
                      style: context.styles.textStyle.copyWith(
                        color: context.colors.textColor,
                      ),
                    ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}
