import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/app/auth/bloc/auth_bloc.dart';
import 'package:task_manager/app/auth/client/auth_service.dart';
import 'package:task_manager/app/auth/client/oauth_client/github_oauth.dart';
import 'package:task_manager/app/auth/client/oauth_client/oauth_client.dart';
import 'package:task_manager/app/auth/client/vk_auth_client.dart';
import 'package:task_manager/app/auth/repository/auth_repository.dart';
import 'package:task_manager/app/auth/repository/auth_repository_impl.dart';
import 'package:task_manager/app/auth/service/google_auth_service.dart';
import 'package:task_manager/app/clients/google_client/firebase_client.dart';
import 'package:task_manager/app/env/env.dart';
import 'package:task_manager/app/extensions/num.dart';
import 'package:task_manager/app/models/app_meta_data.dart';
import 'package:task_manager/app/utils/app_stats.dart';
import 'package:task_manager/app/widgets/inherited_dependencies.dart';
import 'package:task_manager/features/home/repository/home_repository.dart';
import 'package:task_manager/features/home/repository/home_repository_impl.dart';
import 'package:task_manager/features/notifications/bloc/notifications_bloc.dart';
import 'package:task_manager/features/notifications/client/vk_notification_client.dart';
import 'package:task_manager/features/notifications/repository/notification_repository.dart';
import 'package:task_manager/features/notifications/repository/notification_repository_impl.dart';
import 'package:task_manager/features/project/repository/projects_repository.dart';
import 'package:task_manager/features/project/repository/projects_repository_impl.dart';

typedef _InitializationStep =
    FutureOr<void> Function(DevDependencies dependencies);

abstract interface class Dependencies {
  factory Dependencies.of(BuildContext context) =>
      InheritedDependencies.of(context);

  abstract final AppStats appStats;
  abstract final Env env;
  abstract final AppMetaData metaData;
  abstract final SharedPreferences prefs;
  abstract final FlutterSecureStorage secureStorage;
  abstract final VkAuthClient vkAuthClient;
  abstract final AuthBloc authBloc;
  abstract final NotificationsBloc notificationsBloc;
  abstract final AuthRepository authRepository;
  abstract final HomeRepository homeRepository;
  abstract final ProjectsRepository projectsRepository;
  abstract final NotificationsRepository notificationsRepository;
  abstract final GoogleAuthService googleAuthService;
  abstract final AuthService authService;
  abstract final OAuthClient gitHubOAuthClient;
  abstract final OAuthClient googleOauthClient;
  abstract final FirebaseClient firebaseClient;
  abstract final VkNotificationClient vkNotificationClient;
  abstract final Dio vkNotificationDio;
}

final class DevDependencies implements Dependencies {
  @override
  late final AppStats appStats;

  @override
  late final Env env;

  @override
  late final AppMetaData metaData;

  @override
  late final SharedPreferences prefs;

  @override
  late final FlutterSecureStorage secureStorage;

  late final Dio authDio;

  @override
  late final AuthBloc authBloc;

  @override
  late final NotificationsBloc notificationsBloc;

  @override
  late final AuthRepository authRepository;

  @override
  late final HomeRepository homeRepository;

  @override
  late final ProjectsRepository projectsRepository;

  @override
  late final NotificationsRepository notificationsRepository;

  @override
  late final GoogleAuthService googleAuthService;

  @override
  late final OAuthClient gitHubOAuthClient;

  @override
  late final OAuthClient googleOauthClient;

  @override
  late final VkAuthClient vkAuthClient;

  @override
  late final VkNotificationClient vkNotificationClient;

  @override
  late final Dio vkNotificationDio;

  @override
  late final AuthService authService;

  @override
  late final FirebaseClient firebaseClient;

  static Future<Dependencies> initialize({
    void Function(double progress, String message)? onProgress,
  }) async {
    final dependencies = DevDependencies();
    final totalSteps = _initializationSteps.length;
    int currentStep = 0;
    for (final step in _initializationSteps.entries) {
      currentStep++;
      final progress = currentStep / totalSteps;
      onProgress?.call(progress, step.key);
      if (kDebugMode) {
        debugPrint(
          'Initialization | ${currentStep.formatted}/${totalSteps.formatted} (${NumberFormat.percentPattern().format(progress)}) | "${step.key}"',
        );
      }
      await step.value(dependencies);
    }
    return dependencies;
  }

  static final Map<String, _InitializationStep> _initializationSteps =
      <String, _InitializationStep>{
        'Environment initialization': (dependencies) async {
          Env.env =
              const String.fromEnvironment('env', defaultValue: 'dev') == 'dev'
              ? Environment.dev
              : Environment.prod;
          switch (Env.env) {
            case Environment.dev:
              await dotenv.load(fileName: '.configs/dev/configs.env');
            case Environment.prod:
              await dotenv.load(fileName: '.configs/prod/configs.env');
          }
          dependencies.env = Env();
        },
        'Meta Data initialization': (dependencies) async {
          final packageInfo = await PackageInfo.fromPlatform();
          dependencies.metaData = AppMetaData(
            version: packageInfo.version,
            buildNumber: packageInfo.buildNumber,
          );
        },
        'Shared preferences initialization': (dependencies) async =>
            dependencies.prefs = await SharedPreferences.getInstance(),
        'Secure storage initialization': (DevDependencies dependencies) async {
          await const FlutterSecureStorage().readAll();
          dependencies.secureStorage = const FlutterSecureStorage();
        },
        'App stats initialization': (dependencies) async {
          dependencies.appStats = AppStats(prefs: dependencies.prefs);
          await dependencies.appStats.initialize();
        },
        'Auth initialization': (dependencies) async {
          dependencies.firebaseClient = FirebaseClient();
          await dependencies.firebaseClient.initial();
          dependencies
            ..googleAuthService = GoogleAuthService()
            ..vkAuthClient = VkAuthClient()
            ..authService = AuthService()
            ..gitHubOAuthClient = GitHubOAuthClient(
              authService: dependencies.authService,
              clientId: dependencies.env.gitHubClientId,
              clientSecret: dependencies.env.gitHubClientSecret,
              redirectUrl: Uri.parse(dependencies.env.gitHubRedirectUrl),
            );
          await dependencies.googleAuthService.ensureInitialized();
          await dependencies.vkAuthClient.init();
          dependencies
            ..authRepository = AuthRepositoryImpl(
              googleService: dependencies.googleAuthService,
              service: dependencies.authService,
              gitHubOauth: dependencies.gitHubOAuthClient as GitHubOAuthClient,
              vkAuthClient: dependencies.vkAuthClient,
            )
            ..authBloc = AuthBloc(repository: dependencies.authRepository);

          await dependencies.authBloc.stream.firstWhere((state) {
            return state.maybeWhen(
              authed: (_) => true,
              notAuthed: (_) => true,
              error: (_, _) => true,
              orElse: () => false,
            );
          });
          debugPrint(
            'Auth check completed with state: ${dependencies.authBloc.state}',
          );
        },
        'Home Initialization': (dependencies) async {
          dependencies
            ..homeRepository = HomeRepositoryImpl(
              client: dependencies.firebaseClient,
            )
            ..projectsRepository = ProjectsRepositoryImpl(
              client: dependencies.firebaseClient,
            );
        },
        'Notifications Initialization': (dependencies) async {
          dependencies
            ..vkNotificationDio = Dio(
              BaseOptions(
                baseUrl: 'https://vkpns.rustore.ru',
                headers: {'Content-Type': 'application/json'},
              ),
            )
            ..vkNotificationDio.interceptors.add(
              InterceptorsWrapper(
                onRequest: (options, handler) {
                  options.headers['Authorization'] =
                      'Bearer ${dependencies.env.rustoreKey}';
                  handler.next(options);
                },
              ),
            )
            ..vkNotificationClient = VkNotificationClient(
              dependencies.vkNotificationDio,
            )
            ..notificationsRepository = NotificationsRepositoryImpl(
              prefs: dependencies.prefs,
            )
            ..notificationsBloc = NotificationsBloc(
              repository: dependencies.notificationsRepository,
            );
          await dependencies.notificationsRepository.initPushNotifications();
        },
        // TODO(All): remove in real project
        'Initialization complete': (_) =>
            Future<void>.delayed(const Duration(seconds: 1)),
      };
}

enum DependenciesType { dev, test }
