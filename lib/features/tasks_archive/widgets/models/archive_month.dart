import 'package:task_manager/features/home/models/task/task.dart';

class ArchiveMonth {
  const ArchiveMonth({required this.month, required this.tasks});

  final DateTime month;
  final List<TMTask> tasks;

  int get count => tasks.length;

  TMTask? get previewTask => tasks.isEmpty ? null : tasks.first;

  List<TMTask> get previewTasks => tasks.take(3).toList();
}
