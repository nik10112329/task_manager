import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:task_manager/app/auth/model/user_model.dart';
import 'package:task_manager/app/services/user_sync_service.dart';
import 'package:vkid_flutter_sdk/library_vkid.dart';

class VkAuthClient {
  late final VKID _vkid;

  Future<void> init() async {
    _vkid = await VKID.getInstance();
  }

  Future<TMUser?> signIn() async {
    final completer = Completer<TMUser?>();

    _vkid.authorize(
      onAuth: (authData) async {
        try {
          final profile = await loadVkProfile(
            authData.token,
            authData.userID.toString(),
          );

          final user = await UserSyncService.instance.syncVkUser(
            vkId: profile['id'].toString(),
            firstName: profile['first_name'] as String,
            lastName: profile['last_name'] as String,
            photoUrl: profile['photo_200'] as String?,
          );

          completer.complete(user);
        } catch (e) {
          completer.completeError(e);
        }
      },
      onError: (error) {
        if (error is AuthCancelledError) {
          completer.complete(null);
          return;
        }

        completer.completeError(error);
      },
    );

    return completer.future;
  }

  Future<Map<String, dynamic>> loadVkProfile(
    String accessToken,
    String userId,
  ) async {
    final response = await Dio().get<Map<String, dynamic>>(
      'https://api.vk.com/method/users.get',
      queryParameters: {
        'user_ids': userId,
        'fields': 'photo_200',
        'access_token': accessToken,
        'v': '5.199',
      },
    );

    final users = response.data?['response'] as List?;

    if (users == null || users.isEmpty) {
      throw Exception('VK profile not found');
    }

    return Map<String, dynamic>.from(users.first as Map);
  }

  Future<void> signOut() async {
    final completer = Completer<void>();

    _vkid.logout(
      onSuccess: completer.complete,
      onError: completer.completeError,
    );

    return completer.future;
  }

  Future<TMUser?> restoreSession() async {
    final authData = await _vkid.currentAuthData;

    if (authData == null) {
      return null;
    }

    try {
      final profile = await loadVkProfile(
        authData.token,
        authData.userID.toString(),
      );

      return UserSyncService.instance.syncVkUser(
        vkId: profile['id'].toString(),
        firstName: profile['first_name'] as String,
        lastName: profile['last_name'] as String,
        photoUrl: profile['photo_200'] as String?,
      );
    } catch (e) {
      debugPrint('VK restoreSession error: $e');
      return null;
    }
  }
}
