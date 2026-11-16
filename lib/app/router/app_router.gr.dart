// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i16;
import 'package:task_manager/app/auth/screens/auth_screen.dart' as _i1;
import 'package:task_manager/app/widgets/views/splash_screen.dart' as _i10;
import 'package:task_manager/features/home/models/task/task.dart' as _i17;
import 'package:task_manager/features/home/view/calendar_view.dart' as _i2;
import 'package:task_manager/features/home/view/home_screen.dart' as _i5;
import 'package:task_manager/features/home/view/main_view.dart' as _i6;
import 'package:task_manager/features/notifications/view/notifications_screen.dart'
    as _i7;
import 'package:task_manager/features/profile/view/profile_view.dart' as _i8;
import 'package:task_manager/features/project/models/project/project.dart'
    as _i15;
import 'package:task_manager/features/project/view/create_project_screen.dart'
    as _i3;
import 'package:task_manager/features/project/view/create_task_screen.dart'
    as _i4;
import 'package:task_manager/features/project/view/project_screen.dart' as _i9;
import 'package:task_manager/features/tasks_archive/screens/arhive_screen.dart'
    as _i11;
import 'package:task_manager/features/tasks_archive/screens/selected_project_screen.dart'
    as _i12;
import 'package:task_manager/features/tasks_archive/screens/tasks_screen.dart'
    as _i13;

/// generated route for
/// [_i1.AuthScreen]
class AuthRoute extends _i14.PageRouteInfo<void> {
  const AuthRoute({List<_i14.PageRouteInfo>? children})
    : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthScreen();
    },
  );
}

/// generated route for
/// [_i2.CalendarView]
class CalendarRoute extends _i14.PageRouteInfo<void> {
  const CalendarRoute({List<_i14.PageRouteInfo>? children})
    : super(CalendarRoute.name, initialChildren: children);

  static const String name = 'CalendarRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i2.CalendarView();
    },
  );
}

/// generated route for
/// [_i3.CreateProjectScreen]
class CreateProjectRoute extends _i14.PageRouteInfo<CreateProjectRouteArgs> {
  CreateProjectRoute({
    required dynamic Function(_i15.TMProject) createProject,
    _i16.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         CreateProjectRoute.name,
         args: CreateProjectRouteArgs(createProject: createProject, key: key),
         initialChildren: children,
       );

  static const String name = 'CreateProjectRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateProjectRouteArgs>();
      return _i3.CreateProjectScreen(
        createProject: args.createProject,
        key: args.key,
      );
    },
  );
}

class CreateProjectRouteArgs {
  const CreateProjectRouteArgs({required this.createProject, this.key});

  final dynamic Function(_i15.TMProject) createProject;

  final _i16.Key? key;

  @override
  String toString() {
    return 'CreateProjectRouteArgs{createProject: $createProject, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CreateProjectRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [_i4.CreateTaskScreen]
class CreateTaskRoute extends _i14.PageRouteInfo<CreateTaskRouteArgs> {
  CreateTaskRoute({
    required dynamic Function(_i17.TMTask) createTask,
    required _i15.TMProject project,
    _i16.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         CreateTaskRoute.name,
         args: CreateTaskRouteArgs(
           createTask: createTask,
           project: project,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'CreateTaskRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateTaskRouteArgs>();
      return _i4.CreateTaskScreen(
        createTask: args.createTask,
        project: args.project,
        key: args.key,
      );
    },
  );
}

class CreateTaskRouteArgs {
  const CreateTaskRouteArgs({
    required this.createTask,
    required this.project,
    this.key,
  });

  final dynamic Function(_i17.TMTask) createTask;

  final _i15.TMProject project;

  final _i16.Key? key;

  @override
  String toString() {
    return 'CreateTaskRouteArgs{createTask: $createTask, project: $project, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CreateTaskRouteArgs) return false;
    return project == other.project && key == other.key;
  }

  @override
  int get hashCode => project.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i5.HomeScreen]
class HomeRoute extends _i14.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    required _i16.ValueNotifier<_i16.Widget?> profileWidgetNotifier,
    required _i16.ValueNotifier<bool> navBarShadowNotifier,
    required _i16.ValueNotifier<bool> appBarShadowNotifier,
    int tabIndex = 0,
    _i16.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         HomeRoute.name,
         args: HomeRouteArgs(
           profileWidgetNotifier: profileWidgetNotifier,
           navBarShadowNotifier: navBarShadowNotifier,
           appBarShadowNotifier: appBarShadowNotifier,
           tabIndex: tabIndex,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'HomeRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeRouteArgs>();
      return _i5.HomeScreen(
        profileWidgetNotifier: args.profileWidgetNotifier,
        navBarShadowNotifier: args.navBarShadowNotifier,
        appBarShadowNotifier: args.appBarShadowNotifier,
        tabIndex: args.tabIndex,
        key: args.key,
      );
    },
  );
}

class HomeRouteArgs {
  const HomeRouteArgs({
    required this.profileWidgetNotifier,
    required this.navBarShadowNotifier,
    required this.appBarShadowNotifier,
    this.tabIndex = 0,
    this.key,
  });

  final _i16.ValueNotifier<_i16.Widget?> profileWidgetNotifier;

  final _i16.ValueNotifier<bool> navBarShadowNotifier;

  final _i16.ValueNotifier<bool> appBarShadowNotifier;

  final int tabIndex;

  final _i16.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{profileWidgetNotifier: $profileWidgetNotifier, navBarShadowNotifier: $navBarShadowNotifier, appBarShadowNotifier: $appBarShadowNotifier, tabIndex: $tabIndex, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! HomeRouteArgs) return false;
    return profileWidgetNotifier == other.profileWidgetNotifier &&
        navBarShadowNotifier == other.navBarShadowNotifier &&
        appBarShadowNotifier == other.appBarShadowNotifier &&
        tabIndex == other.tabIndex &&
        key == other.key;
  }

  @override
  int get hashCode =>
      profileWidgetNotifier.hashCode ^
      navBarShadowNotifier.hashCode ^
      appBarShadowNotifier.hashCode ^
      tabIndex.hashCode ^
      key.hashCode;
}

/// generated route for
/// [_i6.MainView]
class MainRoute extends _i14.PageRouteInfo<void> {
  const MainRoute({List<_i14.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i6.MainView();
    },
  );
}

/// generated route for
/// [_i7.NotificationsScreen]
class NotificationsRoute extends _i14.PageRouteInfo<NotificationsRouteArgs> {
  NotificationsRoute({
    required _i16.ValueNotifier<bool> navBarShadowNotifier,
    required _i16.ValueNotifier<bool> appBarShadowNotifier,
    int tabIndex = 1,
    _i16.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         NotificationsRoute.name,
         args: NotificationsRouteArgs(
           navBarShadowNotifier: navBarShadowNotifier,
           appBarShadowNotifier: appBarShadowNotifier,
           tabIndex: tabIndex,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'NotificationsRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NotificationsRouteArgs>();
      return _i7.NotificationsScreen(
        navBarShadowNotifier: args.navBarShadowNotifier,
        appBarShadowNotifier: args.appBarShadowNotifier,
        tabIndex: args.tabIndex,
        key: args.key,
      );
    },
  );
}

class NotificationsRouteArgs {
  const NotificationsRouteArgs({
    required this.navBarShadowNotifier,
    required this.appBarShadowNotifier,
    this.tabIndex = 1,
    this.key,
  });

  final _i16.ValueNotifier<bool> navBarShadowNotifier;

  final _i16.ValueNotifier<bool> appBarShadowNotifier;

  final int tabIndex;

  final _i16.Key? key;

  @override
  String toString() {
    return 'NotificationsRouteArgs{navBarShadowNotifier: $navBarShadowNotifier, appBarShadowNotifier: $appBarShadowNotifier, tabIndex: $tabIndex, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NotificationsRouteArgs) return false;
    return navBarShadowNotifier == other.navBarShadowNotifier &&
        appBarShadowNotifier == other.appBarShadowNotifier &&
        tabIndex == other.tabIndex &&
        key == other.key;
  }

  @override
  int get hashCode =>
      navBarShadowNotifier.hashCode ^
      appBarShadowNotifier.hashCode ^
      tabIndex.hashCode ^
      key.hashCode;
}

/// generated route for
/// [_i8.ProfileView]
class ProfileRoute extends _i14.PageRouteInfo<void> {
  const ProfileRoute({List<_i14.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i8.ProfileView();
    },
  );
}

/// generated route for
/// [_i9.ProjectScreen]
class ProjectRoute extends _i14.PageRouteInfo<ProjectRouteArgs> {
  ProjectRoute({
    required _i15.TMProject project,
    required _i16.VoidCallback onChanged,
    _i16.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         ProjectRoute.name,
         args: ProjectRouteArgs(
           project: project,
           onChanged: onChanged,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'ProjectRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProjectRouteArgs>();
      return _i9.ProjectScreen(
        project: args.project,
        onChanged: args.onChanged,
        key: args.key,
      );
    },
  );
}

class ProjectRouteArgs {
  const ProjectRouteArgs({
    required this.project,
    required this.onChanged,
    this.key,
  });

  final _i15.TMProject project;

  final _i16.VoidCallback onChanged;

  final _i16.Key? key;

  @override
  String toString() {
    return 'ProjectRouteArgs{project: $project, onChanged: $onChanged, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProjectRouteArgs) return false;
    return project == other.project &&
        onChanged == other.onChanged &&
        key == other.key;
  }

  @override
  int get hashCode => project.hashCode ^ onChanged.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i10.SplashScreen]
class SplashRoute extends _i14.PageRouteInfo<void> {
  const SplashRoute({List<_i14.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i10.SplashScreen();
    },
  );
}

/// generated route for
/// [_i11.TMArchiveWrapperScreen]
class TMArchiveWrapperRoute extends _i14.PageRouteInfo<void> {
  const TMArchiveWrapperRoute({List<_i14.PageRouteInfo>? children})
    : super(TMArchiveWrapperRoute.name, initialChildren: children);

  static const String name = 'TMArchiveWrapperRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i11.TMArchiveWrapperScreen();
    },
  );
}

/// generated route for
/// [_i12.TMSelectedProjectArchiveScreen]
class TMSelectedProjectArchiveRoute extends _i14.PageRouteInfo<void> {
  const TMSelectedProjectArchiveRoute({List<_i14.PageRouteInfo>? children})
    : super(TMSelectedProjectArchiveRoute.name, initialChildren: children);

  static const String name = 'TMSelectedProjectArchiveRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i12.TMSelectedProjectArchiveScreen();
    },
  );
}

/// generated route for
/// [_i13.TMTasksArchiveScreen]
class TMTasksArchiveRoute extends _i14.PageRouteInfo<TMTasksArchiveRouteArgs> {
  TMTasksArchiveRoute({
    required _i15.TMProject project,
    _i16.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         TMTasksArchiveRoute.name,
         args: TMTasksArchiveRouteArgs(project: project, key: key),
         initialChildren: children,
       );

  static const String name = 'TMTasksArchiveRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TMTasksArchiveRouteArgs>();
      return _i13.TMTasksArchiveScreen(project: args.project, key: args.key);
    },
  );
}

class TMTasksArchiveRouteArgs {
  const TMTasksArchiveRouteArgs({required this.project, this.key});

  final _i15.TMProject project;

  final _i16.Key? key;

  @override
  String toString() {
    return 'TMTasksArchiveRouteArgs{project: $project, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TMTasksArchiveRouteArgs) return false;
    return project == other.project && key == other.key;
  }

  @override
  int get hashCode => project.hashCode ^ key.hashCode;
}
