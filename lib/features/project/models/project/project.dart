// ignore_for_file: invalid_annotation_target
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager/app/converters/timestamp_converter.dart';

part 'project.freezed.dart';

part 'project.g.dart';

@freezed
abstract class TMProject with _$TMProject {
  const factory TMProject({
    required String id,

    required String name,

    String? description,

    @JsonKey(name: 'creator_id') String? creatorId,

    @JsonKey(name: 'owner_id') String? ownerId,

    @JsonKey(name: 'start_date') @TimestampConverter() DateTime? startDate,

    @JsonKey(name: 'created_at') @TimestampConverter() DateTime? createdAt,

    @JsonKey(name: 'end_date') @TimestampConverter() DateTime? endDate,

    @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt,

    @JsonKey(name: 'participants_ids') @Default([]) List<String> participants,

    @JsonKey(name: 'tags_ids') @Default([]) List<String> tagsIds,
  }) = _TMProject;

  factory TMProject.fromJson(Map<String, dynamic> json) =>
      _$TMProjectFromJson(json);
}

extension TMProjectFirestore on TMProject {
  static TMProject fromFirestore(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    final jsonWithId = {'id': doc.id, ...data};
    return TMProject.fromJson(jsonWithId);
  }
}
