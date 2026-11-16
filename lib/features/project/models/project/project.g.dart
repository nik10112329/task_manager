// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TMProject _$TMProjectFromJson(Map<String, dynamic> json) => _TMProject(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  creatorId: json['creator_id'] as String?,
  ownerId: json['owner_id'] as String?,
  startDate: const TimestampConverter().fromJson(json['start_date']),
  createdAt: const TimestampConverter().fromJson(json['created_at']),
  endDate: const TimestampConverter().fromJson(json['end_date']),
  updatedAt: const TimestampConverter().fromJson(json['updated_at']),
  participants:
      (json['participants_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  tagsIds:
      (json['tags_ids'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$TMProjectToJson(_TMProject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'creator_id': instance.creatorId,
      'owner_id': instance.ownerId,
      'start_date': const TimestampConverter().toJson(instance.startDate),
      'created_at': const TimestampConverter().toJson(instance.createdAt),
      'end_date': const TimestampConverter().toJson(instance.endDate),
      'updated_at': const TimestampConverter().toJson(instance.updatedAt),
      'participants_ids': instance.participants,
      'tags_ids': instance.tagsIds,
    };
