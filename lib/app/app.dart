import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:task_manager/app/auth/bloc/auth_bloc.dart';
import 'package:task_manager/app/dependencies/dependencies.dart';
import 'package:task_manager/app/localization/generated/l10n.dart';
import 'package:task_manager/app/router/app_router.dart';
import 'package:task_manager/app/router/app_router.gr.dart';
import 'package:task_manager/app/theme/app_theme_data.dart';
import 'package:task_manager/app/widgets/inherited_dependencies.dart';

class App extends StatefulWidget {
  const App({
    required this.dependencies,
    required this.router,
    required this.theme,
    super.key,
  });

  final AppRouter router;
  final Dependencies dependencies;
  final ThemeData theme;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // @override
  // void initState() {
  //   TMPushService.init(rustoreDio: widget.dependencies.vkNotificationDio);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return InheritedDependencies(
      dependencies: widget.dependencies,
      child: BlocListener<AuthBloc, AuthState>(
        bloc: widget.dependencies.authBloc,
        listener: (context, state) {
          state.mapOrNull(
            authed: (state) async {
              await widget.router.replace(const MainRoute());
            },
            notAuthed: (state) async {
              await widget.router.replace(const AuthRoute());
            },
          );
        },
        child: MaterialApp.router(
          title: 'template',
          theme: widget.theme,
          darkTheme: AppThemeData.dark,
          localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en'), Locale('ru')],
          routerConfig: widget.router.config(),
          builder: (context, child) {
            return ThemeSwitchingArea(
              child: child!,
            );
          },
        ),
      ),
    );
  }
}
