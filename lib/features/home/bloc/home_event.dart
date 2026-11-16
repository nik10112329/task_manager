part of 'home_bloc.dart';

@freezed
sealed class HomeEvent with _$HomeEvent {
  const HomeEvent._();

  const factory HomeEvent.initialize({String? userId}) = _InitializeHomeEvent;

  const factory HomeEvent.addProject({required TMProject project}) =
      _AddProjectHomeEvent;

  const factory HomeEvent.fetchTasks({required List<String> projectsIds}) =
      _FetchTasksHomeEvent;

  const factory HomeEvent.fetchUsersFromProjects({required String projectId}) =
      _FetchUsersFromProjectsHomeEvent;

  const factory HomeEvent.updateProject({required TMProject project}) =
      _UpdateProjectHomeEvent;
}
