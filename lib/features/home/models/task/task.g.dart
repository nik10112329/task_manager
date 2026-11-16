// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TMTask _$TMTaskFromJson(Map<String, dynamic> json) => _TMTask(
  projectId: json['projectId'] as String,
  name: json['name'] as String,
  status: json['status'] == null
      ? TaskStatus.todo
      : const TMTaskStatusConverter().fromJson(json['status'] as String),
  id: json['id'] as String? ?? '',
  ownerId: json['owner_id'] as String?,
  responsibleIds:
      (json['responsible_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  archived: json['archived'] as bool? ?? false,
  archivedAt: const TimestampConverter().fromJson(json['archived_at']),
  createdAt: const TimestampConverter().fromJson(json['created_at']),
  updatedAt: const TimestampConverter().fromJson(json['updated_at']),
  startDate: const TimestampConverter().fromJson(json['start_date']),
  endDate: const TimestampConverter().fromJson(json['end_date']),
  tagsIds:
      (json['tagsIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  description: json['description'] as String?,
);

Map<String, dynamic> _$TMTaskToJson(_TMTask instance) => <String, dynamic>{
  'projectId': instance.projectId,
  'name': instance.name,
  'status': const TMTaskStatusConverter().toJson(instance.status),
  'id': instance.id,
  'owner_id': instance.ownerId,
  'responsible_ids': instance.responsibleIds,
  'archived': instance.archived,
  'archived_at': const TimestampConverter().toJson(instance.archivedAt),
  'created_at': const TimestampConverter().toJson(instance.createdAt),
  'updated_at': const TimestampConverter().toJson(instance.updatedAt),
  'start_date': const TimestampConverter().toJson(instance.startDate),
  'end_date': const TimestampConverter().toJson(instance.endDate),
  'tagsIds': instance.tagsIds,
  'description': instance.description,
};
