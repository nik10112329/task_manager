import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:task_manager/features/notifications/models/notification.dart';

abstract class NotificationsRepository {
  Future<List<TMNotification>> getAll();

  Future<void> markAsRead(String id);

  Future<void> markAllAsRead();

  Future<void> initPushNotifications();

  Future<void> clearAll();

  TMNotification mapRemoteMessageToNotification(RemoteMessage message);

  Future<void> delete(String id);

  Stream<TMNotification> get incomingNotificationsStream;

  Future<void> rustorePushNotification({required TMNotification notification});
}
