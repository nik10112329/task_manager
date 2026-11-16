part of 'notifications_bloc.dart';

@freezed
sealed class NotificationsEvent with _$NotificationsEvent {
  const NotificationsEvent._();

  const factory NotificationsEvent.load() = _LoadNotificationsEvent;

  const factory NotificationsEvent.markAsRead(String id) =
      _MarkAsReadNotificationsEvent;

  const factory NotificationsEvent.delete(String id) =
      _OnDeleteNotificationsEvent;

  const factory NotificationsEvent.markAllAsRead() =
      _MarkAllAsReadNotificationsEvent;

  const factory NotificationsEvent.newNotificationReceived(
    TMNotification notification,
  ) = _NewNotificationReceivedNotificationsEvent;

  const factory NotificationsEvent.pushRustoreNotification({
    required String title,
    required String description,
    String? image,
  }) = _PushRustoreNotificationsEvent;

  // const factory NotificationsEvent.listenIncoming() =
  //     _ListenIncomingNotificationsEvent;
}
