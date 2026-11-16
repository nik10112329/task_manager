import 'package:flutter/material.dart';
import 'package:task_manager/app/auth/model/user_model.dart';
import 'package:task_manager/app/extensions/context.dart';
import 'package:task_manager/app/extensions/date_time.dart';
import 'package:task_manager/app/localization/generated/l10n.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/app/widgets/avatar/avatar_stack.dart';
import 'package:task_manager/app/widgets/wrappers/clickable.dart';
import 'package:task_manager/features/home/models/task/task.dart';
import 'package:task_manager/features/home/models/task_status/task_status.dart';
import 'package:task_manager/features/project/bloc/project_bloc.dart';
import 'package:task_manager/features/project/models/project/project.dart';
import 'package:task_manager/features/project/repository/projects_repository_impl.dart';
import 'package:task_manager/features/project/utils/project_editing_utils.dart';
import 'package:task_manager/features/project/widgets/status_item.dart';
import 'package:task_manager/features/search_users/utils/search_users_utils.dart';
import 'package:task_manager/features/tags/models/tag/tag.dart';

typedef OnSaveHandler =
    void Function(
      String name,
      List<String>? responsibleIds,
      TaskStatus status,
      DateTime? endDate,
    );

class TMTaskItem extends StatefulWidget {
  const TMTaskItem({
    required this.task,
    required this.tags,
    required this.controller,
    required this.users,
    required this.onSave,
    required this.onCancel,
    required this.onAssign,
    required this.onDeadline,
    required this.onDelete,
    required this.project,
    super.key,
  });

  final TMTask task;
  final List<TMTaskTag> tags;
  final TMProject project;
  final TextEditingController controller;
  final List<TMUser> users;
  final OnSaveHandler onSave;
  final VoidCallback onCancel;
  final VoidCallback onAssign;
  final VoidCallback onDeadline;
  final VoidCallback onDelete;

  @override
  State<TMTaskItem> createState() => _TMTaskItemState();
}

class _TMTaskItemState extends State<TMTaskItem> {
  bool _isEditing = false;

  late String _localName;
  late List<String> _localResponsibleIds;
  late DateTime? _localEndDate;
  late ProjectBloc _projectBloc;
  late TaskStatus _localStatus = widget.task.status;

  @override
  void initState() {
    super.initState();
    _initLocalData();
  }

  void _initLocalData() {
    _localName = widget.task.name;
    _localResponsibleIds = List.from(widget.task.responsibleIds);
    _localEndDate = widget.task.endDate;

    _projectBloc = ProjectBloc(
      repository: ProjectsRepositoryImpl(
        client: context.dependencies.firebaseClient,
      ),
    )..add(ProjectEvent.initialize(widget.project));
    widget.controller.text = _localName;
  }

  void _enterEditMode() {
    _initLocalData();
    setState(() => _isEditing = true);
  }

  void _saveChanges() {
    widget.onSave(
      _localName,
      _localResponsibleIds,
      _localStatus,
      _localEndDate,
    );
    setState(() => _isEditing = false);
  }

  void _cancelChanges() {
    widget.controller.text = widget.task.name;
    widget.onCancel();
    setState(() => _isEditing = false);
  }

  Future<void> _handleAssign(ProjectBloc projectBloc) async {
    await SearchUsersUtils.selectParticipants(
      context: context,
      participants: Map.fromEntries(
        widget.task.responsibleIds.map((id) {
          final user = widget.users.firstWhere((u) => u.id == id);
          return MapEntry(id, user.photoUrl ?? '');
        }),
      ),
      onChanged: (responsibleIds) {
        if (responsibleIds.keys.isNotEmpty && mounted) {
          setState(() => _localResponsibleIds = responsibleIds.keys.toList());
        } else {
          setState(() => _localResponsibleIds = []);
        }
      },
      initialUsers: projectBloc.state.users ?? [],
    );
  }

  Future<void> _handleDeadline() async {
    await ProjectEditingUtils.pickUpDate(
      context: context,
      onChanged: (date) {
        if (mounted) {
          setState(() => _localEndDate = date);
        }
      },
    );
  }

  double _maskOpacityForStatus(TaskStatus status) {
    switch (status) {
      case TaskStatus.done:
        return 0.7;
      case TaskStatus.cancelled:
        return 0.4;
      default:
        return 1;
    }
  }

  bool get isCancelled => _localStatus == TaskStatus.cancelled;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.task.id),
      secondaryBackground: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(color: context.colors.error),
        child: Icon(Icons.delete, color: context.colors.white),
      ),
      background: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(color: context.colors.primary),
        child: Icon(Icons.archive, color: context.colors.white),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
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
                        S.of(context).remove_task_name(widget.task.name),
                        style: context.styles.h1.copyWith(fontSize: 18),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: Text(
                                S.of(context).cancel,
                                style: context.styles.textStyle.copyWith(
                                  color: context.colors.textColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: context.colors.error,
                              ),
                              onPressed: () {
                                widget.onDelete();
                                Navigator.pop(context, true);
                              },
                              child: Text(
                                S.of(context).delete,
                                style: context.styles.textStyle.copyWith(
                                  color: context.colors.white,
                                  fontWeight: FontWeight.w600,
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
        }
        if (direction == DismissDirection.startToEnd) {
          await showModalBottomSheet<bool>(
            context: context,
            builder: (context) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Перенести задачу в архив?',
                        style: context.styles.h1.copyWith(fontSize: 18),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: Text(
                                S.of(context).cancel,
                                style: context.styles.textStyle.copyWith(
                                  color: context.colors.textColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: context.colors.primary,
                              ),
                              onPressed: () {
                                widget.onAssign();
                                Navigator.pop(context, true);
                              },
                              child: Text(
                                'Перенести',
                                style: context.styles.textStyle.copyWith(
                                  color: context.colors.white,
                                  fontWeight: FontWeight.w600,
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
        }
        return null;
      },

      child: GestureDetector(
        onTap: isCancelled ? null : _enterEditMode,
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: context.colors.secondary),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                context.colors.white.withValues(
                  alpha: _maskOpacityForStatus(_localStatus),
                ),
                BlendMode.modulate,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.tags.isNotEmpty)
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: widget.tags.map((tag) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: tag.color == null
                                    ? context.colors.primaryGradient
                                          .withOpacity(0.3)
                                    : null,
                                color: tag.color != null
                                    ? Color(tag.color!).withValues(alpha: 0.5)
                                    : null,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 2.5,
                                  horizontal: 10,
                                ),
                                child: Text(
                                  tag.name.toUpperCase(),
                                  style: context.styles.textStyle.copyWith(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: SizedBox(
                          height: 32,
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 250),
                            transitionBuilder: (child, animation) =>
                                FadeTransition(
                                  opacity: animation,
                                  child: child,
                                ),
                            child: _isEditing
                                ? Align(
                                    alignment: Alignment.centerLeft,
                                    child: TextField(
                                      key: const ValueKey('edit'),
                                      controller: widget.controller,
                                      autofocus: true,
                                      onChanged: (value) => _localName = value,
                                      style: context.styles.textStyle.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                      ),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.zero,
                                        isDense: true,
                                      ),
                                    ),
                                  )
                                : Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      widget.task.name,
                                      key: const ValueKey('view'),
                                      style: context.styles.textStyle.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                        decoration: isCancelled
                                            ? TextDecoration.lineThrough
                                            : null,
                                        decorationThickness: 1.5,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        child: TMStatusItem(
                          key: const ValueKey('status'),
                          currentStatus: _localStatus,
                          onChange: (status) {
                            _localStatus = status;
                            _saveChanges();
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Divider(color: context.colors.iconDisable, thickness: 0.5),
                  const SizedBox(height: 10),
                  if (_localResponsibleIds.isNotEmpty)
                    Clickable(
                      onTap: () {},
                      child: AvatarStack(
                        users: widget.users
                            .where((u) => _localResponsibleIds.contains(u.id))
                            .map((u) => u.photoUrl)
                            .whereType<String>()
                            .toList(),
                      ),
                    ),
                  const SizedBox(height: 8),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    child: ClipRect(
                      child: _isEditing
                          ? _buildEditContent()
                          : const SizedBox.shrink(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEditContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Clickable(
          surfaceColor: context.colors.transparent,
          onTap: () => _handleAssign(_projectBloc),
          child: Row(
            children: [
              Icon(Icons.person, size: 18, color: context.colors.primary),
              const SizedBox(width: 8),
              Text(
                _localResponsibleIds.isEmpty
                    ? S.of(context).appoint
                    : _localResponsibleIds.length > 1
                    ? S
                          .of(context)
                          .responsibility_length(_localResponsibleIds.length)
                    : S.of(context).one_responsible_person,
                style: context.styles.textStyle.copyWith(
                  color: context.colors.primary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Clickable(
          surfaceColor: context.colors.transparent,
          onTap: _handleDeadline,
          child: Row(
            children: [
              Icon(
                Icons.calendar_today,
                size: 18,
                color: context.colors.primary,
              ),
              const SizedBox(width: 8),
              Text(
                _localEndDate != null
                    ? _localEndDate!.toRuDate
                    : S.of(context).deadline,
                style: context.styles.textStyle.copyWith(
                  color: context.colors.primary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: Clickable(
                surfaceColor: context.colors.transparent,
                onTap: _saveChanges,
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: context.colors.primary,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    S.of(context).save,
                    textAlign: TextAlign.center,
                    style: context.styles.textStyle.copyWith(
                      color: context.colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Clickable(
                surfaceColor: context.colors.transparent,
                onTap: _cancelChanges,
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: context.colors.iconDisable),
                  ),
                  child: Text(
                    S.of(context).cancel,
                    style: context.styles.textStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
