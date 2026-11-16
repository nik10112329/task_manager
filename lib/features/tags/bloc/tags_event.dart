part of 'tags_bloc.dart';

@freezed
sealed class TagsEvent with _$TagsEvent {
  const TagsEvent._();

  const factory TagsEvent.fetchTags({required List<String> tagsIds}) =
      _FetchTagsTagsEvent;

  const factory TagsEvent.fetchTagsFromTask({required String taskId}) =
      _FetchTagsFromTaskTagsEvent;
}
