import 'package:task_manager/app/extensions/string.dart';
import 'package:task_manager/features/home/models/task_status/task_status.dart';

sealed class HomeFilter {
  const HomeFilter();

  static HomeFilter fromIndex(int index) => switch (index) {
    0 => const ProjectsFilter(),
    1 => const MyTasksFilter(),
    _ => TaskStatusFilter(TaskStatus.values[index - 2]),
  };

  String get title => switch (this) {
    ProjectsFilter() => 'Projects',
    MyTasksFilter() => 'My Tasks',
    TaskStatusFilter(status: final s) => s.value.fromSnakeCase,
  };
}

class ProjectsFilter extends HomeFilter {
  const ProjectsFilter();
}

class MyTasksFilter extends HomeFilter {
  const MyTasksFilter();
}

class TaskStatusFilter extends HomeFilter {
  const TaskStatusFilter(this.status);
  final TaskStatus status;
}
