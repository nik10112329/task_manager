import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager/app/auth/model/user_model.dart';
import 'package:task_manager/features/home/models/task/task.dart';
import 'package:task_manager/features/home/repository/home_repository.dart';
import 'package:task_manager/features/project/models/project/project.dart';

part 'home_bloc.freezed.dart';

part 'home_event.dart';

part 'home_state.dart';

part 'home_side_effect.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>
    with BlocSideEffectMixin<HomeEvent, HomeState, HomeSideEffect> {
  HomeBloc({required HomeRepository repository})
    : _repository = repository,
      super(const HomeState.loading()) {
    on<HomeEvent>(
      (event, emitter) => event.map(
        initialize: (event) => _initialize(emit: emitter, event: event),
        addProject: (event) => _addProject(emit: emitter, event: event),
        fetchTasks: (event) => _fetchTasks(emit: emitter, event: event),
        fetchUsersFromProjects: (event) =>
            _fetchUsersFromProject(emit: emitter, event: event),
        updateProject: (event) => _updateProject(emit: emitter, event: event),
      ),
    );
  }

  final HomeRepository _repository;

  Future<void> _initialize({
    required Emitter<HomeState> emit,
    required _InitializeHomeEvent event,
  }) async {
    try {
      emit(const HomeState.loadingProjects());
      late final List<TMProject> projects;
      if (event.userId != null) {
        projects =
            (await _repository.fetchUserProjects(userId: event.userId!)) ?? [];
      } else {
        projects = [];
      }
      emit(HomeState.idle(projects: projects, tasks: state.tasks));
      emitSideEffect(const HomeSideEffect.projectFetched());
    } on Object catch (error) {
      emit(
        HomeState.error(
          errorMessage: error.toString(),
          projects: state.projects,
        ),
      );
    }
  }

  Future<void> _addProject({
    required Emitter<HomeState> emit,
    required _AddProjectHomeEvent event,
  }) async {
    try {
      emit(HomeState.loading(projects: state.projects, tasks: state.tasks));
      await _repository.addProject(project: event.project);
      final newProjectList = await _repository.fetchUserProjects(
        userId: event.project.creatorId ?? '',
      );
      emit(HomeState.idle(projects: newProjectList, tasks: state.tasks));
      emitSideEffect(const HomeSideEffect.projectFetched());
    } on Object catch (error) {
      emit(
        HomeState.error(
          projects: state.projects,
          taskTypes: state.taskTypes,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> _fetchTasks({
    required Emitter<HomeState> emit,
    required _FetchTasksHomeEvent event,
  }) async {
    emit(HomeState.loading(projects: state.projects, tasks: state.tasks));
    await _loadTasks(emit: emit, projectIds: event.projectsIds);
  }

  Future<void> _loadTasks({
    required Emitter<HomeState> emit,
    required List<String> projectIds,
  }) async {
    emit(HomeState.loading(projects: state.projects, tasks: state.tasks));

    try {
      final tasks = await _repository.fetchTasks(projectIds);

      emit(HomeState.idle(projects: state.projects, tasks: tasks));
      emitSideEffect(const HomeSideEffect.tasksFetched());
    } catch (e) {
      emit(
        HomeState.error(
          errorMessage: e.toString(),
          projects: state.projects,
          tasks: state.tasks,
        ),
      );
    }
  }

  Future<void> _fetchUsersFromProject({
    required Emitter<HomeState> emit,
    required _FetchUsersFromProjectsHomeEvent event,
  }) async {
    emit(HomeState.loading(projects: state.projects, tasks: state.tasks));
    final project = state.projects?.firstWhere(
      (project) => project.id == event.projectId,
    );
    if (project != null) {
      final List<String> usersIds = [
        ...project.participants,
        project.ownerId ?? '',
      ];
      final users = await _repository.fetchUsersByIds(usersIds: usersIds);
      emit(HomeState.idle(projects: state.projects, tasks: state.tasks));
      emitSideEffect(
        HomeSideEffect.projectUsersFetched(projectUsers: users ?? []),
      );
    } else {
      emit(
        HomeState.error(
          errorMessage: 'Project is empty',
          projects: state.projects,
          tasks: state.tasks,
        ),
      );
    }
  }

  Future<void> _updateProject({
    required Emitter<HomeState> emit,
    required _UpdateProjectHomeEvent event,
  }) async {
    try {
      emit(HomeState.loading(projects: state.projects, tasks: state.tasks));
      await _repository.updateProject(event.project);
      final updatedProjects = state.projects?.map((p) {
        return p.id == event.project.id ? event.project : p;
      }).toList();
      emit(HomeState.idle(projects: updatedProjects, tasks: state.tasks));
      emitSideEffect(const HomeSideEffect.projectUpdated());
    } on Object catch (error, _) {
      emit(
        HomeState.error(
          errorMessage: error.toString(),
          projects: state.projects,
        ),
      );
    }
  }
}
