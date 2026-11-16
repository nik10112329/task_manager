import 'package:flutter/cupertino.dart';
import 'package:task_manager/features/project/models/project/project.dart';

class ArchiveScope extends InheritedWidget {
  const ArchiveScope({required this.projects, required super.child, super.key});

  final List<TMProject> projects;

  static ArchiveScope of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ArchiveScope>()!;
  }

  @override
  bool updateShouldNotify(ArchiveScope oldWidget) {
    return projects != oldWidget.projects;
  }
}
