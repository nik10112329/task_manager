import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager/app/extensions/string.dart';

@JsonEnum(valueField: 'value')
enum TaskStatus {
  todo('todo', 0),
  inProgress('in_progress', 1),
  onReview('on_review', 2),
  done('done', 3),
  blocked('blocked', 4),
  cancelled('cancelled', 5);

  const TaskStatus(this.value, this.priority);

  final String value;
  final int priority;

  static List<String> get allValuesNormalFormatted =>
      values.map((e) => e.value.fromSnakeCase).toList();

  static List<String> get allValuesCamelCase =>
      values.map((e) => e.value.toCamelCase()).toList();

  static TaskStatus fromValue(String? value) {
    if (value == null || value.isEmpty) {
      return TaskStatus.todo;
    }

    final normalized = value.trim();

    return TaskStatus.values.firstWhere(
      (status) => status.value == normalized || status.name == normalized,
      orElse: () => TaskStatus.cancelled,
    );
  }
}
