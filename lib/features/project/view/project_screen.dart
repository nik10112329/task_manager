import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:task_manager/app/auth/model/user_model.dart';
import 'package:task_manager/app/extensions/context.dart';
import 'package:task_manager/app/extensions/string.dart';
import 'package:task_manager/app/localization/generated/l10n.dart';
import 'package:task_manager/app/router/app_router.gr.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/app/widgets/buttons/add_button.dart';
import 'package:task_manager/app/widgets/ghost_swipe_hint.dart';
import 'package:task_manager/app/widgets/wrappers/clickable.dart';
import 'package:task_manager/features/home/models/task/task.dart';
import 'package:task_manager/features/home/models/task_status/task_status.dart';
import 'package:task_manager/features/notifications/bloc/notifications_bloc.dart';
import 'package:task_manager/features/project/bloc/project_bloc.dart';
import 'package:task_manager/features/project/models/project/project.dart';
import 'package:task_manager/features/project/repository/projects_repository_impl.dart';
import 'package:task_manager/features/project/utils/project_editing_utils.dart';
import 'package:task_manager/features/project/utils/tasks_utils.dart';
import 'package:task_manager/features/project/widgets/bottom_sheets/filter_bottom_sheets.dart';
import 'package:task_manager/features/project/widgets/bottom_sheets/sort_bottom_sheet.dart';
import 'package:task_manager/features/project/widgets/header.dart';
import 'package:task_manager/features/project/widgets/task_item.dart';
import 'package:task_manager/features/project/widgets/task_list_shimmer.dart';
import 'package:task_manager/features/search_users/utils/search_users_utils.dart';
import 'package:task_manager/features/tags/models/tag/tag.dart';

enum HintType { filter, sort }

@RoutePage()
class ProjectScreen extends StatefulWidget {
  const ProjectScreen({
    required this.project,
    required this.onChanged,
    super.key,
  });

  final TMProject project;
  final VoidCallback onChanged;

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  bool _showBackButton = false;
  bool isEditing = false;
  String? editingTaskId;
  final Map<String, TextEditingController> _taskControllers = {};
  late TextEditingController nameController;

  late final ProjectBloc projectBloc = ProjectBloc(
    repository: ProjectsRepositoryImpl(
      client: context.dependencies.firebaseClient,
    ),
  );

  late DateTime? _startDate;
  late DateTime? _endDate;

  final Map<String, String> _participants = {};
  final Map<String, String> _initialParticipants = {};

  late String _ownerId = widget.project.ownerId ?? '';
  String _ownerImage = '';
  bool isLoaded = false;
  late TMProject _initialProject = widget.project;
  int activeFiltersCount = 0;
  final List<TMUser> users = [];
  final List<TaskStatus> _filteredStatuses = [];
  final List<TMUser> _filteredUsers = [];
  final List<TMTaskTag> _filteredTags = [];
  DateTime? _filteredDeadline;
  HintType? _visibleHint;
  Timer? _hintTimer;
  SortType? _sortType;
  bool? _isAscOrder;

  TextEditingController _getController(String taskId) {
    return _taskControllers[taskId] ?? TextEditingController();
  }

  @override
  void initState() {
    nameController = TextEditingController(text: widget.project.name);
    nameController.addListener(_updateHasChanges);

    _startDate = widget.project.startDate;
    _endDate = widget.project.endDate;
    _ownerId = widget.project.ownerId ?? '';
    projectBloc
      ..add(ProjectEvent.initialize(widget.project))
      ..add(const ProjectEvent.fetchTasks())
      ..add(ProjectEvent.fetchTags(tagsIds: widget.project.tagsIds))
      ..add(const ProjectEvent.fetchUsers());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) setState(() => _showBackButton = true);
      });
    });
    super.initState();
  }

  void _updateHasChanges() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _hintTimer?.cancel();
    nameController
      ..removeListener(_updateHasChanges)
      ..dispose();
    for (final c in _taskControllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  void _saveChanges(TMProject project) {
    projectBloc.add(ProjectEvent.updateProject(project: project));
    _initialProject = project;
    setState(() => isEditing = false);
  }

  bool _hasChanges() {
    return nameController.text != _initialProject.name ||
        _startDate != _initialProject.startDate ||
        _endDate != _initialProject.endDate ||
        _ownerId != (_initialProject.ownerId ?? '') ||
        !_mapsEqual(_participants, _initialParticipants);
  }

  bool _mapsEqual(Map<String, String> a, Map<String, String> b) {
    if (a.length != b.length) return false;
    for (final key in a.keys) {
      if (a[key] != b[key]) return false;
    }
    return true;
  }

  void showHint(HintType hint) {
    _hintTimer?.cancel();

    setState(() {
      _visibleHint = hint;
    });

    _hintTimer = Timer(const Duration(seconds: 2), () {
      if (!mounted) return;

      setState(() {
        _visibleHint = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilderWithSideEffects<
      ProjectBloc,
      ProjectState,
      ProjectSideEffect
    >(
      buildWhen: (previous, current) =>
          previous.tasks != current.tasks ||
          previous.users != current.users ||
          previous.filteredTasks != current.filteredTasks,
      sideEffectsListener: (context, sideEffect) {
        sideEffect.mapOrNull(
          taskDeleted: (sideEffect) async {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!mounted) return;
              ScaffoldMessenger.of(context)
                ..clearSnackBars()
                ..showSnackBar(
                  SnackBar(
                    content: Text(S.of(context).task_deleted),
                    duration: const Duration(seconds: 1),
                  ),
                );
              widget.onChanged();
            });
          },
          taskAdded: (sideEffect) {
            projectBloc.add(const ProjectEvent.fetchUsers());
            widget.onChanged();
          },
          projectUsersFetched: (sideEffect) {
            users
              ..clear()
              ..addAll(sideEffect.projectUsers);
            _ownerImage =
                users.firstWhere((user) => user.id == _ownerId).photoUrl ?? '';

            for (final user in sideEffect.projectUsers) {
              _participants[user.id] = user.photoUrl ?? '';
            }
            _initialParticipants
              ..clear()
              ..addAll(_participants);
            isLoaded = true;
          },
          taskUpdated: (sideEffect) {
            debugPrint('TASK UPDATED');
            setState(() {});
          },
          projectUpdated: (sideEffect) async {
            if (!mounted) return;
            if (!context.mounted) return;
            context.dependencies.notificationsBloc.add(
              NotificationsEvent.pushRustoreNotification(
                description: 'Проект ${_initialProject.name} обновлен',
                title: S.of(context).project_updated,
              ),
            );
            if (!context.mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: context.colors.splashBackground.withValues(
                  alpha: 0.8,
                ),
                content: Text(
                  S.of(context).project_updated,
                  style: context.styles.textStyle,
                ),
              ),
            );
            widget.onChanged();
          },
        );
      },
      bloc: projectBloc,
      builder: (context, state) {
        List<TMTask> tasks = List.from(
          state.filteredTasks?.where((task) => !task.archived).toList() ??
              state.tasks?.where((task) => !task.archived).toList() ??
              [],
        );

        if (_sortType != null) {
          tasks = TasksUtils.sortTasks(
            tasks: tasks,
            type: _sortType,
            isAscOrder: _isAscOrder,
          );
        }
        return Scaffold(
          backgroundColor: context.colors.background,
          body: Stack(
            fit: StackFit.expand,
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.paddingOf(context).top,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ProjectHeader(
                          project: widget.project,
                          tasks: state.tasks ?? [],
                          isEditing: isEditing,
                          hasChanges: _hasChanges(),
                          nameController: nameController,
                          showBackButton: _showBackButton,
                          onBackTap: () {
                            if (!mounted) return;
                            context.pop();
                          },
                          onEditProject: () =>
                              setState(() => isEditing = !isEditing),
                          onChangeProject: () {
                            setState(() {
                              _saveChanges(
                                TMProject(
                                  id: widget.project.id,
                                  name: nameController.text,
                                  participants: _participants.keys.toList(),
                                  ownerId: _ownerId,
                                  startDate: _startDate,
                                  endDate: _endDate,
                                ),
                              );
                            });
                          },
                          onCloseEditTap: () {
                            setState(() {
                              nameController.text = _initialProject.name;
                              _endDate = _initialProject.endDate;
                              _startDate = _initialProject.startDate;
                              _ownerId = _initialProject.ownerId ?? '';
                              _participants
                                ..clear()
                                ..addAll(_initialParticipants);
                              _ownerImage =
                                  users
                                      .firstWhere(
                                        (user) =>
                                            user.id == _initialProject.ownerId,
                                      )
                                      .photoUrl ??
                                  '';
                              isEditing = false;
                            });
                          },
                          participants: _participants,
                          ownerImage: _ownerImage,
                          startDate: _startDate,
                          endDate: _endDate,
                          onSelectParticipants: () =>
                              SearchUsersUtils.selectParticipants(
                                context: context,
                                participants: _participants,
                                onChanged: (newParticipants) {
                                  setState(
                                    () => _participants
                                      ..clear()
                                      ..addAll(newParticipants),
                                  );
                                },
                              ),
                          onSelectOwner: () => SearchUsersUtils.selectOwner(
                            context: context,
                            onChanged: (newOwner) {
                              setState(() {
                                _ownerId = newOwner.keys.first;
                                _ownerImage = newOwner.values.first;
                              });
                            },
                            ownerId: _ownerId,
                            ownerImage: _ownerImage,
                          ),
                          onSelectStartDate: () =>
                              ProjectEditingUtils.pickUpDate(
                                context: context,
                                onChanged: (newDate) =>
                                    setState(() => _startDate = newDate),
                              ),
                          onSelectEndDate: () => ProjectEditingUtils.pickUpDate(
                            context: context,
                            onChanged: (newDate) =>
                                setState(() => _endDate = newDate),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: SizedBox(
                          height: 35,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Text(
                                  S.of(context).project_tasks,
                                  style: context.styles.h1.copyWith(
                                    fontSize: 20,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                bottom: 0,
                                child: Row(
                                  children: [
                                    if (!state.isLoading &&
                                        !state.isError &&
                                        state.users != null &&
                                        state.tasks != null &&
                                        state.tags != null)
                                      Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Clickable(
                                            onLongPress: () =>
                                                showHint(HintType.filter),
                                            onTap: () {
                                              showModalBottomSheet(
                                                isScrollControlled: true,
                                                context: context,
                                                backgroundColor: context
                                                    .colors
                                                    .lightBackground,
                                                builder: (context) {
                                                  return TMFilterBottomSheets(
                                                    tags: state.tags ?? [],
                                                    participants:
                                                        state.users ?? [],
                                                    selectedDeadline:
                                                        _filteredDeadline,
                                                    selectedStatuses:
                                                        _filteredStatuses,
                                                    selectedParticipants:
                                                        _filteredUsers,
                                                    selectedTags: _filteredTags,
                                                    onChanged:
                                                        ({
                                                          selectedTags,
                                                          selectedParticipants,
                                                          deadline,
                                                          statuses,
                                                        }) {
                                                          setState(() {
                                                            activeFiltersCount =
                                                                [
                                                                  selectedParticipants
                                                                          ?.length ??
                                                                      0,
                                                                  selectedTags
                                                                          ?.length ??
                                                                      0,
                                                                  deadline !=
                                                                          null
                                                                      ? 1
                                                                      : 0,
                                                                  statuses?.length ??
                                                                      0,
                                                                ].fold(
                                                                  0,
                                                                  (
                                                                    sum,
                                                                    count,
                                                                  ) =>
                                                                      sum +
                                                                      count,
                                                                );
                                                          });
                                                          _filteredStatuses
                                                            ..clear()
                                                            ..addAll(
                                                              statuses ?? [],
                                                            );
                                                          _filteredUsers
                                                            ..clear()
                                                            ..addAll(
                                                              selectedParticipants ??
                                                                  [],
                                                            );
                                                          _filteredTags
                                                            ..clear()
                                                            ..addAll(
                                                              selectedTags ??
                                                                  [],
                                                            );
                                                          _filteredDeadline =
                                                              deadline;
                                                          projectBloc.add(
                                                            ProjectEvent.filterTasks(
                                                              users:
                                                                  selectedParticipants ??
                                                                  [],
                                                              tags:
                                                                  selectedTags ??
                                                                  [],
                                                              deadline:
                                                                  deadline,
                                                              statuses:
                                                                  statuses ??
                                                                  [],
                                                            ),
                                                          );
                                                        },
                                                  );
                                                },
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                gradient: context
                                                    .colors
                                                    .primaryGradient,
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                                boxShadow: [
                                                  context.colors.standardShadow,
                                                ],
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 16,
                                                    vertical: 6,
                                                  ),
                                              child: Row(
                                                children: [
                                                  AnimatedContainer(
                                                    duration: const Duration(
                                                      milliseconds: 300,
                                                    ),
                                                    curve: Curves.easeOutCubic,
                                                    width:
                                                        _visibleHint ==
                                                            HintType.filter
                                                        ? 75
                                                        : 0,
                                                    child: AnimatedOpacity(
                                                      duration: const Duration(
                                                        milliseconds: 200,
                                                      ),
                                                      opacity:
                                                          _visibleHint ==
                                                              HintType.filter
                                                          ? 1
                                                          : 0,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                              right: 6,
                                                            ),
                                                        child: Text(
                                                          S.of(context).filters,
                                                          maxLines: 1,
                                                          overflow:
                                                              TextOverflow.clip,
                                                          style: context
                                                              .styles
                                                              .h1
                                                              .copyWith(
                                                                fontSize: 14,
                                                                color: context
                                                                    .colors
                                                                    .white,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.filter_list_outlined,
                                                    color: context.colors.white,
                                                    size: 24,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          if (activeFiltersCount > 0)
                                            Positioned(
                                              right: -10,
                                              top: -10,
                                              child: Container(
                                                width: 22,
                                                height: 22,
                                                decoration: BoxDecoration(
                                                  color: context.colors.error,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: context.colors.white,
                                                    width: 1.5,
                                                  ),
                                                  boxShadow: [
                                                    context
                                                        .colors
                                                        .standardShadow,
                                                  ],
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    activeFiltersCount > 99
                                                        ? S
                                                              .of(context)
                                                              .ninty_nine_plus
                                                        : '$activeFiltersCount',
                                                    style: context
                                                        .styles
                                                        .textStyle
                                                        .copyWith(
                                                          color: context
                                                              .colors
                                                              .secondary,
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          height: 1,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    const SizedBox(width: 15),
                                    if (!state.isLoading &&
                                        !state.isError &&
                                        state.users != null &&
                                        state.tasks != null &&
                                        state.tags != null &&
                                        tasks.isNotEmpty)
                                      Clickable(
                                        onLongPress: () =>
                                            showHint(HintType.sort),
                                        onTap: () {
                                          showModalBottomSheet(
                                            isScrollControlled: true,
                                            context: context,
                                            backgroundColor:
                                                context.colors.lightBackground,
                                            builder: (context) {
                                              return TMSortBottomSheet(
                                                selectedSort: _sortType,
                                                isAscOrder: _isAscOrder,
                                                onChanged:
                                                    ({
                                                      selectedSort,
                                                      isAscOrder,
                                                    }) {
                                                      setState(() {
                                                        _isAscOrder =
                                                            isAscOrder;
                                                        _sortType =
                                                            selectedSort;
                                                      });
                                                    },
                                              );
                                            },
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            gradient:
                                                context.colors.primaryGradient,
                                            borderRadius: BorderRadius.circular(
                                              14,
                                            ),
                                            boxShadow: [
                                              context.colors.standardShadow,
                                            ],
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 6,
                                          ),
                                          child: Row(
                                            children: [
                                              AnimatedContainer(
                                                duration: const Duration(
                                                  milliseconds: 300,
                                                ),
                                                curve: Curves.easeOutCubic,
                                                width:
                                                    _visibleHint ==
                                                        HintType.sort
                                                    ? 95
                                                    : 0,
                                                child: AnimatedOpacity(
                                                  duration: const Duration(
                                                    milliseconds: 200,
                                                  ),
                                                  opacity:
                                                      _visibleHint ==
                                                          HintType.sort
                                                      ? 1
                                                      : 0,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                          right: 6,
                                                        ),
                                                    child: Text(
                                                      'Сортировка'.hardCoded,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      style: context.styles.h1
                                                          .copyWith(
                                                            fontSize: 14,
                                                            color: context
                                                                .colors
                                                                .white,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),

                                              AnimatedSize(
                                                duration: const Duration(
                                                  milliseconds: 500,
                                                ),
                                                child: Icon(
                                                  Icons.sort,
                                                  color: context.colors.white,
                                                  size: 24,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      state.isLoading &&
                              state.users == null &&
                              state.tasks == null &&
                              state.tags == null
                          ? const TMTaskListShimmer()
                          : tasks.isEmpty
                          ? Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 200,
                                  horizontal: 40,
                                ),
                                child: Text(
                                  S.of(context).tasks_not_found,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: context.colors.textColor.withValues(
                                      alpha: 0.3,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: tasks.length,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final task = tasks[index];
                                return RepaintBoundary(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ).copyWith(bottom: 20),
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          context.colors.standardShadow,
                                        ],
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(14),
                                        child: GhostSwipeHint(
                                          backgroundColor: context.colors.error,
                                          duration: index == 0
                                              ? const Duration(
                                                  milliseconds: 700,
                                                )
                                              : Duration.zero,
                                          child: TMTaskItem(
                                            key: ValueKey(task.id),
                                            task: task,
                                            project: widget.project,
                                            tags:
                                                state.tags
                                                    ?.where(
                                                      (tag) => task.tagsIds
                                                          .contains(tag.id),
                                                    )
                                                    .toList() ??
                                                [],
                                            controller: _getController(task.id),
                                            users: users,
                                            onSave:
                                                (
                                                  name,
                                                  responsibilityIds,
                                                  status,
                                                  deadline,
                                                ) {
                                                  projectBloc.add(
                                                    ProjectEvent.updateTask(
                                                      task: task.copyWith(
                                                        responsibleIds:
                                                            responsibilityIds ??
                                                            [],
                                                        name: name,
                                                        endDate: deadline,
                                                        status: status,
                                                      ),
                                                    ),
                                                  );
                                                },
                                            onCancel: () {},

                                            onDelete: () {
                                              projectBloc.add(
                                                ProjectEvent.deleteTask(
                                                  task: task,
                                                ),
                                              );
                                            },
                                            onAssign: () {
                                              projectBloc.add(
                                                ProjectEvent.updateTask(
                                                  task: task.copyWith(
                                                    archived: true,
                                                    archivedAt: DateTime.now(),
                                                  ),
                                                ),
                                              );
                                            },
                                            onDeadline: () {},
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                    ],
                  ),
                ),
              ),
              TMAddButton(
                onTap: () {
                  context.pushRoute(
                    CreateTaskRoute(
                      createTask: (task) {
                        projectBloc.add(
                          ProjectEvent.addTask(
                            projectId: widget.project.id,
                            task: task,
                          ),
                        );
                      },
                      project: widget.project,
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
