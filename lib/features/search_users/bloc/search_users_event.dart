part of 'search_users_bloc.dart';

@freezed
sealed class SearchUsersEvent with _$SearchUsersEvent {
  const SearchUsersEvent._();

  const factory SearchUsersEvent.searchUsers({
    required String searchQuery,
    required int limit,
  }) = _SearchUsersSearchUsersEvent;
}
