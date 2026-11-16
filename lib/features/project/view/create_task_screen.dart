import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:task_manager/app/extensions/context.dart';
import 'package:task_manager/app/extensions/date_time.dart';
import 'package:task_manager/app/extensions/string.dart';
import 'package:task_manager/app/localization/generated/l10n.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/app/values/tm_icons.dart';
import 'package:task_manager/app/widgets/avatar/avatar_stack.dart';
import 'package:task_manager/app/widgets/bottom_sheets/select_participants_bottom_sheet.dart';
import 'package:task_manager/app/widgets/icon_button.dart';
import 'package:task_manager/app/widgets/wrappers/clickable.dart';
import 'package:task_manager/features/home/models/task/task.dart';
import 'package:task_manager/features/project/bloc/project_bloc.dart';
import 'package:task_manager/features/project/models/project/project.dart';
import 'package:task_manager/features/project/repository/projects_repository_impl.dart';
import 'package:task_manager/features/tags/models/tag/tag.dart';
import 'package:task_manager/features/tags/widgets/tags_horizontal_list.dart';
import 'package:task_manager/features/tags/widgets/tags_selected_window.dart';

@RoutePage()
class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({
    required this.createTask,
    required this.project,
    super.key,
  });

  final Function(TMTask task) createTask;
  final TMProject project;

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  DateTime? _startDate;
  DateTime? _endDate;
  bool _showNameError = false;
  bool _showStartDateError = false;
  bool _touchedName = false;
  final Map<String, String> _responsibleIds = {};

  // final List<TMTaskTag> _allTags = [];

  final List<TMTaskTag> _tags = [];
  late final String _ownerId =
      context.dependencies.authBloc.state.user?.id ?? '';
  late final ProjectBloc projectBloc = ProjectBloc(
    repository: ProjectsRepositoryImpl(
      client: context.dependencies.firebaseClient,
    ),
  )..add(ProjectEvent.initialize(widget.project));

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_onNameChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  void _onNameChanged() {
    if (!_touchedName) return;

    final isValid = _nameController.text.trim().isNotEmpty;

    if (isValid && _showNameError) {
      setState(() {
        _showNameError = false;
      });
    }
  }

  Future<DateTime?> _pickUpDate() async {
    final picked = await showDatePicker(
      context: context,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.utc(2100),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: context.colors.primary,
              onPrimary: context.colors.white,
              surface: context.colors.secondary,
              onSurface: context.colors.textColor,
              secondaryContainer: context.colors.primary.withValues(alpha: 0.2),
            ),
            datePickerTheme: DatePickerThemeData(
              headerBackgroundColor: context.colors.primary,
              headerForegroundColor: context.colors.white,
              todayBorder: BorderSide(color: context.colors.primary),
            ),
          ),
          child: child!,
        );
      },
    );
    return picked;
  }

  void _onSubmit() {
    final isNameValid = _nameController.text.trim().isNotEmpty;
    final isStartDateValid = _startDate != null;

    setState(() {
      _touchedName = true;
      _showNameError = !isNameValid;
      _showStartDateError = !isStartDateValid;
    });

    if (!isNameValid || !isStartDateValid) return;

    final task = TMTask(
      projectId: widget.project.id,
      responsibleIds: _responsibleIds.keys.toList(),
      name: _nameController.text.trim(),
      description: _descriptionController.text.trim().isEmpty
          ? null
          : _descriptionController.text.trim(),
      startDate: _startDate,
      endDate: _endDate,
      createdAt: DateTime.now(),
      ownerId: _ownerId,
      tagsIds: _tags.map((tag) => tag.id).toList(),
    );

    widget.createTask(task);
    context.pop();
  }

  @override
  void dispose() {
    _nameController
      ..removeListener(_onNameChanged)
      ..dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _selectResponsible() async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.colors.transparent,
      builder: (context) => SelectUsersBottomSheet(
        alreadySelected: const {},
        onChanged: (responsibleIds) {
          setState(() {
            _responsibleIds
              ..clear()
              ..addAll(responsibleIds);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      bloc: projectBloc,
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              fit: StackFit.expand,
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Hero(
                          tag: state.project.id,
                          child: Material(
                            color: context.colors.transparent,
                            child: Stack(
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  height: 150,
                                  decoration: BoxDecoration(
                                    gradient: context.colors.primaryGradient,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.project.name,
                                          style: context.styles.h1.copyWith(
                                            color: context.colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          S.of(context).create_task,
                                          style: context.styles.h1.copyWith(
                                            color: context.colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 15,
                                  top: 15,
                                  child: TMIconButton(
                                    iconData: TmIcons.leftArrow,
                                    color: context.colors.white,
                                    iconSize: 30,
                                    onTap: () {
                                      context.pop();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: context.colors.secondary,
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [context.colors.standardShadow],
                            border: _showNameError
                                ? Border.all(color: context.colors.error)
                                : null,
                          ),
                          child: TextField(
                            controller: _nameController,
                            style: context.styles.textStyle.copyWith(
                              color: context.colors.textColor,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.edit),
                              prefixIconColor: context.colors.primary,
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 20,
                              ),
                              hintText: S.of(context).task_name,
                              hintStyle: context.styles.textStyle.copyWith(
                                color: context.colors.iconDisable,
                              ),
                            ),
                          ),
                        ),
                        AnimatedSize(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          child: _showNameError
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                    top: 2,
                                    left: 10,
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      S.of(context).enter_the_task_name,
                                      textAlign: TextAlign.start,
                                      style: context.styles.textStyle.copyWith(
                                        color: context.colors.error,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),
                        const SizedBox(height: 20),
                        Clickable(
                          onTap: () async {
                            _startDate = await _pickUpDate();
                            if (_startDate != null) {
                              _showStartDateError = false;
                            }
                            setState(() {});
                          },
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: context.colors.secondary,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [context.colors.standardShadow],
                              border: _showStartDateError
                                  ? Border.all(color: context.colors.error)
                                  : null,
                            ),
                            child: InputDecorator(
                              decoration: InputDecoration(
                                prefixIcon: const Icon(TmIcons.calendar),
                                prefixIconColor: context.colors.primary,
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 20,
                                ),
                                labelText: S.of(context).start_date,
                                labelStyle: context.styles.textStyle.copyWith(
                                  color: context.colors.iconDisable,
                                ),
                                floatingLabelStyle: context.styles.textStyle
                                    .copyWith(color: context.colors.primary),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                              ),
                              child: Text(
                                _startDate?.toRuDate ??
                                    S.of(context).date_placeholder,
                                style: context.styles.textStyle.copyWith(
                                  color: _startDate != null
                                      ? context.colors.textColor
                                      : context.colors.iconDisable,
                                ),
                              ),
                            ),
                          ),
                        ),
                        AnimatedSize(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          child: _showStartDateError
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                    top: 2,
                                    left: 10,
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      S.of(context).enter_the_start_date,
                                      textAlign: TextAlign.start,
                                      style: context.styles.textStyle.copyWith(
                                        color: context.colors.error,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),
                        const SizedBox(height: 20),
                        Clickable(
                          onTap: () async {
                            _endDate = await _pickUpDate();
                            setState(() {});
                          },
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: context.colors.secondary,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [context.colors.standardShadow],
                            ),
                            child: InputDecorator(
                              decoration: InputDecoration(
                                prefixIcon: const Icon(TmIcons.calendar),
                                prefixIconColor: context.colors.primary,
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 20,
                                ),
                                labelText: S.of(context).end_date,
                                labelStyle: context.styles.textStyle.copyWith(
                                  color: context.colors.iconDisable,
                                ),
                                floatingLabelStyle: context.styles.textStyle
                                    .copyWith(color: context.colors.primary),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                              ),
                              child: Text(
                                _endDate?.toRuDate ??
                                    S.of(context).date_placeholder,
                                style: context.styles.textStyle.copyWith(
                                  color: _endDate != null
                                      ? context.colors.textColor
                                      : context.colors.iconDisable,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Clickable(
                          onTap: _selectResponsible,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: context.colors.secondary,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [context.colors.standardShadow],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.supervised_user_circle,
                                    color: context.colors.primary,
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Ответственные'.hardCoded,
                                          style: context.styles.textStyle
                                              .copyWith(
                                                fontSize: 12,
                                                color: context.colors.primary,
                                              ),
                                        ),
                                        const SizedBox(height: 6),
                                        _responsibleIds.isEmpty
                                            ? Text(
                                                'Добавить ответственных'
                                                    .hardCoded,
                                                style: context.styles.textStyle
                                                    .copyWith(
                                                      color: context
                                                          .colors
                                                          .iconDisable,
                                                    ),
                                              )
                                            : AvatarStack(
                                                users: _responsibleIds.values
                                                    .toList(),
                                              ),
                                      ],
                                    ),
                                  ),

                                  const Icon(Icons.chevron_right),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => TMTagSelectedWindow(
                                isLoading: state.isLoading,
                                onChanged: (tags) {
                                  setState(() {
                                    _tags
                                      ..clear()
                                      ..addAll(tags);
                                  });
                                },
                                onAddNewTag: (newTag) {
                                  setState(() {
                                    projectBloc.add(
                                      ProjectEvent.addTag(tag: newTag),
                                    );
                                  });
                                },
                                selected: _tags,
                                projectTags: state.project.tagsIds,
                              ),
                            );
                          },
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: context.colors.secondary,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [context.colors.standardShadow],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.tag,
                                    color: context.colors.primary,
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          S.of(context).tags,
                                          style: context.styles.textStyle
                                              .copyWith(
                                                fontSize: 12,
                                                color: context.colors.primary,
                                              ),
                                        ),
                                        const SizedBox(height: 6),
                                        _tags.isEmpty
                                            ? Text(
                                                S.of(context).add_tags,
                                                style: context.styles.textStyle
                                                    .copyWith(
                                                      color: context
                                                          .colors
                                                          .iconDisable,
                                                    ),
                                              )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadiusGeometry.circular(
                                                      5,
                                                    ),
                                                child: TMScrollableFade(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    children: _tags
                                                        .map(
                                                          (tag) => Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                  4,
                                                                ),
                                                            child: TMTagChip(
                                                              tag: tag,
                                                              onTap: () {},
                                                            ),
                                                          ),
                                                        )
                                                        .toList(),
                                                  ),
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                  const Icon(Icons.chevron_right),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  left: 20,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Clickable(
                      onTap: _onSubmit,
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color: context.colors.primary,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [context.colors.standardShadow],
                        ),
                        child: Center(
                          child: Text(
                            S.of(context).create,
                            style: context.styles.textStyle.copyWith(
                              color: context.colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
