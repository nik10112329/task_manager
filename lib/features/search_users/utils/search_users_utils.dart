import 'package:flutter/material.dart';
import 'package:task_manager/app/auth/model/user_model.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/app/widgets/bottom_sheets/select_participants_bottom_sheet.dart';

class SearchUsersUtils {
  static Future<void> selectParticipants({
    required BuildContext context,
    required Map<String, String> participants,
    required Function(Map<String, String> newParcipants) onChanged,
    List<TMUser>? initialUsers,
  }) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.colors.transparent,
      builder: (context) => SelectUsersBottomSheet(
        alreadySelected: participants,
        onChanged: onChanged,
        initialUsers: initialUsers ?? [],
      ),
    );
  }

  static Future<void> selectOwner({
    required BuildContext context,
    required Function(Map<String, String> selectedUsers) onChanged,
    required String ownerId,
    required String ownerImage,
    List<TMUser>? initialUsers,
  }) async {
    await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.colors.transparent,
      builder: (context) => SelectUsersBottomSheet(
        isSingleSelection: true,
        onChanged: onChanged,
        alreadySelected: {ownerId: ownerImage},
        initialUsers: initialUsers ?? [],
      ),
    );
  }
}
