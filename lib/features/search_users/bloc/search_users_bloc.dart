import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager/app/auth/model/user_model.dart';
import 'package:task_manager/features/project/repository/projects_repository.dart';

part 'search_users_event.dart';

part 'search_users_state.dart';

part 'search_users_bloc.freezed.dart';

class SearchUsersBloc extends Bloc<SearchUsersEvent, SearchUsersState> {
  SearchUsersBloc({required ProjectsRepository repository})
    : _repository = repository,
      super(const SearchUsersState.idle(users: [])) {
    on<SearchUsersEvent>(
      (event, emitter) => event.map(
        searchUsers: (event) => _searchUsers(emit: emitter, event: event),
      ),
    );
  }

  final ProjectsRepository _repository;

  Future<void> _searchUsers({
    required Emitter<SearchUsersState> emit,
    required _SearchUsersSearchUsersEvent event,
  }) async {
    try {
      emit(SearchUsersState.loading(users: state.users));
      final users = await _repository.fetchUsers(
        searchQuery: event.searchQuery,
        limit: event.limit,
      );
      emit(SearchUsersState.idle(users: users));
    } on Object catch (error) {
      emit(
        SearchUsersState.error(
          errorMessage: error.toString(),
          users: [],
        ),
      );
    }
  }
}
