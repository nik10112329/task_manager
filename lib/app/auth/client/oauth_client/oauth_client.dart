import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:task_manager/app/auth/client/json_accept_client.dart';

abstract class OAuthClient {
  OAuthClient({
    required this.authorizationEndpoint,
    required this.tokenEndpoint,
    required this.clientId,
    required this.clientSecret,
    required this.redirectUrl,
    required this.scopes,
  });

  final Uri authorizationEndpoint;
  final Uri tokenEndpoint;
  final String clientId;
  final String clientSecret;
  final Uri redirectUrl;
  final List<String> scopes;

  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  static const String _credentialsKey = 'oauth_credentials';

  oauth2.AuthorizationCodeGrant? _currentGrant;

  oauth2.AuthorizationCodeGrant createGrant() {
    return oauth2.AuthorizationCodeGrant(
      clientId,
      authorizationEndpoint,
      tokenEndpoint,
      secret: clientSecret,
      httpClient: JsonAcceptClient(http.Client()),
    );
  }

  Future<Uri> getAuthorizationUrl() async {
    _currentGrant = createGrant();
    return _currentGrant!.getAuthorizationUrl(
      redirectUrl,
      scopes: scopes,
    );
  }

  Future<oauth2.Client> handleAuthorizationResponse(Uri responseUrl) async {
    if (_currentGrant == null) {
      throw StateError(
        'The authorization URL has not yet been generated. '
            'Call getAuthorizationUrl() first.',
      );
    }

    final client = await _currentGrant!.handleAuthorizationResponse(
      responseUrl.queryParameters,
    );

    _currentGrant = null;

    await saveCredentials(client.credentials);

    return client;
  }

  @protected
  Future<void> saveCredentials(oauth2.Credentials credentials) async {
    await _storage.write(
      key: _credentialsKey,
      value: credentials.toJson(),
    );
  }

  Future<oauth2.Credentials?> loadCredentials() async {
    final json = await _storage.read(key: _credentialsKey);
    if (json == null) return null;
    return oauth2.Credentials.fromJson(json);
  }

  Future<oauth2.Client?> getClient() async {
    final credentials = await loadCredentials();
    if (credentials == null) return null;
    return oauth2.Client(
      credentials,
      identifier: clientId,
      secret: clientSecret,
    );
  }

  Future<oauth2.Client?> refreshToken() async {
    final client = await getClient();
    if (client == null) return null;
    try {
      final newCredentials = await client.credentials.refresh(
        identifier: clientId,
        secret: clientSecret,
      );
      await saveCredentials(newCredentials);
      return oauth2.Client(
        newCredentials,
        identifier: clientId,
        secret: clientSecret,
      );
    } catch (e) {
      debugPrint('Failed to refresh token: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    await _storage.delete(key: _credentialsKey);
    _currentGrant = null;
  }

  Future<bool> isAuthenticated() async {
    final credentials = await loadCredentials();
    return credentials != null && !credentials.isExpired;
  }

}
