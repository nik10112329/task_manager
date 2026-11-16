import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:task_manager/app/auth/bloc/auth_bloc.dart';
import 'package:task_manager/app/router/app_router.gr.dart';
import 'package:task_manager/app/router/auth_guard.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|View,Route')
class AppRouter extends RootStackRouter {
  AppRouter({required this.authBloc});

  final AuthBloc authBloc;

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, path: '/splash', initial: true),
    AutoRoute(page: AuthRoute.page, path: '/auth'),
    AutoRoute(
      page: MainRoute.page,
      path: '/',
      // initial: true,
      guards: [AuthGuard(authBloc)],
      children: [
        AutoRoute(
          page: HomeRoute.page,
          path: 'home',
          guards: [AuthGuard(authBloc)],
        ),
        AutoRoute(
          page: NotificationsRoute.page,
          path: 'notifications',
          guards: [AuthGuard(authBloc)],
        ),
      ],
    ),
    AutoRoute(
      page: CreateProjectRoute.page,
      path: '/create_project',
      guards: [AuthGuard(authBloc)],
    ),
    CustomRoute(
      page: ProjectRoute.page,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
      guards: [AuthGuard(authBloc)],
      path: '/project',
      duration: const Duration(milliseconds: 300),
    ),
    CustomRoute(
      page: CreateTaskRoute.page,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
      guards: [AuthGuard(authBloc)],
      path: '/create_task',
      duration: const Duration(milliseconds: 300),
    ),
    AutoRoute(
      page: ProfileRoute.page,
      path: '/profile',
      guards: [AuthGuard(authBloc)],
    ),
    AutoRoute(
      page: TMArchiveWrapperRoute.page,
      path: '/archive',
      guards: [AuthGuard(authBloc)],
      children: [
        AutoRoute(
          page: TMSelectedProjectArchiveRoute.page,
          path: '',
          initial: true,
        ),
        AutoRoute(
          page: TMTasksArchiveRoute.page,
          path: 'archive_tasks_list',
        ),
      ],
    ),
  ];

  static AppRouter of(BuildContext context) {
    return context.read<StackRouter>() as AppRouter;
  }
}
