part of 'search_users_bloc.dart';

@freezed
sealed class SearchUsersState with _$SearchUsersState {
  const SearchUsersState._();

  const factory SearchUsersState.idle({
    required List<TMUser> users,
  }) = _IdleSearchUsersState;

  const factory SearchUsersState.loading({
    required List<TMUser> users,
  }) = _LoadingSearchUsersState;


  const factory SearchUsersState.error({
    required String errorMessage,
    required List<TMUser> users,
  }) = _ErrorSearchUsersState;

  bool get isError => maybeWhen(
    error: (errorMessage, _) => true,
    orElse: () => false,
  );

  bool get isLoading =>
      maybeWhen(loading: (_) => true, orElse: () => false);

}
