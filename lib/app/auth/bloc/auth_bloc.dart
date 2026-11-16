import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in_platform_interface/google_sign_in_platform_interface.dart';
import 'package:task_manager/app/auth/model/user_model.dart';
import 'package:task_manager/app/auth/repository/auth_repository.dart';

part 'auth_bloc.freezed.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required AuthRepository repository})
    : _repository = repository,
      super(const AuthState.initial()) {
    on<AuthEvent>(
      (event, emitter) => event.map(
        check: (event) => _onCheck(event, emitter),
        initialize: (event) => _initialize(event, emitter),
        signIn: (event) => _onSignIn(event, emitter),
        signInWithGoogle: (event) => _onSignInGoogle(event, emitter),
        signInWithGitHubOauth: (event) => _onSignInGithubOauth(event, emitter),
        signInWithVk: (event) => _onSignInWithVk(event, emitter),
        signOut: (event) => _onSignOut(event, emitter),
      ),
    );

    add(const AuthEvent.check());
  }

  final AuthRepository _repository;

  Future<void> _onCheck(_CheckAuthEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final user = await _repository.restoreSession();

    debugPrint('RESTORE USER = $user');
    if (user != null) {
      emit(AuthState.authed(user: user));
    } else {
      emit(const AuthState.notAuthed());
    }
  }

  Future<void> _initialize(
    _InitializeAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await _repository.ensureInitialized();
    } catch (e) {
      emit(AuthState.error(errorMessage: 'Initialization failed: $e'));
    }
  }

  Future<void> _onSignInGoogle(
    _SignInGoogleAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    try {
      final user = await _repository.signIn();
      emit(AuthState.authed(user: user));
    } catch (e) {
      emit(AuthState.error(errorMessage: 'Sign in failed: $e'));
    }
  }

  Future<void> _onSignIn(
    _SignInAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    try {
      // final googleUser = await _repository.signIn();
      // final user = TMUser.fromGoogleSignIn(
      //   id: googleUser.id,
      //   email: googleUser.email,
      //   displayName: googleUser.displayName,
      //   photoUrl: googleUser.photoUrl,
      // );
      // emit(AuthState.authed(user: user));
    } catch (e) {
      emit(AuthState.error(errorMessage: 'Sign in failed: $e'));
    }
  }

  Future<void> _onSignInGithubOauth(
    _SignInGithubOauthAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    try {
      final user = await _repository.signInOauthWithGithub();
      emit(AuthState.authed(user: user));
    } catch (e) {
      emit(AuthState.error(errorMessage: 'Sign in failed: $e'));
    }
  }

  Future<void> _onSignOut(
    _SignOutAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await _repository.signOut();
      emit(const AuthState.notAuthed());
    } catch (e) {
      emit(AuthState.error(errorMessage: 'Sign out failed: $e'));
    }
  }

  Future<void> _onSignInWithVk(
    _SignInWithVkAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    try {
      final user = await _repository.signInWithVk();
      if (user != null) {
        emit(AuthState.authed(user: user));
      } else {
        emit(const AuthState.notAuthed());
      }
    } catch (e) {
      emit(AuthState.error(errorMessage: 'VK sign in failed: $e'));
    }
  }

  Future<GoogleSignInUserData?> signInSilentlyNoUI() async {
    try {
      final result = await GoogleSignInPlatform.instance
          .attemptLightweightAuthentication(
            const AttemptLightweightAuthenticationParameters(),
          );
      return result?.user;
    } catch (e) {
      return null;
    }
  }
}
