import 'dart:async';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/app/app.dart';
import 'package:task_manager/app/dependencies/app_initializer.dart';
import 'package:task_manager/app/logging/bloc_logging/bloc_log_observer.dart';
import 'package:task_manager/app/logging/logger.dart';
import 'package:task_manager/app/router/app_router.dart';
import 'package:task_manager/app/services/push_service.dart';
import 'package:task_manager/app/theme/app_theme_data.dart';
import 'package:task_manager/app/utils/debug_overlay.dart';
import 'package:task_manager/app/widgets/views/splash_screen.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  if (kDebugMode) {
    print('Background message: ${message.messageId}');
  }
}

void main() {
  runZonedGuarded(
    () async {
      GoogleFonts.config.allowRuntimeFetching = true;
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      Bloc.observer = const AppBlocObserver();
      Bloc.transformer = bloc_concurrency.sequential<Object?>();

      final initializationProgress =
          ValueNotifier<({double progress, String message})>((
            progress: 0,
            message: '',
          ));

      runApp(
        MaterialApp(
          darkTheme: AppThemeData.dark,
          theme: AppThemeData.light,
          home: const SplashScreen(),
        ),
      );

      final dependencies = await initializeApp(
        onProgress: (progress, message) => initializationProgress.value = (
          progress: progress,
          message: message,
        ),
        onError: (error, stackTrace) {},
      );
      await TMPushService.init(rustoreDio: dependencies.vkNotificationDio);
      FirebaseMessaging.onBackgroundMessage(
        _firebaseMessagingBackgroundHandler,
      );

      final appRouter = AppRouter(authBloc: dependencies.authBloc);
      final prefs = await SharedPreferences.getInstance();
      final isDark = prefs.getBool('is_dark_theme') ?? false;
      runApp(
        ThemeProvider(
          initTheme: isDark ? AppThemeData.dark : AppThemeData.light,
          builder: (context, theme) {
            return kDebugMode
                ? TMDebugOverlay(
                    child: App(
                      router: appRouter,
                      dependencies: dependencies,
                      theme: theme,
                    ),
                  )
                : App(
                    router: appRouter,
                    dependencies: dependencies,
                    theme: theme,
                  );
          },
        ),
      );

      await Future.delayed(const Duration(milliseconds: 1500));

      // await TMPushService.init();
    },
    logError,
    zoneSpecification: ZoneSpecification(
      print: (self, parent, zone, line) {
        parent.print(
          zone,
          '[${DateFormat('HH:mm:ss.SSS').format(DateTime.now())}] $line',
        );
      },
    ),
  );
}
