import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:task_manager/app/extensions/context.dart';
import 'package:task_manager/app/localization/generated/l10n.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/app/values/tm_icons.dart';
import 'package:task_manager/app/widgets/app_bar/app_bar.dart';
import 'package:task_manager/app/widgets/icon_button.dart';
import 'package:task_manager/features/home/bloc/home_bloc.dart';
import 'package:task_manager/features/home/view/models/home_card_data.dart';
import 'package:task_manager/features/home/view/utils/home_utils.dart';
import 'package:task_manager/features/project/models/project/project.dart';
import 'package:task_manager/features/tasks_archive/widgets/archive_scope.dart';

@RoutePage()
class TMArchiveWrapperScreen extends StatefulWidget {
  const TMArchiveWrapperScreen({super.key});

  @override
  State<TMArchiveWrapperScreen> createState() => _TMArchiveWrapperScreenState();
}

class _TMArchiveWrapperScreenState extends State<TMArchiveWrapperScreen> {
  late final HomeBloc _homeBloc =
      HomeBloc(repository: context.dependencies.homeRepository)..add(
        HomeEvent.initialize(
          userId: context.dependencies.authBloc.state.user?.id,
        ),
      );

  final Map<String, List<TMHomeCardData>> tasksMap = {};
  List<TMProject> projects = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilderWithSideEffects<HomeBloc, HomeState, HomeSideEffect>(
      bloc: _homeBloc,
      sideEffectsListener: (context, sideEffect) {
        sideEffect.mapOrNull(
          projectFetched: (_) {
            projects
              ..clear()
              ..addAll(_homeBloc.state.projects ?? []);

            _homeBloc.add(
              HomeEvent.fetchTasks(
                projectsIds: projects.map((e) => e.id).toList(),
              ),
            );
          },
        );
      },
      builder: (context, state) {
        tasksMap
          ..clear()
          ..addAll(HomeUtils.fetchTasksFromProject(_homeBloc.state.tasks));
        return ArchiveScope(
          projects: projects,
          child: Scaffold(
            backgroundColor: context.colors.background,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: TMAppBar(
                leadingPadding: const EdgeInsets.only(left: 20),
                leading: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: TMIconButton(
                    iconData: TmIcons.leftArrow,
                    color: context.colors.iconColor,
                    iconSize: 25,
                    onTap: () {
                      if (context.router.canPop()) {
                        context.router.pop();
                      } else {
                        context.pop();
                      }
                    },
                  ),
                ),
                title: Text(
                  S.of(context).task_archive,
                  style: context.styles.h1,
                ),
              ),
            ),
            body: state.isLoadingProjects
                ? const Center(child: CircularProgressIndicator())
                : const AutoRouter(),
          ),
        );
      },
    );
  }
}
