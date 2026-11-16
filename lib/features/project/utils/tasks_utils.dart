import 'package:task_manager/features/home/models/task/task.dart';
import 'package:task_manager/features/project/widgets/bottom_sheets/sort_bottom_sheet.dart';

class TasksUtils {
  static List<TMTask> sortTasks({
    required List<TMTask> tasks,
    SortType? type,
    bool? isAscOrder = true,
  }) {
    if (type == null) return tasks;
    final sortedTasks = List<TMTask>.from(tasks);

    switch (type) {
      case SortType.status:
        sortedTasks.sort((a, b) {
          final result = a.status.priority.compareTo(b.status.priority);
          return isAscOrder! ? result : -result;
        });

      case SortType.deadline:
        sortedTasks.sort((a, b) {
          final aDate = a.endDate;
          final bDate = b.endDate;

          if (aDate == null && bDate == null) return 0;
          if (aDate == null) return 1;
          if (bDate == null) return -1;

          return aDate.compareTo(bDate);
        });
    }
    // return isAscOrder! ? sortedTasks : sortedTasks.reversed.toList();
    return sortedTasks.toList();
  }
}
