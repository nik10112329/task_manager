part of 'notifications_bloc.dart';

@freezed
sealed class NotificationsState with _$NotificationsState {
  const NotificationsState._();

  const factory NotificationsState.initial({
    required List<TMNotification> notifications,
  }) = _InitialNotificationState;

  const factory NotificationsState.loading({
    required List<TMNotification> notifications,
  }) = _LoadingNotificationState;

  const factory NotificationsState.idle({
    required List<TMNotification> notifications,
    required int unreadCount,
  }) = _IdleNotificationState;

  const factory NotificationsState.error({
    required List<TMNotification> notifications,
    required String message,
  }) = _ErrorNotificationState;

  bool get isLoading => maybeWhen(loading: (_) => true, orElse: () => false);

  bool get isLoaded => maybeWhen(idle: (_, _) => true, orElse: () => false);
}
