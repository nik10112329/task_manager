import 'dart:async';
import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/app/services/push_service.dart';
import 'package:task_manager/features/notifications/models/notification.dart';
import 'package:task_manager/features/notifications/repository/notification_repository.dart';

class NotificationsRepositoryImpl implements NotificationsRepository {
  NotificationsRepositoryImpl({required this.prefs});

  final SharedPreferences prefs;
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static const String _keyNotifications = 'notifications_list';

  List<TMNotification> _notifications = [];

  final StreamController<List<TMNotification>> _notificationsController =
      StreamController<List<TMNotification>>.broadcast();

  Stream<List<TMNotification>> get notificationsStream =>
      _notificationsController.stream;

  @override
  Stream<TMNotification> get incomingNotificationsStream => FirebaseMessaging
      .onMessage
      .where((message) => message.notification != null)
      .map(mapRemoteMessageToNotification);

  @override
  Future<List<TMNotification>> getAll() async {
    return List.unmodifiable(_notifications);
  }

  @override
  Future<void> initPushNotifications() async {
    await _loadFromStorage();
    await _messaging.requestPermission();

    incomingNotificationsStream.listen(_addNotification);
  }

  void _addNotification(TMNotification notification) {
    _notifications.insert(0, notification);
    _saveToStorage();
    _notificationsController.add(List.unmodifiable(_notifications));
  }

  Future<void> _loadFromStorage() async {
    final String? jsonString = prefs.getString(_keyNotifications);

    if (jsonString != null && jsonString.isNotEmpty) {
      try {
        final dynamic decoded = jsonDecode(jsonString);

        if (decoded is List) {
          _notifications = decoded
              .map(
                (json) => TMNotification.fromJson(json as Map<String, dynamic>),
              )
              .toList();
        } else {
          _notifications = [];
        }
      } catch (e) {
        debugPrint('Ошибка при чтении уведомлений из SharedPreferences: $e');
        _notifications = [];
      }
    } else {
      _notifications = [];
    }

    _notificationsController.add(List.unmodifiable(_notifications));
  }

  Future<void> _saveToStorage() async {
    final jsonList = _notifications.map((n) => n.toJson()).toList();
    await prefs.setString(_keyNotifications, jsonEncode(jsonList));
  }

  @override
  Future<void> markAsRead(String id) async {
    for (int i = 0; i < _notifications.length; i++) {
      if (_notifications[i].id == id) {
        _notifications[i] = _notifications[i].copyWith(isRead: true);
        break;
      }
    }
    await _saveToStorage();
    _notificationsController.add(List.unmodifiable(_notifications));
  }

  @override
  Future<void> markAllAsRead() async {
    _notifications = _notifications
        .map((n) => n.copyWith(isRead: true))
        .toList();
    await _saveToStorage();
    _notificationsController.add(List.unmodifiable(_notifications));
  }

  @override
  TMNotification mapRemoteMessageToNotification(RemoteMessage message) {
    return TMNotification(
      id: message.messageId ?? DateTime.now().millisecondsSinceEpoch.toString(),
      title:
          (message.notification?.title ??
                  message.data['title'] ??
                  'Уведомление')
              .toString(),
      text:
          (message.notification?.body ??
                  message.data['text'] ??
                  message.data['body'] ??
                  '')
              .toString(),
      date: DateTime.now(),
      isRead: false,
      imageUrl:
          (message.notification?.android?.imageUrl ??
              message.notification?.apple?.imageUrl) ??
          message.data['imageUrl'].toString(),
      deepLink: message.data['deepLink'].toString(),
    );
  }

  @override
  Future<void> clearAll() async {
    _notifications.clear();
    await prefs.remove(_keyNotifications);
    _notificationsController.add([]);
  }

  @override
  Future<void> delete(String id) async {
    _notifications.removeWhere((n) => n.id == id);
    debugPrint('$_notifications');
    await _saveToStorage();
    debugPrint('$_notifications');
    _notificationsController.add(List.unmodifiable(_notifications));
    debugPrint('$_notificationsController');
  }

  @override
  Future<void> rustorePushNotification({
    required TMNotification notification,
  }) async {
    await TMPushService.pushRustoreNotification(
      title: notification.title,
      description: notification.text,
      image: notification.imageUrl,
    );
    _addNotification(notification);
  }
}
