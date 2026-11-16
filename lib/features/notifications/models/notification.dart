import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';

part 'notification.g.dart';

@freezed
abstract class TMNotification with _$TMNotification {
  const factory TMNotification({
    required String id,
    required bool isRead,
    required DateTime date,
    required String text,
    required String title,
    String? imageUrl,
    String? deepLink,
  }) = _TMNotification;

  factory TMNotification.fromJson(Map<String, dynamic> json) =>
      _$TMNotificationFromJson(json);
}
