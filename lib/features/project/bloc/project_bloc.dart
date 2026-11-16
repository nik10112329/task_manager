import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager/app/auth/model/user_model.dart';
import 'package:task_manager/features/home/models/task/task.dart';
import 'package:task_manager/features/home/models/task_status/task_status.dart';
import 'package:task_manager/features/project/models/project/project.dart';
import 'package:task_manager/features/project/repository/projects_repository.dart';
import 'package:task_manager/features/tags/models/tag/tag.dart';

part 'project_bloc.freezed.dart';

part 'project_event.dart';

part 'project_side_effect.dart';

part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState>
    with BlocSideEffectMixin<ProjectEvent, ProjectState, ProjectSideEffect> {
  ProjectBloc({required ProjectsRepository repository})
    : _repository = repository,
      super(
        const ProjectState.loading(
          project: TMProject(id: '', name: ''),
        ),
      ) {
    on<ProjectEvent>(
      (event, emitter) => event.map(
        initialize: (event) => {
          emitter(
            ProjectState.idle(
              project: event.project,
              tasks: state.tasks,
              tags: state.tags,
              users: state.users,
            ),
          ),
        },
        addTask: (event) => _addTask(emit: emitter, event: event),
        fetchTasks: (event) => _fetchTasks(emit: emitter, event: event),
        fetchUsers: (event) => _fetchUsers(emit: emitter, event: event),
        updateProject: (event) => _updateProject(emit: emitter, event: event),
        updateTask: (event) => _updateTask(emit: emitter, event: event),
        deleteTask: (event) => _deleteTask(emit: emitter, event: event),
        addTag: (event) => _addTag(emit: emitter, event: event),
        fetchTags: (event) => _fetchTags(emit: emitter, event: event),
        filterTasks: (event) => _filterTasks(emit: emitter, event: event),
      ),
    );
  }

  final ProjectsRepository _repository;

  Future<void> _addTask({
    required Emitter<ProjectState> emit,
    required _AddTaskProjectEvent event,
  }) async {
    emit(
      ProjectState.loading(
        project: state.project,
        tasks: state.tasks,
        tags: state.tags,
        users: state.users,
      ),
    );
    final newTaskId = await _repository.addTask(
      projectId: event.projectId,
      task: event.task,
    );
    await _loadTasks(emit: emit, projectIds: [state.project.id]);
    if (newTaskId != null) {
      emitSideEffect(const ProjectSideEffect.taskAdded());
    } else {
      emit(
        ProjectState.error(
          errorMessage: 'Task not added',
          project: state.project,
          tasks: state.tasks,
          users: state.users,
          taskTypes: state.taskTypes,
          tags: state.tags,
        ),
      );
    }
  }

  Future<void> _fetchTasks({
    required Emitter<ProjectState> emit,
    required _FetchTasksProjectEvent event,
  }) async {
    emit(
      ProjectState.loading(
        project: state.project,
        users: state.users,
        tasks: state.tasks,
        tags: state.tags,
      ),
    );
    await _loadTasks(emit: emit, projectIds: [state.project.id]);
    emitSideEffect(const ProjectSideEffect.tasksFetched());
  }

  Future<void> _loadTasks({
    required Emitter<ProjectState> emit,
    required List<String> projectIds,
  }) async {
    emit(
      ProjectState.loading(
        project: state.project,
        users: state.users,
        tasks: state.tasks,
        tags: state.tags,
      ),
    );

    try {
      final tasks = await _repository.fetchTasks(projectIds);
      emit(
        ProjectState.idle(
          project: state.project,
          tasks: tasks,
          users: state.users,
          tags: state.tags,
        ),
      );
      emitSideEffect(const ProjectSideEffect.tasksFetched());
    } catch (e) {
      emit(
        ProjectState.error(
          errorMessage: e.toString(),
          project: state.project,
          tasks: state.tasks,
          tags: state.tags,
        ),
      );
    }
  }

  Future<void> _fetchUsers({
    required Emitter<ProjectState> emit,
    required _FetchUsersProjectEvent event,
  }) async {
    emit(
      ProjectState.loading(
        project: state.project,
        users: state.users,
        tasks: state.tasks,
        tags: state.tags,
      ),
    );
    final project = state.project;
    final List<String> usersIds = [
      ...project.participants,
      project.ownerId ?? '',
    ];
    final users = await _repository.fetchUsersByIds(usersIds: usersIds);
    emit(
      ProjectState.idle(
        project: state.project,
        tasks: state.tasks,
        users: users,
        tags: state.tags,
      ),
    );
    emitSideEffect(
      ProjectSideEffect.projectUsersFetched(projectUsers: users ?? []),
    );
  }

  Future<void> _updateProject({
    required Emitter<ProjectState> emit,
    required _UpdateProjectProjectEvent event,
  }) async {
    try {
      emit(
        ProjectState.loading(
          project: state.project,
          users: state.users,
          tasks: state.tasks,
          tags: state.tags,
        ),
      );
      await _repository.updateProject(event.project);
      final updatedProjects = state.project;
      emit(
        ProjectState.idle(
          project: updatedProjects,
          tasks: state.tasks,
          users: state.users,
          tags: state.tags,
        ),
      );
      emitSideEffect(const ProjectSideEffect.projectUpdated());
    } on Object catch (error, _) {
      emit(
        ProjectState.error(
          errorMessage: error.toString(),
          project: state.project,
          tasks: state.tasks,
          tags: state.tags,
        ),
      );
    }
  }

  Future<void> _deleteTask({
    required Emitter<ProjectState> emit,
    required _DeleteTaskProjectEvent event,
  }) async {
    emit(
      ProjectState.loading(
        tasks: state.tasks,
        project: state.project,
        users: state.users,
        tags: state.tags,
      ),
    );
    await _repository.deleteTask(
      projectId: event.task.projectId,
      taskId: event.task.id,
    );
    await _loadTasks(emit: emit, projectIds: [state.project.id]);
    emitSideEffect(const ProjectSideEffect.taskDeleted());
  }

  Future<void> _updateTask({
    required Emitter<ProjectState> emit,
    required _UpdateTaskProjectEvent event,
  }) async {
    emit(
      ProjectState.loading(
        tasks: state.tasks,
        project: state.project,
        users: state.users,
        tags: state.tags,
      ),
    );
    await _repository.updateTask(
      projectId: event.task.projectId,
      task: event.task,
    );
    await _loadTasks(emit: emit, projectIds: [state.project.id]);
    emitSideEffect(const ProjectSideEffect.taskUpdated());
  }

  Future<void> _addTag({
    required Emitter<ProjectState> emit,
    required _AddTagProjectEvent event,
  }) async {
    emit(
      ProjectState.loading(
        project: state.project,
        tasks: state.tasks,
        users: state.users,
        tags: state.tags,
      ),
    );
    final tagId = await _repository.addTag(
      tag: event.tag,
      projectId: state.project.id,
    );
    if (tagId != null) {
      final updateProject = state.project.copyWith(
        tagsIds: [...state.project.tagsIds, tagId],
      );
      emit(
        ProjectState.idle(
          project: updateProject,
          tasks: state.tasks,
          users: state.users,
          tags: state.tags,
        ),
      );
      emitSideEffect(const ProjectSideEffect.tagAdded());
    } else {
      emit(
        ProjectState.error(
          errorMessage: 'Error add tag',
          project: state.project,
          tags: state.tags,
        ),
      );
    }
  }

  Future<void> _fetchTags({
    required Emitter<ProjectState> emit,
    required _FetchTagsProjectEvent event,
  }) async {
    emit(
      ProjectState.loading(
        project: state.project,
        users: state.users,
        tasks: state.tasks,
        tags: state.tags,
      ),
    );
    final tags = await _repository.fetchTagsFromProject(event.tagsIds);
    emit(
      ProjectState.idle(
        tags: tags,
        users: state.users,
        tasks: state.tasks,
        project: state.project,
      ),
    );
  }

  // Future<void> _filterTasks({
  //   required Emitter<ProjectState> emit,
  //   required _FilterTasksProjectEvent event,
  // }) async {
  //   emit(
  //     ProjectState.loading(
  //       project: state.project,
  //       tags: state.tags,
  //       tasks: state.tasks,
  //       users: state.users,
  //       filteredTasks: state.filteredTasks,
  //     ),
  //   );
  //
  //   if (event.tags.isEmpty &&
  //       event.users.isEmpty &&
  //       event.deadline == null &&
  //       event.statuses.isEmpty) {
  //     emit(
  //       ProjectState.idle(
  //         project: state.project,
  //         tags: state.tags,
  //         tasks: state.tasks,
  //         users: state.users,
  //       ),
  //     );
  //     return;
  //   }
  //
  //   final now = DateTime.now();
  //   final todayStart = DateTime(now.year, now.month, now.day);
  //
  //   final filteredTasks = state.tasks?.where((task) {
  //     if (event.statuses.isNotEmpty) {
  //       if (!event.statuses.contains(task.status)) {
  //         return false;
  //       }
  //     }
  //     bool matchesAnyFilter = false;
  //     if (event.tags.isNotEmpty) {
  //       final hasTag = task.tagsIds.any(
  //         (taskTagId) =>
  //             event.tags.any((filterTag) => filterTag.id == taskTagId),
  //       );
  //
  //       if (hasTag) matchesAnyFilter = true;
  //     }
  //     if (event.users.isNotEmpty) {
  //       final hasUser = task.responsibleIds.any(
  //         (responsibleId) =>
  //             event.users.any((user) => user.id == responsibleId),
  //       );
  //
  //       if (hasUser) matchesAnyFilter = true;
  //     }
  //     if (event.deadline != null) {
  //       if (task.endDate != null) {
  //         final taskDate = DateTime(
  //           task.endDate!.year,
  //           task.endDate!.month,
  //           task.endDate!.day,
  //         );
  //
  //         final isNotOverdue = !taskDate.isBefore(todayStart); // не просрочена
  //         final isBeforeOrEqualDeadline = !taskDate.isAfter(event.deadline!);
  //
  //         if (isNotOverdue && isBeforeOrEqualDeadline) {
  //           matchesAnyFilter = true;
  //         }
  //       }
  //     }
  //     if (event.statuses.isEmpty) {
  //       return matchesAnyFilter;
  //     }
  //     return matchesAnyFilter;
  //   }).toList();
  //
  //   emit(
  //     ProjectState.idle(
  //       project: state.project,
  //       tags: state.tags,
  //       tasks: state.tasks,
  //       users: state.users,
  //       filteredTasks: filteredTasks,
  //     ),
  //   );
  // }
  // Future<void> _filterTasks({
  //   required Emitter<ProjectState> emit,
  //   required _FilterTasksProjectEvent event,
  // }) async {
  //   emit(
  //     ProjectState.loading(
  //       project: state.project,
  //       tags: state.tags,
  //       tasks: state.tasks,
  //       users: state.users,
  //       filteredTasks: state.filteredTasks,
  //     ),
  //   );
  //
  //   // Нет фильтров — показываем всё
  //   if (event.tags.isEmpty &&
  //       event.users.isEmpty &&
  //       event.deadline == null &&
  //       event.statuses.isEmpty) {
  //     emit(
  //       ProjectState.idle(
  //         project: state.project,
  //         tags: state.tags,
  //         tasks: state.tasks,
  //         users: state.users,
  //       ),
  //     );
  //     return;
  //   }
  //
  //   final now = DateTime.now();
  //   final todayStart = DateTime(now.year, now.month, now.day);
  //
  //   final filteredTasks = state.tasks?.where((task) {
  //     if (event.statuses.isNotEmpty) {
  //       if (!event.statuses.contains(task.status)) {
  //         return false;
  //       }
  //     }
  //
  //     if (event.tags.isNotEmpty) {
  //       final hasTag = task.tagsIds.any(
  //         (taskTagId) =>
  //             event.tags.any((filterTag) => filterTag.id == taskTagId),
  //       );
  //       if (!hasTag) return false;
  //     }
  //
  //     if (event.users.isNotEmpty) {
  //       final hasUser = task.responsibleIds.any(
  //         (responsibleId) =>
  //             event.users.any((user) => user.id == responsibleId),
  //       );
  //       if (!hasUser) return false;
  //     }
  //
  //     if (event.deadline != null) {
  //       if (task.endDate == null) return false;
  //
  //       final taskDate = DateTime(
  //         task.endDate!.year,
  //         task.endDate!.month,
  //         task.endDate!.day,
  //       );
  //
  //       final isNotOverdue = !taskDate.isBefore(todayStart);
  //       final isBeforeOrEqual = !taskDate.isAfter(event.deadline!);
  //
  //       if (!(isNotOverdue && isBeforeOrEqual)) {
  //         return false;
  //       }
  //     }
  //
  //     return true;
  //   }).toList();
  //
  //   emit(
  //     ProjectState.idle(
  //       project: state.project,
  //       tags: state.tags,
  //       tasks: state.tasks,
  //       users: state.users,
  //       filteredTasks: filteredTasks,
  //     ),
  //   );
  // }
  Future<void> _filterTasks({
    required Emitter<ProjectState> emit,
    required _FilterTasksProjectEvent event,
  }) async {
    emit(
      ProjectState.loading(
        project: state.project,
        tags: state.tags,
        tasks: state.tasks,
        users: state.users,
        filteredTasks: state.filteredTasks,
      ),
    );

    if (event.tags.isEmpty &&
        event.users.isEmpty &&
        event.deadline == null &&
        event.statuses.isEmpty) {
      emit(
        ProjectState.idle(
          project: state.project,
          tags: state.tags,
          tasks: state.tasks,
          users: state.users,
        ),
      );
      return;
    }

    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);

    final filteredTasks = state.tasks?.where((task) {
      if (event.statuses.isNotEmpty) {
        if (!event.statuses.contains(task.status)) {
          return false;
        }
      }
      if (event.users.isNotEmpty) {
        final hasUser = task.responsibleIds.any(
          (responsibleId) =>
              event.users.any((user) => user.id == responsibleId),
        );
        if (!hasUser) return false;
      }

      if (event.tags.isNotEmpty) {
        final hasTag = task.tagsIds.any(
          (taskTagId) =>
              event.tags.any((filterTag) => filterTag.id == taskTagId),
        );
        if (!hasTag) return false;
      }

      if (event.deadline != null) {
        if (task.endDate == null) return false;

        final taskDate = DateTime(
          task.endDate!.year,
          task.endDate!.month,
          task.endDate!.day,
        );

        final isNotOverdue = !taskDate.isBefore(todayStart);
        final isBeforeOrEqual = !taskDate.isAfter(event.deadline!);

        if (!(isNotOverdue && isBeforeOrEqual)) {
          return false;
        }
      }

      return true;
    }).toList();
    emitSideEffect(const ProjectSideEffect.taskUpdated());
    emit(
      ProjectState.idle(
        project: state.project,
        tags: state.tags,
        tasks: state.tasks,
        users: state.users,
        filteredTasks: filteredTasks,
      ),
    );
  }
}
