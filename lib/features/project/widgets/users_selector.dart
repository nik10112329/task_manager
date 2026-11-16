import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/app/auth/model/user_model.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';

class TMUsersSelector extends StatefulWidget {
  const TMUsersSelector({
    required this.users,
    required this.selectedUsers,
    required this.onChanged,
    super.key,
  });

  final List<TMUser> users;
  final Function(List<TMUser>? users) onChanged;
  final List<TMUser> selectedUsers;

  @override
  State<TMUsersSelector> createState() => _TMUsersSelectorState();
}

class _TMUsersSelectorState extends State<TMUsersSelector> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      width: MediaQuery.sizeOf(context).width,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemCount: widget.users.length + 2,
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          if (index == widget.users.length + 1 || index == 0) {
            return const SizedBox(width: 40);
          } else {
            final user = widget.users[index - 1];
            // final isSelected = _selectedUsersId.contains(user);
            return SizedBox(
              width: 150,
              child: GestureDetector(
                onTap: () {
                  final updated = [...widget.selectedUsers];
                  setState(() {
                    widget.selectedUsers.contains(user)
                        ? updated.remove(user)
                        : updated.add(user);
                  });

                  widget.onChanged(updated);
                },
                child: Column(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [context.colors.standardShadow],
                        border: Border.all(
                          color: widget.selectedUsers.contains(user)
                              ? context.colors.splashBackground
                              : context.colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          imageUrl: user.photoUrl ?? '',
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Text(
                        user.displayNameOrEmail,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: widget.selectedUsers.contains(user)
                              ? context.colors.textColor
                              : context.colors.iconDisable,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
