part of 'home_bloc.dart';

@freezed
sealed class HomeSideEffect with _$HomeSideEffect {
  const HomeSideEffect._();

  const factory HomeSideEffect.taskAdded() = _TaskAddedHomeSideEffect;

  const factory HomeSideEffect.projectFetched() = _ProjectFetchedHomeSideEffect;

  const factory HomeSideEffect.tasksFetched() = _TasksFetchedHomeSideEffect;

  const factory HomeSideEffect.projectUsersFetched({
    required List<TMUser> projectUsers,
  }) = _ProjectUsersFetchedHomeSideEffect;

  const factory HomeSideEffect.projectUpdated() = _ProjectUpdatedHomeSideEffect;

  const factory HomeSideEffect.taskUpdated() = _TaskUpdatedHomeSideEffect;

  const factory HomeSideEffect.taskDeleted() = _TaskDeletedHomeSideEffect;
}
