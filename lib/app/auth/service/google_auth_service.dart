import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_rustore_push/flutter_rustore_push.dart';
import 'package:google_sign_in_platform_interface/google_sign_in_platform_interface.dart';
import 'package:http/http.dart' as http;
import 'package:task_manager/app/auth/model/user_model.dart';
import 'package:task_manager/app/services/user_sync_service.dart';

class GoogleAuthService {
  final List<String> _scopes = [
    'https://www.googleapis.com/auth/contacts.readonly',
  ];

  Future<void> ensureInitialized() async {
    await GoogleSignInPlatform.instance.init(
      const InitParameters(
        serverClientId:
            '901888959877-gqg79fh331rn2et8km897vtfmf44vtm1.'
            'apps.googleusercontent.com',
      ),
    );
  }

  Future<GoogleSignInUserData?> signInLightweight() async {
    try {
      final AuthenticationResults? result = await GoogleSignInPlatform.instance
          .attemptLightweightAuthentication(
            const AttemptLightweightAuthenticationParameters(),
          );

      if (result?.user == null) return null;
      final deviceToken = await RustorePushClient.getToken();
      await UserSyncService.instance.syncUser(
        id: result!.user.id,
        email: result.user.email,
        displayName: result.user.displayName,
        photoUrl: result.user.photoUrl,
        provider: SignInMethod.google,
        deviceIds: [deviceToken],
      );

      return result.user;
    } on GoogleSignInException catch (e) {
      debugPrint('GoogleAuthService: GoogleSignInException: $e');
      return null;
    } catch (e) {
      debugPrint('GoogleAuthService: Error: $e');
      return null;
    }
  }

  Future<GoogleSignInUserData> signIn() async {
    try {
      final AuthenticationResults result = await GoogleSignInPlatform.instance
          .authenticate(const AuthenticateParameters());
      await UserSyncService.instance.syncUser(
        id: result.user.id,
        email: result.user.email,
        displayName: result.user.displayName,
        photoUrl: result.user.photoUrl,
        provider: SignInMethod.google,
      );
      final fcmToken = await FirebaseMessaging.instance.getToken();
      final rustoreToken = await RustorePushClient.getToken();
      await FirebaseFirestore.instance
          .collection('users')
          .doc(result.user.id)
          .collection('rustoreTokens')
          .doc(rustoreToken)
          .set({
            'token': rustoreToken,
            'platform': Platform.isAndroid ? 'android' : 'ios',
            'updatedAt': FieldValue.serverTimestamp(),
          });

      if (fcmToken != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(result.user.id)
            .collection('fcmTokens')
            .doc(fcmToken)
            .set({
              'token': fcmToken,
              'platform': Platform.isAndroid ? 'android' : 'ios',
              'updatedAt': FieldValue.serverTimestamp(),
            });
      }
      return result.user;
    } on GoogleSignInException catch (e) {
      debugPrint('GoogleAuthService: GoogleSignInException: $e');
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      debugPrint('GoogleAuthService: Signing out...');
      await GoogleSignInPlatform.instance.disconnect(const DisconnectParams());
      debugPrint('GoogleAuthService: Sign out successful');
    } catch (e) {
      debugPrint('GoogleAuthService: Error during sign-out: $e');
      rethrow;
    }
  }

  Future<bool> authorizeScopes(GoogleSignInUserData user) async {
    try {
      final ClientAuthorizationTokenData? tokens = await GoogleSignInPlatform
          .instance
          .clientAuthorizationTokensForScopes(
            ClientAuthorizationTokensForScopesParameters(
              request: AuthorizationRequestDetails(
                scopes: _scopes,
                userId: user.id,
                email: user.email,
                promptIfUnauthorized: true,
              ),
            ),
          );
      return tokens != null;
    } on GoogleSignInException {
      rethrow;
    }
  }

  Future<Map<String, String>?> getAuthHeaders(GoogleSignInUserData user) async {
    final ClientAuthorizationTokenData? tokens = await GoogleSignInPlatform
        .instance
        .clientAuthorizationTokensForScopes(
          ClientAuthorizationTokensForScopesParameters(
            request: AuthorizationRequestDetails(
              scopes: _scopes,
              userId: user.id,
              email: user.email,
              promptIfUnauthorized: false,
            ),
          ),
        );
    if (tokens == null) return null;
    return {
      'Authorization': 'Bearer ${tokens.accessToken}',
      'X-Goog-AuthUser': '0',
    };
  }

  Future<String> getContactInfo(GoogleSignInUserData user) async {
    final Map<String, String>? headers = await getAuthHeaders(user);
    if (headers == null) {
      throw Exception('Authorization headers not available');
    }

    final http.Response response = await http.get(
      Uri.parse(
        'https://people.googleapis.com/v1/people/me/connections?requestMask.includeField=person.names',
      ),
      headers: headers,
    );

    if (response.statusCode != 200) {
      throw Exception(
        'People API error: ${response.statusCode} - ${response.body}',
      );
    }

    final data = json.decode(response.body) as Map<String, dynamic>;
    final int contactCount =
        (data['connections'] as List<dynamic>?)?.length ?? 0;
    return '$contactCount contacts found';
  }

  Future<GoogleSignInUserData?> signInSilently() async {
    try {
      final AuthenticationResults? result = await GoogleSignInPlatform.instance
          .attemptLightweightAuthentication(
            const AttemptLightweightAuthenticationParameters(),
          );

      if (result?.user == null) {
        return null;
      }

      await UserSyncService.instance.syncUser(
        id: result!.user.id,
        email: result.user.email,
        displayName: result.user.displayName,
        photoUrl: result.user.photoUrl,
        provider: SignInMethod.google,
      );

      return result.user;
    } catch (e) {
      debugPrint('GoogleAuthService: signInSilently error → $e');
      return null;
    }
  }
}
