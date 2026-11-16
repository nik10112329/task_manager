part of 'project_bloc.dart';

@freezed
sealed class ProjectEvent with _$ProjectEvent {
  const ProjectEvent._();

  const factory ProjectEvent.initialize(TMProject project) =
      _InitializeProjectEvent;

  const factory ProjectEvent.addTask({
    required String projectId,
    required TMTask task,
  }) = _AddTaskProjectEvent;

  const factory ProjectEvent.fetchTasks() = _FetchTasksProjectEvent;

  const factory ProjectEvent.fetchUsers() = _FetchUsersProjectEvent;

  const factory ProjectEvent.updateProject({required TMProject project}) =
      _UpdateProjectProjectEvent;

  const factory ProjectEvent.deleteTask({required TMTask task}) =
      _DeleteTaskProjectEvent;

  const factory ProjectEvent.updateTask({required TMTask task}) =
      _UpdateTaskProjectEvent;

  // const factory ProjectEvent.fetchTagsFromTask({required String taskId}) =
  //     _FetchTagsFromTaskProjectEvent;
  //
  const factory ProjectEvent.addTag({required TMTaskTag tag}) =
      _AddTagProjectEvent;

  const factory ProjectEvent.fetchTags({required List<String> tagsIds}) =
      _FetchTagsProjectEvent;

  const factory ProjectEvent.filterTasks({
    required List<TMUser> users,
    required List<TMTaskTag> tags,
    required List<TaskStatus> statuses,
    DateTime? deadline,
  }) = _FilterTasksProjectEvent;
}
