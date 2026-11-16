import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_rustore_push/flutter_rustore_push.dart';
import 'package:task_manager/features/notifications/client/push_request_dto.dart';
import 'package:task_manager/features/notifications/client/vk_notification_client.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class TMPushService {
  static final _messaging = FirebaseMessaging.instance;
  static final _localNotifs = FlutterLocalNotificationsPlugin();
  static late final VkNotificationClient _rustorePushClient;

  static Future<void> init({required Dio rustoreDio}) async {
    _rustorePushClient = VkNotificationClient(rustoreDio);

    await _messaging.requestPermission();
    await _safeSubscribeToTopic();
    final token = await _messaging.getToken();
    debugPrint('FCM Token: $token');

    _messaging.onTokenRefresh.listen((newToken) {
      debugPrint('Новый токен: $newToken');
    });

    await _localNotifs.initialize(
      settings: const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      ),
      onDidReceiveNotificationResponse: (response) {
        if (response.payload != null) {
          final data = jsonDecode(response.payload!) as Map<String, dynamic>;
          _handleTap(data);
        }
      },
    );

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'task_channel',
      'Уведомления о задачах',
      importance: Importance.max,
    );

    await _localNotifs
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);

    // 4. Foreground (приложение открыто)
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        _localNotifs.show(
          id: message.hashCode,
          title: message.notification!.title,
          body: message.notification!.body,
          notificationDetails: const NotificationDetails(
            android: AndroidNotificationDetails(
              'task_channel',
              'Уведомления о задачах',
              importance: Importance.max,
              priority: Priority.high,
            ),
          ),
          payload: jsonEncode(message.data),
        );
      }
    });

    // 5. Клик из background
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _handleTap(message.data);
    });

    // 6. Клик из terminated (приложение было убито)
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleTap(initialMessage.data);
    }
  }

  static void _handleTap(Map<String, dynamic> data) {
    final type = data['type'] as String?;
    final taskId = data['taskId'] as String?;

    if (type == 'new_task_assigned' && taskId != null) {
      // navigatorKey.currentContext?.router.push(
      // );
    }
  }

  static Future<void> _safeSubscribeToTopic() async {
    if (Platform.isIOS) {
      for (int i = 0; i < 10; i++) {
        final apnsToken = await _messaging.getAPNSToken();

        if (apnsToken != null) {
          await _messaging.subscribeToTopic('notifications');
          return;
        }

        await Future.delayed(const Duration(milliseconds: 500));
      }

      debugPrint('APNS token still null → topic not subscribed');
      return;
    }

    await _messaging.subscribeToTopic('notifications');
  }

  static Future<void> pushRustoreNotification({
    required String title,
    required String description,
    String? image,
  }) async {
    final String token = await RustorePushClient.getToken();
    debugPrint('PUSH TOKEN $token');
    await _rustorePushClient.sendPush(
      RustorePushRequest(
        message: RustorePushMessage(
          token: token,
          notification: RustorePushNotification(
            title: title,
            body: description,
            image: image,
          ),
        ),
      ),
    );
  }
}
