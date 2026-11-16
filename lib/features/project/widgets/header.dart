import 'package:flutter/material.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/app/values/tm_icons.dart';
import 'package:task_manager/app/widgets/icon_button.dart';
import 'package:task_manager/features/home/models/task/task.dart';
import 'package:task_manager/features/project/models/project/project.dart';
import 'package:task_manager/features/project/widgets/edit_fields.dart';
import 'package:task_manager/features/project/widgets/header_info.dart';

class ProjectHeader extends StatelessWidget {
  const ProjectHeader({
    required this.project,
    required this.tasks,
    required this.isEditing,
    required this.hasChanges,
    required this.nameController,
    required this.showBackButton,
    required this.onBackTap,
    required this.onEditProject,
    required this.onChangeProject,
    required this.onCloseEditTap,
    // Поля для редактирования
    required this.participants,
    required this.ownerImage,
    required this.startDate,
    required this.endDate,
    required this.onSelectParticipants,
    required this.onSelectOwner,
    required this.onSelectStartDate,
    required this.onSelectEndDate,
    super.key,
  });

  final TMProject project;
  final List<TMTask> tasks;
  final bool isEditing;
  final bool hasChanges;
  final TextEditingController nameController;
  final bool showBackButton;
  final VoidCallback onBackTap;
  final VoidCallback onEditProject;
  final VoidCallback onChangeProject;
  final VoidCallback onCloseEditTap;

  final Map<String, String> participants;
  final String ownerImage;
  final DateTime? startDate;
  final DateTime? endDate;
  final VoidCallback onSelectParticipants;
  final VoidCallback onSelectOwner;
  final VoidCallback onSelectStartDate;
  final VoidCallback onSelectEndDate;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isEditing
                ? context.colors.textColor.withValues(alpha: 0.1)
                : context.colors.transparent,
          ),
          child: Hero(
            tag: project.id,
            child: Material(
              color: context.colors.transparent,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                height: isEditing ? 290 : 150,
                width: MediaQuery.sizeOf(context).width,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ).copyWith(top: 45),
                decoration: BoxDecoration(
                  gradient: context.colors.primaryGradient,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TMProjectHeaderInfo(
                          tasks: tasks,
                          isEditing: isEditing,
                          nameController: nameController,
                          projectName: project.name,
                        ),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: isEditing
                              ? TMEditFields(
                                  participants: participants,
                                  ownerImage: ownerImage,
                                  startDate: startDate,
                                  endDate: endDate,
                                  onSelectParticipants: onSelectParticipants,
                                  onSelectOwner: onSelectOwner,
                                  onSelectStartDate: onSelectStartDate,
                                  onSelectEndDate: onSelectEndDate,
                                )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),
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
            opacity: showBackButton ? 1.0 : 0.0,
            child: Center(
              child: TMIconButton(
                iconData: TmIcons.leftArrow,
                color: context.colors.white,
                iconSize: 30,
                onTap: onBackTap,
              ),
            ),
          ),
        ),
        if (isEditing)
          Positioned(
            right: hasChanges ? 45 : 15,
            top: 20,
            child: Center(
              child: TMIconButton(
                iconData: Icons.close,
                color: context.colors.white,
                iconSize: 22,
                onTap: onCloseEditTap,
              ),
            ),
          ),

        if (!isEditing || hasChanges)
          Positioned(
            right: 15,
            top: 20,
            child: Center(
              child: TMIconButton(
                iconData: isEditing ? Icons.check : Icons.edit,
                color: context.colors.white,
                iconSize: 22,
                onTap: isEditing ? onChangeProject : onEditProject,
              ),
            ),
          ),
      ],
    );
  }
}
