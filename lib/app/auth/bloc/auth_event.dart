part of 'auth_bloc.dart';

@freezed
sealed class AuthEvent with _$AuthEvent{
  const AuthEvent._();

  const factory AuthEvent.initialize() = _InitializeAuthEvent;
  const factory AuthEvent.check() = _CheckAuthEvent;
  const factory AuthEvent.signOut() = _SignOutAuthEvent;
  const factory AuthEvent.signIn() = _SignInAuthEvent;
  const factory AuthEvent.signInWithGoogle() = _SignInGoogleAuthEvent;
  const factory AuthEvent.signInWithGitHubOauth() = _SignInGithubOauthAuthEvent;
  const factory AuthEvent.signInWithVk() = _SignInWithVkAuthEvent;
}
