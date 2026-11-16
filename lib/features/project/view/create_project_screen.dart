import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/app/extensions/context.dart';
import 'package:task_manager/app/extensions/date_time.dart';
import 'package:task_manager/app/localization/generated/l10n.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/app/values/tm_icons.dart';
import 'package:task_manager/app/widgets/avatar/avatar_stack.dart';
import 'package:task_manager/app/widgets/icon_button.dart';
import 'package:task_manager/app/widgets/wrappers/clickable.dart';
import 'package:task_manager/features/project/models/project/project.dart';
import 'package:task_manager/features/project/repository/projects_repository_impl.dart';
import 'package:task_manager/features/project/utils/project_editing_utils.dart';
import 'package:task_manager/features/search_users/bloc/search_users_bloc.dart';
import 'package:task_manager/features/search_users/utils/search_users_utils.dart';

@RoutePage()
class CreateProjectScreen extends StatefulWidget {
  const CreateProjectScreen({required this.createProject, super.key});

  final Function(TMProject project) createProject;

  @override
  State<CreateProjectScreen> createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  bool _showBackButton = false;
  DateTime? _startDate;
  DateTime? _endDate;
  bool _isNameValid = false;
  final Map<String, String> _participants = {};
  late String _ownerId = context.dependencies.authBloc.state.user?.id ?? '';
  late String _ownerImage =
      context.dependencies.authBloc.state.user?.photoUrl ?? '';
  late final SearchUsersBloc searchBloc;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_onNameChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) setState(() => _showBackButton = true);
      });
      searchBloc = SearchUsersBloc(
        repository: ProjectsRepositoryImpl(
          client: context.dependencies.firebaseClient,
        ),
      );
    });
  }

  void _onNameChanged() {
    final isValid = ProjectEditingUtils.nameValidator(
      name: _nameController.text,
    );
    if (isValid != _isNameValid) {
      setState(() => _isNameValid = isValid);
    }
  }

  void _onSubmit() {
    final project = TMProject(
      id: '',
      name: _nameController.text.trim(),
      description: _descriptionController.text.trim().isEmpty
          ? null
          : _descriptionController.text.trim(),
      startDate: _startDate,
      endDate: _endDate,
      createdAt: DateTime.now(),
      ownerId: _ownerId,
      participants: _participants.keys.toList(),
      creatorId: context.dependencies.authBloc.state.user?.id,
    );

    widget.createProject.call(project);
    context.pop();
    setState(() {});
  }

  @override
  void dispose() {
    _nameController
      ..removeListener(_onNameChanged)
      ..dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    Stack(
                      children: [
                        Hero(
                          tag: 'create_project',
                          child: Material(
                            color: context.colors.transparent,
                            child: Container(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      S.of(context).task_manager,
                                      style: context.styles.textStyle.copyWith(
                                        color: context.colors.white,
                                      ),
                                    ),
                                    Text(
                                      S.of(context).create_project,
                                      style: context.styles.h1.copyWith(
                                        color: context.colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 15,
                          top: 15,
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 200),
                            opacity: _showBackButton ? 1.0 : 0.0,
                            child: TMIconButton(
                              iconData: TmIcons.leftArrow,
                              color: context.colors.white,
                              iconSize: 30,
                              onTap: () {
                                context.pop();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: context.colors.secondary,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [context.colors.standardShadow],
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
                          hintText: S.of(context).project_name,
                          hintStyle: context.styles.textStyle.copyWith(
                            color: context.colors.iconDisable,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Clickable(
                      onTap: () => ProjectEditingUtils.pickUpDate(
                        context: context,
                        onChanged: (newDate) {
                          _startDate = newDate;
                          setState(() {});
                        },
                      ),
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

                            labelText: S.of(context).start_date,
                            labelStyle: context.styles.textStyle.copyWith(
                              color: context.colors.iconDisable,
                            ),
                            floatingLabelStyle: context.styles.textStyle
                                .copyWith(color: context.colors.primary),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
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

                    const SizedBox(height: 20),
                    Clickable(
                      onTap: () => ProjectEditingUtils.pickUpDate(
                        context: context,
                        onChanged: (newDate) {
                          _endDate = newDate;
                          setState(() {});
                        },
                      ),
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
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
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
                      onTap: () => SearchUsersUtils.selectOwner(
                        context: context,
                        ownerId: _ownerId,
                        ownerImage: _ownerImage,
                        onChanged: (owner) {
                          setState(() {
                            _ownerId = owner.keys.first;
                            _ownerImage = owner.values.first;
                          });
                        },
                        // initialUsers: searchBloc.state.users,
                        // TODO(Zhilin): see this
                        // project: const TMProject(id: '', name: ''),
                      ),
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
                              Icon(Icons.person, color: context.colors.primary),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      S.of(context).owner,
                                      style: context.styles.textStyle.copyWith(
                                        color: context.colors.primary,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    _ownerImage.isNotEmpty
                                        ? ClipOval(
                                            child: SizedBox(
                                              width: 28,
                                              height: 28,
                                              child: CachedNetworkImage(
                                                imageUrl: _ownerImage,
                                                fit: BoxFit.cover,
                                                errorWidget: (_, _, _) => Icon(
                                                  TmIcons.profile,
                                                  color:
                                                      context.colors.iconColor,
                                                  size: 28,
                                                ),
                                              ),
                                            ),
                                          )
                                        : Icon(
                                            TmIcons.profile,
                                            color: context.colors.iconColor,
                                            size: 28,
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
                    Clickable(
                      onTap: () => SearchUsersUtils.selectParticipants(
                        context: context,
                        participants: _participants,
                        onChanged: (newParticipants) {
                          setState(() {
                            _participants
                              ..clear()
                              ..addAll(newParticipants);
                          });
                        },
                        // TODO(Zhilin): see this
                        // project: const TMProject(id: '', name: ''),
                        // initialUsers: searchBloc.state.users,
                      ),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      S.of(context).participants,
                                      style: context.styles.textStyle.copyWith(
                                        fontSize: 12,
                                        color: context.colors.primary,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    _participants.isEmpty
                                        ? Text(
                                            S.of(context).add_participants,
                                            style: context.styles.textStyle
                                                .copyWith(
                                                  color: context
                                                      .colors
                                                      .iconDisable,
                                                ),
                                          )
                                        : AvatarStack(
                                            users: _participants.values
                                                .toList(),
                                          ),
                                    // : SizedBox(
                                    //     height: 28,
                                    //     child: ListView.separated(
                                    //       scrollDirection: Axis.horizontal,
                                    //       itemCount:
                                    //           _participants.values.length,
                                    //       separatorBuilder: (_, _) =>
                                    //           const SizedBox(width: 6),
                                    //       itemBuilder: (context, index) {
                                    //         final imageUrl = _participants
                                    //             .values
                                    //             .elementAt(index);
                                    //
                                    //         return ClipOval(
                                    //           child: SizedBox(
                                    //             width: 28,
                                    //             height: 28,
                                    //             child: CachedNetworkImage(
                                    //               imageUrl: imageUrl ?? '',
                                    //               fit: BoxFit.cover,
                                    //               errorWidget: (_, _, _) =>
                                    //                   Icon(
                                    //                     TmIcons.profile,
                                    //                     color: context
                                    //                         .colors
                                    //                         .iconColor,
                                    //                     size: 28,
                                    //                   ),
                                    //             ),
                                    //           ),
                                    //         );
                                    //       },
                                    //     ),
                                    //   ),
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
  }
}
