import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager/features/project/repository/projects_repository.dart';
import 'package:task_manager/features/tags/models/tag/tag.dart';

part 'tags_bloc.freezed.dart';
part 'tags_event.dart';
part 'tags_state.dart';

class TagsBloc extends Bloc<TagsEvent, TagsState> {
  TagsBloc({required ProjectsRepository repository})
    : _repository = repository,
      super(const TagsState.idle(tags: [])) {
    on<TagsEvent>(
      (event, emitter) => event.map(
        fetchTags: (event) => _fetchTags(emit: emitter, event: event),
        fetchTagsFromTask: (event) =>
            _fetchTagsFromTask(event: event, emit: emitter),
      ),
    );
  }

  final ProjectsRepository _repository;


  Future<void> _fetchTags({
    required Emitter<TagsState> emit,
    required _FetchTagsTagsEvent event,
  }) async {
    emit(TagsState.loading(tags: state.tags));
    final tags = await _repository.fetchTagsFromProject(event.tagsIds);
    emit(TagsState.idle(tags: tags ?? []));
  }

  Future<void> _fetchTagsFromTask({
    required Emitter<TagsState> emit,
    required _FetchTagsFromTaskTagsEvent event,
  }) async {
    emit(TagsState.loading(tags: state.tags));
    emit(TagsState.idle(tags: state.tags));
  }
}
