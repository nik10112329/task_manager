import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/app/auth/model/user_model.dart';
import 'package:task_manager/app/extensions/enum/deadline_values.dart';
import 'package:task_manager/app/extensions/enum/task_status.dart';
import 'package:task_manager/app/extensions/string.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/app/values/tm_icons.dart';
import 'package:task_manager/app/widgets/carousels/tile_selector.dart';
import 'package:task_manager/app/widgets/wrappers/clickable.dart';
import 'package:task_manager/app/widgets/wrappers/shadow_scroll_wrapper.dart';
import 'package:task_manager/features/home/models/task_status/task_status.dart';
import 'package:task_manager/features/project/widgets/users_selector.dart';
import 'package:task_manager/features/tags/models/tag/tag.dart';
import 'package:task_manager/features/tags/widgets/tags_horizontal_list.dart';

class TMFilterBottomSheets extends StatefulWidget {
  const TMFilterBottomSheets({
    required this.tags,
    required this.participants,
    required this.onChanged,
    this.selectedDeadline,
    this.selectedTags,
    this.selectedParticipants,
    this.selectedStatuses,
    super.key,
  });

  final List<TMTaskTag> tags;
  final List<TMUser> participants;

  final List<TMTaskTag>? selectedTags;
  final List<TMUser>? selectedParticipants;
  final List<TaskStatus>? selectedStatuses;
  final DateTime? selectedDeadline;
  final Function({
    List<TMTaskTag>? selectedTags,
    List<TMUser>? selectedParticipants,
    List<TaskStatus>? statuses,
    DateTime? deadline,
  })
  onChanged;

  @override
  State<TMFilterBottomSheets> createState() => _TMFilterBottomSheetsState();
}

class _TMFilterBottomSheetsState extends State<TMFilterBottomSheets> {
  final EdgeInsets standardPadding = const EdgeInsets.symmetric(horizontal: 40);
  DeadlineValues? _selectedDeadline;
  final List<TMUser> _selectedParticipants = [];
  final List<TMTaskTag> _selectedTags = [];
  final List<TaskStatus> _selectedStatuses = [];
  late final ScrollController _scrollController = ScrollController();
  bool showShadow = false;

  void _updateShadows() {
    if (!_scrollController.hasClients || !mounted) {
      return;
    }

    final offset = _scrollController.offset;

    showShadow = offset > 8;
    if (mounted) setState(() {});
  }

  void _onScroll() {
    _updateShadows();
  }

  @override
  void initState() {
    _selectedTags
      ..clear()
      ..addAll(widget.selectedTags ?? []);
    _selectedStatuses
      ..clear()
      ..addAll(widget.selectedStatuses ?? []);
    _selectedParticipants
      ..clear()
      ..addAll(widget.selectedParticipants ?? []);
    _selectedDeadline = DeadlinevaluesDate.fromDate(widget.selectedDeadline);
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ).copyWith(bottom: 100),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: standardPadding,
                  child: Text(
                    'Фильтрация Задач:'.hardCoded,
                    style: context.styles.h1,
                  ),
                ),
                const SizedBox(height: 40),
                Expanded(
                  child: TMShadowScrollWrapper(
                    scrollController: _scrollController,
                    child: CustomScrollView(
                      controller: _scrollController,
                      slivers: [
                        SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (widget.tags.isNotEmpty)
                                const SizedBox(height: 30),
                              if (widget.tags.isNotEmpty)
                                Padding(
                                  padding: standardPadding,
                                  child: Text(
                                    'По тегам:'.hardCoded,
                                    style: context.styles.textStyle,
                                  ),
                                ),
                              if (widget.tags.isNotEmpty)
                                const SizedBox(height: 10),
                              if (widget.tags.isNotEmpty)
                                TMScrollableFade(
                                  scrollDirection: Axis.horizontal,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: _buildTagColumns(),
                                    ),
                                  ),
                                ),
                              if (widget.participants.isNotEmpty)
                                const SizedBox(height: 30),
                              if (widget.participants.isNotEmpty)
                                Padding(
                                  padding: standardPadding,
                                  child: Text(
                                    'По ответственным:'.hardCoded,
                                    style: context.styles.textStyle,
                                  ),
                                ),
                              if (widget.participants.isNotEmpty)
                                const SizedBox(height: 10),
                              if (widget.participants.isNotEmpty)
                                TMUsersSelector(
                                  users: widget.participants,
                                  selectedUsers: _selectedParticipants,
                                  onChanged: (users) {
                                    setState(() {
                                      _selectedParticipants
                                        ..clear()
                                        ..addAll(users ?? []);
                                    });
                                  },
                                ),
                              const SizedBox(height: 30),
                              Padding(
                                padding: standardPadding,
                                child: Text(
                                  'По дедлайну:'.hardCoded,
                                  style: context.styles.textStyle,
                                ),
                              ),
                              const SizedBox(height: 10),
                              TMTileSelector(
                                values: DeadlineValues.values
                                    .map((value) => value.label(context))
                                    .toList(),
                                icons: List.generate(
                                  DeadlineValues.values.length,
                                  (_) => TmIcons.calendar,
                                ),
                                selectedValues: [
                                  ?_selectedDeadline?.label(context),
                                ],
                                onChanged: (List<String>? selectedValues) {
                                  setState(() {
                                    if (selectedValues != null &&
                                        selectedValues.isNotEmpty) {
                                      _selectedDeadline = DeadlineValues.values
                                          .firstWhere(
                                            (value) => selectedValues.contains(
                                              value.label(context),
                                            ),
                                          );
                                    } else {
                                      _selectedDeadline = null;
                                    }
                                  });
                                },
                              ),
                              const SizedBox(height: 30),
                              Padding(
                                padding: standardPadding,
                                child: Text(
                                  'По статусам:'.hardCoded,
                                  style: context.styles.textStyle,
                                ),
                              ),
                              const SizedBox(height: 10),
                              TMTileSelector(
                                isMultiple: true,
                                iconColors: TaskStatus.values
                                    .map((status) => status.color)
                                    .toList(),
                                values: TaskStatus.values
                                    .map((status) => status.label)
                                    .toList(),
                                icons: TaskStatus.values
                                    .map((status) => status.icon)
                                    .toList(),
                                selectedValues: _selectedStatuses
                                    .map((status) => status.label)
                                    .toList(),
                                onChanged: (List<String>? selectedValues) {
                                  setState(() {
                                    if (selectedValues != null) {
                                      _selectedStatuses
                                        ..clear()
                                        ..addAll(
                                          TaskStatus.values.where(
                                            (taskStatus) => selectedValues
                                                .contains(taskStatus.label),
                                          ),
                                        );
                                    } else {
                                      _selectedStatuses.clear();
                                    }
                                  });
                                },
                              ),
                              const SizedBox(height: 60),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 40,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Clickable(
                  onTap: () {
                    setState(() {
                      _selectedDeadline = null;
                      _selectedParticipants.clear();
                      _selectedTags.clear();
                      _selectedStatuses.clear();
                    });
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.sizeOf(context).width / 2 - 25,
                    decoration: BoxDecoration(
                      color: context.colors.secondary,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: context.colors.primary),
                      boxShadow: [context.colors.standardShadow],
                    ),
                    child: Center(
                      child: Text(
                        'Сбросить',
                        style: context.styles.textStyle.copyWith(fontSize: 18),
                      ),
                    ),
                  ),
                ),

                Clickable(
                  onTap: () {
                    widget.onChanged(
                      selectedParticipants: _selectedParticipants,
                      selectedTags: _selectedTags,
                      deadline: _selectedDeadline?.toDate(),
                      statuses: _selectedStatuses,
                    );
                    context.pop();
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.sizeOf(context).width / 2 - 25,
                    decoration: BoxDecoration(
                      color: context.colors.primary,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [context.colors.standardShadow],
                    ),
                    child: Center(
                      child: Text(
                        'Применить',
                        style: context.styles.textStyle.copyWith(
                          color: context.colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildTagColumns() {
    const itemsPerColumn = 3;

    final columns = <Widget>[const SizedBox(width: 40)];
    for (int i = 0; i < widget.tags.length; i += itemsPerColumn) {
      final chunk = widget.tags.skip(i + 1).take(itemsPerColumn);

      columns.add(
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: chunk
                .map(
                  (tag) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width / 2.5,
                      child: TMTagChip(
                        isActive: _selectedTags.contains(tag),
                        tag: tag,
                        onTap: () {
                          setState(() {
                            _selectedTags.contains(tag)
                                ? _selectedTags.remove(tag)
                                : _selectedTags.add(tag);
                          });
                        },
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        fontSize: 15,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      );
    }
    columns.add(const SizedBox(width: 40));
    return columns;
  }
}
