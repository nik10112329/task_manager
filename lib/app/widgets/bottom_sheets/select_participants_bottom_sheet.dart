import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:task_manager/app/auth/model/user_model.dart';
import 'package:task_manager/app/extensions/context.dart';
import 'package:task_manager/app/localization/generated/l10n.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/app/values/tm_icons.dart';
import 'package:task_manager/app/widgets/wrappers/clickable.dart';
import 'package:task_manager/features/project/repository/projects_repository_impl.dart';
import 'package:task_manager/features/search_users/bloc/search_users_bloc.dart';

class SelectUsersBottomSheet extends StatefulWidget {
  const SelectUsersBottomSheet({
    required this.alreadySelected,
    required this.onChanged,
    this.initialUsers = const [],
    this.isSingleSelection = false,
    super.key,
  });

  final Map<String, String> alreadySelected;
  final bool isSingleSelection;
  final List<TMUser> initialUsers;

  final Function(Map<String, String> selectedUsers) onChanged;

  @override
  State<SelectUsersBottomSheet> createState() => _SelectUsersBottomSheetState();
}

class _SelectUsersBottomSheetState extends State<SelectUsersBottomSheet> {
  final TextEditingController _searchController = TextEditingController();
  late final SearchUsersBloc _bloc;
  final Map<String, String> _selectedUsers = {};
  List<TMUser> _users = [];

  //bool _isLoading = false;

  @override
  void initState() {
    if (mounted) {
      _selectedUsers.addAll(widget.alreadySelected);
      _users = widget.initialUsers;
      _bloc = SearchUsersBloc(
        repository: ProjectsRepositoryImpl(
          client: context.dependencies.firebaseClient,
        ),
      );
      if (_users.isEmpty) {
        _performSearch('');
      }
    }
    super.initState();
  }

  Future<void> _performSearch(String query) async {
    // setState(() => _isLoading = true);
    _bloc.add(SearchUsersEvent.searchUsers(searchQuery: query, limit: 10));
    // try {
    //   if (mounted) {
    //     setState(() => _users = _bloc.state.users);
    //   }
    // } finally {
    //   if (mounted) setState(() => _isLoading = false);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchUsersBloc, SearchUsersState>(
      bloc: _bloc,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.75,
            decoration: BoxDecoration(
              color: context.colors.secondary,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    S.of(context).select_participants,
                    style: context.styles.h1.copyWith(fontSize: 22),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _searchController,
                    style: context.styles.textStyle,
                    onChanged: _performSearch,
                    decoration: InputDecoration(
                      hintText: S.of(context).search_by_name_email,
                      hintStyle: context.styles.textStyle,
                      prefixIcon: const Icon(Icons.search),
                      prefixIconColor: context.colors.textColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                          color: context.colors.textColor.withValues(
                            alpha: 0.7,
                          ),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                          color: context.colors.textColor.withValues(
                            alpha: 0.7,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          if (state.isLoading)
                            const CircularProgressIndicator(),
                          ...List.generate(state.users.length, (index) {
                            return Clickable(
                              onTap: () {
                                if (!widget.isSingleSelection &&
                                    !_selectedUsers.containsKey(
                                      state.users[index].id,
                                    )) {
                                  _selectedUsers[state.users[index].id] =
                                      state.users[index].photoUrl ?? '';
                                } else if (widget.isSingleSelection) {
                                  _selectedUsers
                                    ..clear()
                                    ..[state.users[index].id] =
                                        state.users[index].photoUrl ?? '';
                                } else {
                                  _selectedUsers.remove(state.users[index].id);
                                }
                                setState(() {});
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width - 40,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: 20,
                                  ),
                                  decoration: BoxDecoration(
                                    color: context.colors.secondary,
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      state.users[index].photoUrl != null
                                          ? ClipOval(
                                              child: SizedBox(
                                                width: 40,
                                                height: 40,
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      state
                                                          .users[index]
                                                          .photoUrl ??
                                                      '',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            )
                                          : Icon(
                                              TmIcons.profile,
                                              color: context.colors.iconColor,
                                              size: 28,
                                            ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 40,
                                          ),
                                          child: Text(
                                            state
                                                .users[index]
                                                .displayNameOrEmail,
                                            style: context.styles.textStyle
                                                .copyWith(
                                                  color:
                                                      context.colors.textColor,
                                                ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                      _selectedUsers.containsKey(
                                            state.users[index].id,
                                          )
                                          ? DecoratedBox(
                                              decoration: BoxDecoration(
                                                color: context.colors.primary,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                  4,
                                                ),
                                                child: Icon(
                                                  Icons.check,
                                                  color:
                                                      context.colors.secondary,
                                                ),
                                              ),
                                            )
                                          : DecoratedBox(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: context.colors.primary,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                  4,
                                                ),
                                                child: Icon(
                                                  Icons.add,
                                                  color: context.colors.primary,
                                                ),
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Clickable(
                    onTap: () {
                      widget.onChanged(_selectedUsers);
                      context.pop();
                    },

                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: context.colors.primary,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Center(
                        child: Text(
                          S.of(context).done,
                          style: context.styles.textStyle.copyWith(
                            color: context.colors.white,
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
