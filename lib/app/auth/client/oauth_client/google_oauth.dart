import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:task_manager/app/auth/client/oauth_client/oauth_client.dart';
import 'package:task_manager/app/auth/model/user_model.dart';

class GoogleOAuthClient extends OAuthClient {
  GoogleOAuthClient({
    required super.clientId,
    required super.clientSecret,
    required super.redirectUrl,
  }) : super(
    authorizationEndpoint: Uri.parse(
      'https://accounts.google.com/o/oauth2/v2/auth',
    ),
    tokenEndpoint: Uri.parse('https://oauth2.googleapis.com/token'),
    scopes: ['openid', 'email', 'profile'],
  );

  // Метод для получения информации о пользователе
  Future<TMUser> getUserInfo(oauth2.Client client) async {
    final response = await client.get(
      Uri.parse('https://www.googleapis.com/oauth2/v2/userinfo'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to get Google user info: ${response.body}');
    }

    final userData = json.decode(response.body) as Map<String, dynamic>;

    return TMUser(
      id: userData['id'] as String,
      email: userData['email'] as String,
      displayName: userData['name'] as String?,
      photoUrl: userData['picture'] as String?,
      signInMethod: SignInMethod.google,
      emailVerified: userData['verified_email'] as bool? ?? false,
      lastLoginAt: DateTime.now(),
    );
  }

  Future<TMUser> signIn() async {
    try {
      // 1. Получаем URL для авторизации
      final authUrl = await getAuthorizationUrl();

      debugPrint('Google Auth URL: $authUrl');

      // 2. Открываем браузер
      final result = await FlutterWebAuth2.authenticate(
        url: authUrl.toString(),
        callbackUrlScheme: redirectUrl.scheme, // 'http' для localhost
      );

      debugPrint('Google Callback result: $result');

      // 3. Обрабатываем ответ
      final responseUri = Uri.parse(result);
      final client = await handleAuthorizationResponse(responseUri);

      // 4. Получаем информацию о пользователе
      return await getUserInfo(client);
    } catch (e, stackTrace) {
      debugPrint('Google OAuth error: $e');
      debugPrint('StackTrace: $stackTrace');
      rethrow;
    }
  }

  // Проверка сохраненной авторизации
  Future<TMUser?> checkAuth() async {
    try {
      final client = await getClient();
      if (client == null) return null;

      // Проверяем, работает ли токен
      try {
        return await getUserInfo(client);
      } catch (e) {
        // Пробуем обновить токен
        final refreshedClient = await refreshToken();
        if (refreshedClient == null) return null;

        return await getUserInfo(refreshedClient);
      }
    } catch (e) {
      debugPrint('Check auth error: $e');
      return null;
    }
  }
}
