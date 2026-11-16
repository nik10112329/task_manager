// ignore_for_file: invalid_annotation_target
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager/app/converters/status_converter.dart';
import 'package:task_manager/app/converters/timestamp_converter.dart';
import 'package:task_manager/features/home/models/task_status/task_status.dart';

part 'task.freezed.dart';

part 'task.g.dart';

@freezed
abstract class TMTask with _$TMTask {
  const factory TMTask({
    required String projectId,
    required String name,

    @Default(TaskStatus.todo) @TMTaskStatusConverter() TaskStatus status,

    @Default('') String id,

    // @JsonKey(name: 'is_complete') @Default(false) bool isComplete,
    @JsonKey(name: 'owner_id') String? ownerId,
    @JsonKey(name: 'responsible_ids') @Default([]) List<String> responsibleIds,

    @JsonKey(name: 'archived') @Default(false) bool archived,
    @JsonKey(name: 'archived_at') @TimestampConverter() DateTime? archivedAt,

    @JsonKey(name: 'created_at') @TimestampConverter() DateTime? createdAt,
    @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt,
    @JsonKey(name: 'start_date') @TimestampConverter() DateTime? startDate,
    @JsonKey(name: 'end_date') @TimestampConverter() DateTime? endDate,

    @Default([]) List<String> tagsIds,
    String? description,
  }) = _TMTask;

  factory TMTask.fromJson(Map<String, dynamic> json) => _$TMTaskFromJson(json);
}

extension TMTaskFirestore on TMTask {
  static TMTask fromFirestore(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    final jsonWithId = {'id': doc.id, ...data};
    return TMTask.fromJson(jsonWithId);
  }
}
