import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:task_manager/app/auth/client/auth_service.dart';
import 'package:task_manager/app/auth/client/oauth_client/oauth_client.dart';
import 'package:task_manager/app/auth/model/user_model.dart';
import 'package:task_manager/app/services/user_sync_service.dart';

class GitHubOAuthClient extends OAuthClient {
  GitHubOAuthClient({
    required this.authService,
    required super.clientId,
    required super.clientSecret,
    required super.redirectUrl,
  }) : super(
         authorizationEndpoint: Uri.parse(
           'https://github.com/login/oauth/authorize',
         ),
         tokenEndpoint: Uri.parse(
           'https://github.com/login/oauth/access_token',
         ),
         scopes: ['user', 'user:email'],
       );

  final AuthService authService;

  Future<Map<String, dynamic>> getUserInfo(oauth2.Client client) async {
    final response = await client.get(
      Uri.parse('https://api.github.com/user'),
      headers: {'Accept': 'application/vnd.github.v3+json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to get GitHub user info: ${response.body}');
    }

    final userInfo = json.decode(response.body) as Map<String, dynamic>;

    final email = await _getUserEmail(client, userInfo);

    await UserSyncService.instance.syncUser(
      id: '${userInfo['id']}',
      email: email,
      displayName: userInfo['name'] as String?,
      photoUrl: userInfo['avatar_url'] as String?,
      provider: SignInMethod.github,
    );

    return userInfo;
  }

  Future<String?> _getUserEmail(
    oauth2.Client client,
    Map<String, dynamic> userInfo,
  ) async {
    final publicEmail = userInfo['email'];
    if (publicEmail != null && (publicEmail as String).trim().isNotEmpty) {
      return publicEmail;
    }
    try {
      final res = await client.get(
        Uri.parse('https://api.github.com/user/emails'),
        headers: {'Accept': 'application/vnd.github.v3+json'},
      );

      if (res.statusCode == 200) {
        final emailsList = json.decode(res.body) as List;
        for (final item in emailsList) {
          final emailData = item as Map<String, dynamic>;
          if (emailData['primary'] == true) {
            return emailData['email'] as String?;
          }
        }
        for (final item in emailsList) {
          final emailData = item as Map<String, dynamic>;
          if (emailData['verified'] == true) {
            return emailData['email'] as String?;
          }
        }
        if (emailsList.isNotEmpty) {
          return (emailsList.first as Map<String, dynamic>)['email'] as String?;
        }
      }
    } catch (e) {
      debugPrint('Не удалось получить email через /user/emails: $e');
    }
    final login = userInfo['login'] as String?;
    return login != null ? '$login@users.noreply.github.com' : null;
  }

  Future<TMUser?> restoreSession() async {
    final credentialsJson = await authService.getGithubCredentials();

    if (credentialsJson == null) {
      return null;
    }

    try {
      final credentials = oauth2.Credentials.fromJson(credentialsJson);

      final client = oauth2.Client(
        credentials,
        identifier: clientId,
        secret: clientSecret,
      );

      final userInfo = await getUserInfo(client);

      return await UserSyncService.instance.syncUser(
        id: userInfo['id'].toString(),
        email: userInfo['email']?.toString(),
        displayName:
            userInfo['name']?.toString() ?? userInfo['login']?.toString(),
        photoUrl: userInfo['avatar_url']?.toString(),
        provider: SignInMethod.github,
      );
    } catch (e) {
      debugPrint('GitHub restoreSession error: $e');
      return null;
    }
  }
}
