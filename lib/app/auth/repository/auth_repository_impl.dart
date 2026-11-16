import 'package:flutter/foundation.dart';
import 'package:flutter_rustore_push/flutter_rustore_push.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:google_sign_in_platform_interface/google_sign_in_platform_interface.dart';
import 'package:task_manager/app/auth/client/auth_service.dart';
import 'package:task_manager/app/auth/client/oauth_client/github_oauth.dart';
import 'package:task_manager/app/auth/client/vk_auth_client.dart';
import 'package:task_manager/app/auth/model/user_model.dart';
import 'package:task_manager/app/auth/repository/auth_repository.dart';
import 'package:task_manager/app/auth/service/google_auth_service.dart';
import 'package:task_manager/app/env/env.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.googleService,
    required this.service,
    required this.gitHubOauth,
    required this.vkAuthClient,
  });

  final GoogleAuthService googleService;
  final AuthService service;
  final GitHubOAuthClient gitHubOauth;
  final VkAuthClient vkAuthClient;

  @override
  Future<void> ensureInitialized() async {
    await googleService.ensureInitialized();
  }

  @override
  Future<TMUser> signIn() async {
    final googleUser = await googleService.signIn();
    final rustoreToken = await RustorePushClient.getToken();
    await service.saveProvider(SignInMethod.google);
    final user = TMUser.fromGoogleSignIn(
      id: googleUser.id,
      email: googleUser.email,
      displayName: googleUser.displayName,
      photoUrl: googleUser.photoUrl,
      rustoreTokens: [rustoreToken],
    );
    return user;
  }

  @override
  Future<void> signOut() async {
    await _deletePushTokenSafe();
    await googleService.signOut();
    await gitHubOauth.signOut();
    await vkAuthClient.signOut();
    await service.signOut();
  }

  Future<void> _deletePushTokenSafe() async {
    try {
      final token = await RustorePushClient.getToken();

      if (token.isNotEmpty) {
        await RustorePushClient.deleteToken();
      }
    } catch (e) {
      debugPrint('Failed to delete push token: $e');
    }
  }

  @override
  Future<bool> authorizeScopes(GoogleSignInUserData user) async {
    return googleService.authorizeScopes(user);
  }

  @override
  Future<String> getContactInfo(GoogleSignInUserData user) async {
    return googleService.getContactInfo(user);
  }

  @override
  Future<TMUser> signInOauthWithGithub() async {
    try {
      final authUrl = await gitHubOauth.getAuthorizationUrl();
      final result = await FlutterWebAuth2.authenticate(
        url: authUrl.toString(),
        callbackUrlScheme: Env().gitHubCallbackUrlScheme,
      );
      final responseUri = Uri.parse(result);
      final accessToken = await gitHubOauth.handleAuthorizationResponse(
        responseUri,
      );

      final userData = await gitHubOauth.getUserInfo(accessToken);
      await service.saveProvider(SignInMethod.github);
      return TMUser(
        id: userData['id'].toString(),
        email: userData['email']?.toString() ?? '',
        displayName:
            userData['name']?.toString() ?? userData['login']?.toString() ?? '',
        photoUrl: userData['avatar_url']?.toString(),
        signInMethod: SignInMethod.github,
        emailVerified: true,
        lastLoginAt: DateTime.now(),
      );
    } catch (e, stackTrace) {
      debugPrint('GitHub OAuth error: $e');
      debugPrint('StackTrace: $stackTrace');
      rethrow;
    }
  }

  @override
  Future<TMUser?> signInWithVk() async {
    await service.saveProvider(SignInMethod.vk);
    return vkAuthClient.signIn();
  }

  @override
  Future<GoogleSignInUserData?> signInSilently() async {
    return googleService.signInSilently();
  }

  @override
  Future<TMUser?> restoreSession() async {
    final provider = await service.getProvider();
    switch (provider) {
      case SignInMethod.google:
        final googleUser = await googleService.signInSilently();

        if (googleUser == null) {
          return null;
        }

        return TMUser.fromGoogleSignIn(
          id: googleUser.id,
          email: googleUser.email,
          displayName: googleUser.displayName,
          photoUrl: googleUser.photoUrl,
        );

      case SignInMethod.github:
        return gitHubOauth.restoreSession();

      case SignInMethod.vk:
        return vkAuthClient.restoreSession();

      default:
        return null;
    }
  }
}
