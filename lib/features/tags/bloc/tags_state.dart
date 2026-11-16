part of 'tags_bloc.dart';

@freezed
sealed class TagsState with _$TagsState {
  const TagsState._();

  const factory TagsState.idle({
    required List<TMTaskTag> tags,
  }) = _IdleTagsState;

  const factory TagsState.loading({
    required List<TMTaskTag> tags,
  }) = _LoadingTagsState;


  const factory TagsState.error({
    required String errorMessage,
    required List<TMTaskTag> tags,
  }) = _ErrorTagsState;

  bool get isError => maybeWhen(
    error: (errorMessage, _) => true,
    orElse: () => false,
  );

  bool get isLoading =>
      maybeWhen(loading: (_) => true, orElse: () => false);

}
