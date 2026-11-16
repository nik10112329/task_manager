part of 'project_bloc.dart';

@freezed
sealed class ProjectSideEffect with _$ProjectSideEffect {
  const ProjectSideEffect._();

  const factory ProjectSideEffect.taskAdded() = _TaskAddedProjectSideEffect;

  const factory ProjectSideEffect.projectFetched() =
      _ProjectFetchedProjectSideEffect;

  const factory ProjectSideEffect.tasksFetched() =
      _TasksFetchedProjectSideEffect;

  const factory ProjectSideEffect.projectUsersFetched({
    required List<TMUser> projectUsers,
  }) = _ProjectUsersFetchedProjectSideEffect;

  const factory ProjectSideEffect.projectUpdated() =
      _ProjectUpdatedProjectSideEffect;

  const factory ProjectSideEffect.taskUpdated() = _TaskUpdatedProjectSideEffect;

  const factory ProjectSideEffect.taskDeleted() = _TaskDeletedProjectSideEffect;

  const factory ProjectSideEffect.tagAdded() = _TagAddedProjectSideEffect;
}
