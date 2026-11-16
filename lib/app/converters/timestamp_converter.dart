// app/converters/timestamp_converter.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class TimestampConverter implements JsonConverter<DateTime?, dynamic> {
  const TimestampConverter();

  @override
  DateTime? fromJson(dynamic value) {
    if (value == null) return null;
    if (value is Timestamp) return value.toDate();
    if (value is String) return DateTime.parse(value);
    if (value is int) return DateTime.fromMillisecondsSinceEpoch(value);
    throw Exception('Неизвестный тип timestamp: $value');
  }

  @override
  dynamic toJson(DateTime? date) =>
      date != null ? Timestamp.fromDate(date) : null;
}
