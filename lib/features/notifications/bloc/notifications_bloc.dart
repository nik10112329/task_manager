import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager/features/notifications/models/notification.dart';
import 'package:task_manager/features/notifications/repository/notification_repository.dart';
import 'package:uuid/uuid.dart';

part 'notifications_bloc.freezed.dart';

part 'notifications_event.dart';

part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc({required NotificationsRepository repository})
    : _repository = repository,
      super(const NotificationsState.initial(notifications: [])) {
    on<NotificationsEvent>(
      (event, emit) => event.map(
        load: (_) => _onLoad(emit: emit),
        markAsRead: (event) => _onMarkAsRead(event, emit: emit),
        markAllAsRead: (event) => _onMarkAllAsRead(event, emit: emit),
        newNotificationReceived: (event) =>
            _onNewNotificationReceived(event, emit: emit),
        pushRustoreNotification: (event) =>
            _onPushRustoreNotification(event, emit: emit),
        delete: (event) => _onDelete(event, emit: emit),
      ),
    );

    add(const NotificationsEvent.load());
    _repository.incomingNotificationsStream.listen((notification) {
      add(NotificationsEvent.newNotificationReceived(notification));
    });
  }

  final NotificationsRepository _repository;

  Future<void> _onLoad({required Emitter<NotificationsState> emit}) async {
    emit(NotificationsState.loading(notifications: state.notifications));

    try {
      final notifications = await _repository.getAll();
      final unread = notifications.where((n) => !n.isRead).length;

      emit(
        NotificationsState.idle(
          notifications: notifications,
          unreadCount: unread,
        ),
      );
    } catch (e) {
      emit(
        NotificationsState.error(
          message: e.toString(),
          notifications: state.notifications,
        ),
      );
    }
  }

  Future<void> _onMarkAsRead(
    _MarkAsReadNotificationsEvent event, {
    required Emitter<NotificationsState> emit,
  }) async {
    emit(NotificationsState.loading(notifications: state.notifications));
    final updatedNotifications = state.notifications.map((notification) {
      if (notification.id == event.id) {
        return notification.copyWith(isRead: !notification.isRead);
      } else {
        return notification;
      }
    }).toList();
    final unreadCount = updatedNotifications.where((n) => !n.isRead).length;

    emit(
      NotificationsState.idle(
        notifications: updatedNotifications,
        unreadCount: unreadCount,
      ),
    );
  }

  Future<void> _onDelete(
    _OnDeleteNotificationsEvent event, {
    required Emitter<NotificationsState> emit,
  }) async {
    emit(NotificationsState.loading(notifications: state.notifications));
    final updatedNotifications = state.notifications
        .where((n) => n.id != event.id)
        .toList();
    final unreadCount = updatedNotifications.where((n) => !n.isRead).length;
    await _repository.delete(event.id);
    emit(
      NotificationsState.idle(
        notifications: updatedNotifications,
        unreadCount: unreadCount,
      ),
    );
  }

  Future<void> _onMarkAllAsRead(
    _MarkAllAsReadNotificationsEvent event, {
    required Emitter<NotificationsState> emit,
  }) async {
    await _repository.markAllAsRead();
    add(const NotificationsEvent.load());
  }

  void _onNewNotificationReceived(
    _NewNotificationReceivedNotificationsEvent event, {
    required Emitter<NotificationsState> emit,
  }) {
    _handleNewNotification(event.notification, emit: emit);
  }

  void _onPushRustoreNotification(
    _PushRustoreNotificationsEvent event, {
    required Emitter<NotificationsState> emit,
  }) {
    emit(NotificationsState.loading(notifications: state.notifications));
    final uuid = const Uuid().v4();
    final notification = TMNotification(
      id: uuid,
      date: DateTime.now(),
      title: event.title,
      text: event.description,
      imageUrl: event.image,
      isRead: false,
    );
    _repository.rustorePushNotification(notification: notification);
    _handleNewNotification(notification, emit: emit);
  }

  void _handleNewNotification(
    TMNotification notification, {
    required Emitter<NotificationsState> emit,
  }) {
    emit(NotificationsState.loading(notifications: state.notifications));
    final updatedList = [notification, ...state.notifications];
    final unreadCount = updatedList.where((n) => !n.isRead).length;
    emit(
      NotificationsState.idle(
        notifications: updatedList,
        unreadCount: unreadCount,
      ),
    );
  }
}
