import 'package:google_sign_in_platform_interface/google_sign_in_platform_interface.dart';
import 'package:task_manager/app/auth/model/user_model.dart';

abstract class AuthRepository {
  Future<void> ensureInitialized();

  // Future<TMUser?> signInLightweight();

  Future<TMUser> signIn();

  Future<TMUser> signInOauthWithGithub();

  Future<void> signOut();

  Future<bool> authorizeScopes(GoogleSignInUserData user);

  Future<String> getContactInfo(GoogleSignInUserData user);

  Future<TMUser?> signInWithVk();

  Future<GoogleSignInUserData?> signInSilently();

  Future<TMUser?> restoreSession();
}
