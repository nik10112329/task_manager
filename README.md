# How to use
Select [empty-template](https://gitlab.com/umbrella-web/flutter/template/-/tree/empty-template) branch and [download archive](https://gitlab.com/umbrella-web/flutter/template/-/archive/empty-template/template-empty-template.zip). Change Bundle ID and Package Name.

## Stack

[**Dart**](https://dart.dev/), [**Flutter**](https://flutter.dev/),
[**BLoC**](https://bloclibrary.dev/#/), [**Go Router**](https://pub.dev/packages/go_router)

## Installing Flutter environment

- [**install Flutter**](https://docs.flutter.dev/get-started/install)
- for iOS build [**install Xcode**](https://developer.apple.com/xcode/) +
  [**CocoaPods**](https://guides.cocoapods.org/using/getting-started.html#installation)
- for Android build [**install Android Studio**](https://developer.android.com/studio/)
- add Flutter path to shell config(ex: .zshrc or .bashrc):

```bash
$ nano ~/.zshrc
```

add with **changed** Flutter path

```
export PATH="$PATH:<path to flutter>/bin"
```

save and run

```bash
$ source ~/.zshrc
```

## How to run

- add *env=prod* (default **dev**) define argument to run prod environment

```bash
$ flutter run --dart-define="env=prod"
```

## IDEA templates
Read more about [**templates**](templates/README.md)


## Project structure
```
├── assets                                                  - also contains environment configuration
│   └── env_configs                                         - add environment variables to env files, add folder to gitignore if necessary
│       ├── dev
│       │   └── configs.env
│       └── prod
│           └── configs.env
├── lib
│   ├── app                                                 - contains core and common application functionality
│   │   ├── app.dart                                        - application widget
│   │   ├── core
│   │   │   ├── app_initializer.dart                        - place where dependencies are actually initialized
│   │   │   ├── app_meta_data.dart                          - implement different meta data like run count here 
│   │   │   └── env.dart                                    - add env variables reading here
│   │   ├── dependencies
│   │   │   └── dependencies.dart                           - initialize dependencies here
│   │   ├── dio_interceptors                                - implement dio interceptor like auth interceptor
│   │   │   └── log_interceptor.dart
│   │   ├── extensions                                      - add common extensions here
│   │   │   ├── context.dart
│   │   │   └── string.dart
│   │   ├── localization                                    - append localization stings to arb files
│   │   │   ├── generated
│   │   │   │   ├── intl
│   │   │   │   │   ├── messages_all.dart
│   │   │   │   │   ├── messages_en.dart
│   │   │   │   │   └── messages_ru.dart
│   │   │   │   └── l10n.dart
│   │   │   ├── intl_en.arb
│   │   │   └── intl_ru.arb
│   │   ├── logging
│   │   │   ├── bloc_logging
│   │   │   │   ├── bloc_log.dart                           - append new BLoCs to _blocLogLevelsMap 
│   │   │   │   └── bloc_log_observer.dart
│   │   │   ├── log_hub.dart                                - enable/disable logging
│   │   │   └── logger.dart                                 - implement remote logging(Crashlytics, Sentry)
│   │   ├── router
│   │   │   └── app_router.dart                             - add routes
│   │   ├── theme
│   │   │   ├── app_theme_data.dart                         - modify themes data here
│   │   │   ├── app_theme_extensions.dart                   - implement theme extensions(theme_tailor)
│   │   │   ├── app_theme_extensions.tailor.dart
│   │   │   ├── app_theme_extensions_colors.dart            - add colors froma Figma here
│   │   │   └── app_theme_extensions_text_styles.dart       - use google_fonts
│   │   ├── utils                                           - common utils
│   │   │   ├── dio_options.dart
│   │   │   └── validators.dart
│   │   ├── values
│   │   │   ├── assets.gen.dart                             - generate assets via flutter_gen
│   │   └── widgets                                         - add common app widgets here
│   │       ├── app_bar
│   │       │   ├── category_app_bar.dart
│   │       │   ├── search_field.dart
│   │       │   └── template_app_bar.dart
│   │       ├── app_version.dart                        
│   │       ├── inherited_dependencies.dart
│   │       ├── root_view.dart                              - root widget with bottom tabs
│   │       ├── splash_screen.dart
│   │       └── wrappers                                    - prefer widget wrappers not constant values
│   │           ├── clickable.dart
│   │           ├── disabler.dart
│   │           └── paddings.dart
│   ├── features                                            - contains application features
│   │   ├── auth                                            - typical feature structure
│   │   │   ├── bloc                                        - flutter_bloc_side_effect + freezed without effects
│   │   │   │   ├── auth_bloc.dart
│   │   │   │   ├── auth_bloc.freezed.dart
│   │   │   │   ├── auth_event.dart
│   │   │   │   └── auth_state.dart
│   │   │   ├── clients                                     - use retrofit for REST clients
│   │   │   │   ├── auth_rest_client.dart       
│   │   │   │   └── auth_rest_client.g.dart            
│   │   │   ├── models                                      - use freezed + json_serializable
│   │   │   │   ├── user.dart
│   │   │   │   ├── user.freezed.dart
│   │   │   │   └── user.g.dart
│   │   │   ├── repository
│   │   │   │   ├── auth_repository.dart
│   │   │   │   └── auth_repository_impl.dart
│   │   │   └── view
│   │   │        └── auth_view.dart
│   │   ├── cart
│   │   │   └── view
│   │   │       ├── cart_view.dart
│   │   │       └── detail_view.dart
│   │   ├── ip_location
│   │   │   ├── bloc                                        - flutter_bloc_side_effect with side effect example
│   │   │   │   ├── location_bloc.dart
│   │   │   │   ├── location_bloc.freezed.dart
│   │   │   │   ├── location_event.dart
│   │   │   │   ├── location_side_effect.dart
│   │   │   │   └── location_state.dart
│   │   │   ├── clients                                     - retrofit REST client examples
│   │   │   │   ├── ip
│   │   │   │   │   ├── ip_rest_client.dart
│   │   │   │   │   └── ip_rest_client.g.dart
│   │   │   │   └── ip_info
│   │   │   │       ├── ip_info_rest_client.dart
│   │   │   │       └── ip_info_rest_client.g.dart
│   │   │   ├── models                                      - freezed + json_serializable example
│   │   │   │   └── ip_location
│   │   │   │       ├── ip_location.dart
│   │   │   │       ├── ip_location.freezed.dart
│   │   │   │       └── ip_location.g.dart
│   │   │   ├── repository                                  - describe data providing contract to the domain layer in abstraction
│   │   │   │   ├── ip_location_repository.dart
│   │   │   │   └── ip_location_repository_impl.dart
│   │   │   └── view                                        - implement widgets here
│   │   │       ├── location_view.dart
│   │   │       └── widgets
│   │   │           ├── location_info.dart
│   │   │           └── location_text.dart
│   │   ├── profile
│   │   │   └── view
│   │   │       └── profile_view.dart
│   │   └── search
│   │       └── view
│   │           └── search_view.dart
└── └── main.dart                                           - entry point to the application
```