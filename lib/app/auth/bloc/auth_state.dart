part of 'auth_bloc.dart';

@freezed
sealed class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState.initial({TMUser? user}) = _AuthInitialState;

  const factory AuthState.loading({TMUser? user}) = _AuthLoadingState;

  const factory AuthState.authed({TMUser? user}) = _AuthAuthedState;

  const factory AuthState.notAuthed({TMUser? user}) =
      _AuthNotAuthedState;

  const factory AuthState.error({TMUser? user, String? errorMessage}) =
      _AuthErrorState;

  bool get isLoading => maybeWhen(loading: (_) => true, orElse: () => false);

  bool get isError =>
      maybeWhen(error: (errorMessage, _) => true, orElse: () => false);

  bool get isAuth => maybeWhen(authed: (_) => true, orElse: () => false);

  bool get notAuth => maybeWhen(notAuthed: (_) => true, orElse: () => false);
}
