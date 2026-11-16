import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:task_manager/app/auth/model/user_model.dart';

class AuthService {
  static const FlutterSecureStorage storage = FlutterSecureStorage();

  static const _providerKey = 'auth_provider';

  Future<void> saveProvider(SignInMethod provider) async {
    await storage.write(key: _providerKey, value: provider.name);
  }

  Future<SignInMethod?> getProvider() async {
    final value = await storage.read(key: _providerKey);

    if (value == null) {
      return null;
    }

    return SignInMethod.values.firstWhere(
      (e) => e.name == value,
      orElse: () => SignInMethod.emailPassword,
    );
  }

  Future<void> clearProvider() async {
    await storage.delete(key: _providerKey);
    debugPrint(
      'PROVIDER AFTER DELETE = ${await storage.read(key: _providerKey)}',
    );
  }

  Future<void> saveToken(String token) async {
    await storage.write(key: 'jwt', value: token);
  }

  Future<String?> getToken() async {
    return storage.read(key: 'jwt');
  }

  Future<void> deleteToken() async {
    await storage.delete(key: 'jwt');
  }

  Future<void> signOut() async {
    await clearProvider();
    await deleteToken();
  }

  Future<void> saveGithubCredentials(String json) async {
    await storage.write(key: 'github_credentials', value: json);
  }

  Future<String?> getGithubCredentials() {
    return storage.read(key: 'github_credentials');
  }
}
