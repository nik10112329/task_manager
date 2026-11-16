part of 'project_bloc.dart';

@freezed
sealed class ProjectState with _$ProjectState {
  const ProjectState._();

  const factory ProjectState.idle({
    required TMProject project,
    List<TMTask>? tasks,
    List<TMTask>? filteredTasks,
    List<TMUser>? users,
    List<TMTaskTag>? tags,
    List<String>? taskTypes,
  }) = _IdleProjectsState;

  const factory ProjectState.loading({
    required TMProject project,
    List<TMTask>? tasks,
    List<TMTask>? filteredTasks,
    List<TMUser>? users,
    List<TMTaskTag>? tags,
    List<String>? taskTypes,
  }) = _LoadingProjectsState;

  const factory ProjectState.loadingProjects({
    required TMProject project,
    List<TMTask>? tasks,
    List<TMTask>? filteredTasks,
    List<TMUser>? users,
    List<TMTaskTag>? tags,
    List<String>? taskTypes,
  }) = _LoadingProjectsProjectsState;

  const factory ProjectState.error({
    required String errorMessage,
    required TMProject project,
    List<TMTask>? tasks,
    List<TMTask>? filteredTasks,
    List<TMUser>? users,
    List<TMTaskTag>? tags,
    List<String>? taskTypes,
  }) = _ErrorProjectsState;

  bool get isError => maybeWhen(
    error: (errorMessage, _, _, _, _, _, _) => true,
    orElse: () => false,
  );

  bool get isLoading =>
      maybeWhen(loading: (_, _, _, _, _, _) => true, orElse: () => false);

  bool get isLoadingProjects => maybeWhen(
    loadingProjects: (_, _, _, _, _, _) => true,
    orElse: () => false,
  );
}
