import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
abstract class TMUser with _$TMUser {
  const factory TMUser({
    required String id,
    required String email,
    required SignInMethod signInMethod,
    String? idLinkedProvider,
    @Default([]) List<SignInMethod> linkedProviders,
    @Default([]) List<String>? rustoreTokens,
    String? displayName,
    String? photoUrl,
    String? phoneNumber,
    @Default(false) bool emailVerified,
    DateTime? createdAt,
    DateTime? lastLoginAt,
  }) = _TMUser;

  const TMUser._();

  factory TMUser.fromJson(Map<String, dynamic> json) => _$TMUserFromJson(json);

  factory TMUser.fromGoogleSignIn({
    required String id,
    required String email,
    String? googleId,
    String? displayName,
    String? photoUrl,
    List<String>? rustoreTokens,
  }) {
    return TMUser(
      id: id,
      email: email,
      displayName: displayName,
      photoUrl: photoUrl,
      signInMethod: SignInMethod.google,
      linkedProviders: [SignInMethod.google],
      rustoreTokens: rustoreTokens,
      idLinkedProvider: googleId,
      emailVerified: true,
      createdAt: DateTime.now(),
      lastLoginAt: DateTime.now(),
    );
  }

  factory TMUser.fromGitHubSignIn({
    required String id,
    required String email,
    String? githubId,
    String? displayName,
    String? photoUrl,
    List<String>? deviceIds,
  }) {
    return TMUser(
      id: id,
      email: email,
      idLinkedProvider: githubId,
      displayName: displayName,
      rustoreTokens: deviceIds,
      photoUrl: photoUrl,
      signInMethod: SignInMethod.github,
      linkedProviders: [SignInMethod.github],
      emailVerified: true,
      createdAt: DateTime.now(),
      lastLoginAt: DateTime.now(),
    );
  }

  factory TMUser.fromVkSignIn({
    required String id,
    required String email,
    required String lastName,
    required String firstName,
    String? vkId,
    List<String>? deviceIds,
    String? photoUrl,
  }) {
    return TMUser(
      id: id,
      email: email,
      displayName: '$firstName $lastName',
      idLinkedProvider: vkId,
      photoUrl: photoUrl,
      signInMethod: SignInMethod.vk,
      linkedProviders: [SignInMethod.vk],
      emailVerified: true,
      rustoreTokens: deviceIds,
      createdAt: DateTime.now(),
      lastLoginAt: DateTime.now(),
    );
  }

  factory TMUser.fromEmailPassword({
    required String id,
    required String email,
    String? displayName,
    bool emailVerified = false,
    List<String>? deviceIds,
  }) {
    return TMUser(
      id: id,
      email: email,
      displayName: displayName,
      signInMethod: SignInMethod.emailPassword,
      linkedProviders: [SignInMethod.emailPassword],
      emailVerified: emailVerified,
      rustoreTokens: deviceIds,
      createdAt: DateTime.now(),
      lastLoginAt: DateTime.now(),
    );
  }

  TMUser withLinkedProvider(SignInMethod provider) {
    if (linkedProviders.contains(provider)) return this;
    return copyWith(linkedProviders: [...linkedProviders, provider]);
  }

  /// Проверка наличия провайдера
  bool hasProvider(SignInMethod provider) => linkedProviders.contains(provider);

  String get initials {
    if (displayName != null && displayName!.isNotEmpty) {
      final names = displayName!.trim().split(' ');
      if (names.length >= 2) {
        return '${names[0][0]}${names[1][0]}'.toUpperCase();
      }
      return displayName![0].toUpperCase();
    }
    return email[0].toUpperCase();
  }

  String get displayNameOrEmail => displayName ?? email;

  bool get isGoogleAccount => signInMethod == SignInMethod.google;

  bool get isGitHubAccount => signInMethod == SignInMethod.github;

  bool get isVkAccount => signInMethod == SignInMethod.vk;

  bool get isEmailPasswordAccount => signInMethod == SignInMethod.emailPassword;
}

@JsonEnum()
enum SignInMethod {
  @JsonValue('google')
  google,
  @JsonValue('email_password')
  emailPassword,
  @JsonValue('apple')
  apple,
  @JsonValue('facebook')
  facebook,
  @JsonValue('vk')
  vk,
  @JsonValue('github')
  github,
}
