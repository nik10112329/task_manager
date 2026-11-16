# Task Manager

Пет-проект «Таск-менеджер» на **Flutter** с бэкендом на **Firebase**.

> **Статус бэкенда:** серверная часть переписывается на собственный сервис на **Go** ([task-manager_backend](https://github.com/nik10112329/task-manager_backend)). В текущей версии приложение работает с Firebase, подключение Go-бэкенда ещё не включено.

## Возможности

- Создание и управление проектами
- Создание задач и управление ими (статусы, теги, дедлайны, ответственные)
- Архив задач, поиск пользователей
- Авторизация через **Google**, **GitHub** и **VK ID** (OAuth 2.0)
- Push- и локальные уведомления (Firebase Cloud Messaging, RuStore Push)
- Светлая/тёмная тема, кастомные шейдеры, локализация (русский / английский)

## Стек

- **Dart**, **Flutter**
- **BLoC** — flutter_bloc + side effects + bloc_concurrency
- **Кодогенерация** — Freezed, json_serializable, build_runner, Retrofit, AutoRoute, flutter_gen, theme_tailor
- **Firebase** — Firestore, Cloud Functions, Cloud Messaging, Crashlytics
- **Dio**, OAuth 2.0, JWT, Secure Storage
- **Flutter Shaders** — кастомные GLSL-эффекты

## Как запустить

1. Установи Flutter — [docs.flutter.dev/get-started/install](https://docs.flutter.dev/get-started/install).
2. Добавь файлы окружения с секретами (см. ниже) — в git они **не** попадают.
3. Подложи `android/app/google-services.json` и `ios/Runner/GoogleService-Info.plist` от своего Firebase-проекта.
4. Установи зависимости и запусти:

```bash
flutter pub get
flutter run --dart-define="env=dev"    # dev-окружение (по умолчанию)
flutter run --dart-define="env=prod"   # prod-окружение
```

## Окружение

Секреты хранятся в `.configs/dev/configs.env` и `.configs/prod/configs.env` (эти файлы gitignored). Формат:

```
BASE_URL=
GOOGLE_CLIENT_ID=
GOOGLE_CLIENT_SECRET=
GOOGLE_OAUTH_REDIRECT_URL=
GITHUB_CLIENT_ID=
GITHUB_CLIENT_SECRET=
GITHUB_OAUTH_REDIRECT_URL=
GITHUB_CALLBACK_URL_SCHEME=
VK_CLIENT_ID=
VK_CLIENT_SECRET=
VK_CLIENT_SERVICE=
OAUTH_CLIENT_ID=
OAUTH_SCHEME=
OAUTH_HOST=
RUSTORE_KEY=
```
