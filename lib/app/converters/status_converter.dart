import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager/features/home/models/task_status/task_status.dart';
class TMTaskStatusConverter implements JsonConverter<TaskStatus, String> {
  const TMTaskStatusConverter();

  @override
  TaskStatus fromJson(String? json) => TaskStatus.fromValue(json);

  @override
  String toJson(TaskStatus object) => object.name;
}
