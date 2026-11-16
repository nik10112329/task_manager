// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TMTaskTag _$TMTaskTagFromJson(Map<String, dynamic> json) => _TMTaskTag(
  id: json['id'] as String,
  name: json['name'] as String,
  color: const ColorConverter().fromJson(json['color'] as String?),
);

Map<String, dynamic> _$TMTaskTagToJson(_TMTaskTag instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': const ColorConverter().toJson(instance.color),
    };
