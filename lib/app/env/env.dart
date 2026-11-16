import 'package:flutter_dotenv/flutter_dotenv.dart';

final class Env {
  factory Env() => _instance ??= Env._();

  Env._();

  static Env? _instance;

  // ignore: avoid-unassigned-late-fields
  static late final Environment env;

  final String googleClientId = dotenv.env['GOOGLE_CLIENT_ID'] ?? '';

  final String googleClientSecret = dotenv.env['GOOGLE_CLIENT_SECRET'] ?? '';

  final String googleRedirectUrl =
      dotenv.env['GOOGLE_OAUTH_REDIRECT_URL'] ?? '';
  final String gitHubRedirectUrl =
      dotenv.env['GITHUB_OAUTH_REDIRECT_URL'] ?? '';
  final String gitHubClientId =
      dotenv.env['GITHUB_CLIENT_ID'] ?? '';
  final String gitHubClientSecret =
      dotenv.env['GITHUB_CLIENT_SECRET'] ?? '';
  final String gitHubCallbackUrlScheme =
      dotenv.env['GITHUB_CALLBACK_URL_SCHEME'] ?? '';
  final String rustoreKey =
      dotenv.env['RUSTORE_KEY'] ?? '';
}

enum Environment { dev, prod }
