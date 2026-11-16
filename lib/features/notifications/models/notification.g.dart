// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TMNotification _$TMNotificationFromJson(Map<String, dynamic> json) =>
    _TMNotification(
      id: json['id'] as String,
      isRead: json['isRead'] as bool,
      date: DateTime.parse(json['date'] as String),
      text: json['text'] as String,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String?,
      deepLink: json['deepLink'] as String?,
    );

Map<String, dynamic> _$TMNotificationToJson(_TMNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isRead': instance.isRead,
      'date': instance.date.toIso8601String(),
      'text': instance.text,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'deepLink': instance.deepLink,
    };
