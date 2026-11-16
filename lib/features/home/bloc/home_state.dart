part of 'home_bloc.dart';

@freezed
sealed class HomeState with _$HomeState {
  const HomeState._();

  const factory HomeState.idle({
    List<TMProject>? projects,
    List<TMTask>? tasks,
    List<String>? taskTypes,
  }) = _IdleHomeState;

  const factory HomeState.loading({
    List<TMProject>? projects,
    List<TMTask>? tasks,
    List<String>? taskTypes,
  }) = _LoadingHomeState;

  const factory HomeState.loadingProjects({
    List<TMProject>? projects,
    List<TMTask>? tasks,
    List<String>? taskTypes,
  }) = _LoadingProjectsHomeState;

  const factory HomeState.error({
    required String errorMessage,
    List<TMProject>? projects,
    List<TMTask>? tasks,
    List<String>? taskTypes,
  }) = _ErrorHomeState;

  bool get isError =>
      maybeWhen(error: (errorMessage, _, _, _) => true, orElse: () => false);

  bool get isLoading =>
      maybeWhen(loading: (_, _, _) => true, orElse: () => false);

  bool get isLoadingProjects =>
      maybeWhen(loadingProjects: (_, _, _) => true, orElse: () => false);
}
