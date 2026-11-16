import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:task_manager/app/auth/model/user_model.dart';
import 'package:task_manager/app/extensions/context.dart';
import 'package:task_manager/app/extensions/date_time.dart';
import 'package:task_manager/app/localization/generated/l10n.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/app/widgets/wrappers/shadow_scroll_wrapper.dart';
import 'package:task_manager/features/home/models/task/task.dart';
import 'package:task_manager/features/project/bloc/project_bloc.dart';
import 'package:task_manager/features/project/models/project/project.dart';

@RoutePage()
class TMTasksArchiveScreen extends StatefulWidget {
  const TMTasksArchiveScreen({required this.project, super.key});

  final TMProject project;

  @override
  State<TMTasksArchiveScreen> createState() => _TMTasksArchiveScreenState();
}

class _TMTasksArchiveScreenState extends State<TMTasksArchiveScreen> {
  late final ProjectBloc _projectBloc = ProjectBloc(
    repository: context.dependencies.projectsRepository,
  );
  late final ScrollController _scrollController;
  final List<TMTask> tasks = [];
  final Map<String, List<TMUser>> _participants = {};
  final Map<String, List<TMTask>> monthToTasks = {};

  @override
  void initState() {
    _projectBloc
      ..add(ProjectEvent.initialize(widget.project))
      ..add(const ProjectEvent.fetchTasks())
      ..add(ProjectEvent.fetchTags(tagsIds: widget.project.tagsIds))
      ..add(const ProjectEvent.fetchUsers());
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colors.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Архив проекта "${widget.project.name}"',
              style: context.styles.h1.copyWith(fontSize: 24),
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(height: 20),
          BlocBuilderWithSideEffects<
            ProjectBloc,
            ProjectState,
            ProjectSideEffect
          >(
            buildWhen: (previous, current) =>
                previous.tasks != current.tasks ||
                previous.users != current.users,
            bloc: _projectBloc,
            sideEffectsListener: (context, sideEffect) {
              sideEffect.mapOrNull(
                projectFetched: (sideEffect) {
                  _projectBloc.add(const ProjectEvent.fetchTasks());
                },
              );
            },
            builder: (context, state) {
              tasks
                ..clear()
                ..addAll(state.tasks?.where((task) => task.archived) ?? []);
              if (state.users != null) {
                for (final task in tasks) {
                  _participants[task.id] = state.users!
                      .where((user) => task.responsibleIds.contains(user.id))
                      .toList();
                }
              }
              return Expanded(
                child: state.isLoading || state.isLoadingProjects
                    ? const Center(child: CircularProgressIndicator())
                    : TMShadowScrollWrapper(
                        scrollController: _scrollController,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ListView.builder(
                            controller: _scrollController,
                            itemCount: tasks.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  width: MediaQuery.sizeOf(context).width,
                                  decoration: BoxDecoration(
                                    color: context.colors.secondary,
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                      color: context.colors.textColor,
                                    ),
                                    boxShadow: [context.colors.standardShadow],
                                  ),
                                  child: Dismissible(
                                    key: ValueKey(
                                      'restore_task ${tasks[index].name}',
                                    ),
                                    direction: DismissDirection.endToStart,
                                    background: AnimatedSize(
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: context.colors.primary,
                                          border: Border.all(
                                            color: context.colors.white,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            14,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              'Восстановить',
                                              style: context.styles.textStyle
                                                  .copyWith(
                                                    color: context.colors.white,
                                                  ),
                                            ),
                                            const SizedBox(width: 10),
                                            Icon(
                                              Icons.restore,
                                              color: context.colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    confirmDismiss: (direction) async {
                                      return showModalBottomSheet<bool>(
                                        context: context,
                                        builder: (context) {
                                          return SafeArea(
                                            child: Padding(
                                              padding: const EdgeInsets.all(20),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'Восстановить задачу?',
                                                    style: context.styles.h1
                                                        .copyWith(fontSize: 18),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: OutlinedButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                context,
                                                                false,
                                                              ),
                                                          child: Text(
                                                            S
                                                                .of(context)
                                                                .cancel,
                                                            style: context
                                                                .styles
                                                                .textStyle
                                                                .copyWith(
                                                                  color: context
                                                                      .colors
                                                                      .textColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 12),
                                                      Expanded(
                                                        child: ElevatedButton(
                                                          style:
                                                              ElevatedButton.styleFrom(
                                                                backgroundColor:
                                                                    context
                                                                        .colors
                                                                        .primary,
                                                              ),
                                                          onPressed: () {
                                                            _projectBloc.add(
                                                              ProjectEvent.updateTask(
                                                                task: tasks[index]
                                                                    .copyWith(
                                                                      archived:
                                                                          false,
                                                                      archivedAt:
                                                                          null,
                                                                    ),
                                                              ),
                                                            );
                                                            Navigator.pop(
                                                              context,
                                                              true,
                                                            );
                                                          },
                                                          child: Text(
                                                            'Восстановить',
                                                            style: context
                                                                .styles
                                                                .textStyle
                                                                .copyWith(
                                                                  color: context
                                                                      .colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 10,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            tasks[index].name,
                                            style: context.styles.textStyle
                                                .copyWith(
                                                  color:
                                                      context.colors.textColor,
                                                ),
                                          ),
                                          Text(
                                            'Тег',
                                            style: context.styles.textStyle
                                                .copyWith(
                                                  color:
                                                      context.colors.textColor,
                                                ),
                                          ),
                                          Text(
                                            'Исполнители:',
                                            style: context.styles.textStyle
                                                .copyWith(
                                                  color:
                                                      context.colors.textColor,
                                                ),
                                          ),
                                          if (_participants[tasks[index].id] !=
                                                  null &&
                                              _participants[tasks[index].id]!
                                                  .isNotEmpty)
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ...List.generate(
                                                  _participants[tasks[index]
                                                          .id]!
                                                      .length,
                                                  (usersIndex) {
                                                    final user =
                                                        _participants[tasks[index]
                                                            .id]![usersIndex];
                                                    return Text(
                                                      user.displayNameOrEmail,
                                                      style: context
                                                          .styles
                                                          .textStyle
                                                          .copyWith(
                                                            color: context
                                                                .colors
                                                                .textColor,
                                                          ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          if (tasks[index].archivedAt != null)
                                            Text(
                                              'Перенесена в архив: '
                                              '${tasks[index].archivedAt!.toRuDate}',
                                              style: context.styles.textStyle
                                                  .copyWith(
                                                    color: context
                                                        .colors
                                                        .textColor,
                                                  ),
                                            ),
                                          if (tasks[index].endDate != null)
                                            Text(
                                              'Завершена: ${tasks[index].endDate!.toRuDate}',
                                              style: context.styles.textStyle
                                                  .copyWith(
                                                    color: context
                                                        .colors
                                                        .textColor,
                                                  ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
