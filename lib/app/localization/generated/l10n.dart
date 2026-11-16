// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `IP-локация`
  String get ipLocation {
    return Intl.message('IP-локация', name: 'ipLocation', desc: '', args: []);
  }

  /// `Корзина`
  String get cart {
    return Intl.message('Корзина', name: 'cart', desc: '', args: []);
  }

  /// `Профиль`
  String get profile {
    return Intl.message('Профиль', name: 'profile', desc: '', args: []);
  }

  /// `Поиск`
  String get search {
    return Intl.message('Поиск', name: 'search', desc: '', args: []);
  }

  /// `Очистить`
  String get clear {
    return Intl.message('Очистить', name: 'clear', desc: '', args: []);
  }

  /// `Личный кабинет`
  String get personal_account {
    return Intl.message(
      'Личный кабинет',
      name: 'personal_account',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home_view_header {
    return Intl.message('Home', name: 'home_view_header', desc: '', args: []);
  }

  /// `Hello {name}!`
  String welcome_message(String name) {
    return Intl.message(
      'Hello $name!',
      name: 'welcome_message',
      desc: 'Welcome message with name parameter',
      args: [name],
    );
  }

  /// `Have a nice day`
  String get welcome_wishes {
    return Intl.message(
      'Have a nice day',
      name: 'welcome_wishes',
      desc: '',
      args: [],
    );
  }

  /// `Task Manager`
  String get task_manager {
    return Intl.message(
      'Task Manager',
      name: 'task_manager',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Log in`
  String get log_in {
    return Intl.message('Log in', name: 'log_in', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Забыли пароль?`
  String get forgot_password {
    return Intl.message(
      'Забыли пароль?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Зарегистрироваться`
  String get sign_up {
    return Intl.message(
      'Зарегистрироваться',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Новый пользователь?`
  String get new_user {
    return Intl.message(
      'Новый пользователь?',
      name: 'new_user',
      desc: '',
      args: [],
    );
  }

  /// `Или продолжить с`
  String get or_continue_with {
    return Intl.message(
      'Или продолжить с',
      name: 'or_continue_with',
      desc: '',
      args: [],
    );
  }

  /// `Добавить участников`
  String get add_participants {
    return Intl.message(
      'Добавить участников',
      name: 'add_participants',
      desc: '',
      args: [],
    );
  }

  /// `Участники`
  String get participants {
    return Intl.message('Участники', name: 'participants', desc: '', args: []);
  }

  /// `Владелец`
  String get owner {
    return Intl.message('Владелец', name: 'owner', desc: '', args: []);
  }

  /// `Название проекта`
  String get project_name {
    return Intl.message(
      'Название проекта',
      name: 'project_name',
      desc: '',
      args: [],
    );
  }

  /// `Дата начала`
  String get start_date {
    return Intl.message('Дата начала', name: 'start_date', desc: '', args: []);
  }

  /// `Дата окончания`
  String get end_date {
    return Intl.message('Дата окончания', name: 'end_date', desc: '', args: []);
  }

  /// `дд месяц гггг`
  String get date_placeholder {
    return Intl.message(
      'дд месяц гггг',
      name: 'date_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Создать проект`
  String get create_project {
    return Intl.message(
      'Создать проект',
      name: 'create_project',
      desc: '',
      args: [],
    );
  }

  /// `Создать`
  String get create {
    return Intl.message('Создать', name: 'create', desc: '', args: []);
  }

  /// `Выбрать участников`
  String get select_participants {
    return Intl.message(
      'Выбрать участников',
      name: 'select_participants',
      desc: '',
      args: [],
    );
  }

  /// `Поиск по имени или email`
  String get search_by_name_email {
    return Intl.message(
      'Поиск по имени или email',
      name: 'search_by_name_email',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message('Done', name: 'done', desc: '', args: []);
  }

  /// `Задачи`
  String get tasks {
    return Intl.message('Задачи', name: 'tasks', desc: '', args: []);
  }

  /// `Уведомления:`
  String get notifications_with_colon {
    return Intl.message(
      'Уведомления:',
      name: 'notifications_with_colon',
      desc: '',
      args: [],
    );
  }

  /// `Пока нет уведомлений`
  String get no_notifications_yet {
    return Intl.message(
      'Пока нет уведомлений',
      name: 'no_notifications_yet',
      desc: '',
      args: [],
    );
  }

  /// `Задачи проекта:`
  String get project_tasks {
    return Intl.message(
      'Задачи проекта:',
      name: 'project_tasks',
      desc: '',
      args: [],
    );
  }

  /// `Проект обновлён`
  String get project_update {
    return Intl.message(
      'Проект обновлён',
      name: 'project_update',
      desc: '',
      args: [],
    );
  }

  /// `Задача удалена`
  String get task_deleted {
    return Intl.message(
      'Задача удалена',
      name: 'task_deleted',
      desc: '',
      args: [],
    );
  }

  /// `Удалить`
  String get delete {
    return Intl.message('Удалить', name: 'delete', desc: '', args: []);
  }

  /// `Отмена`
  String get cancel {
    return Intl.message('Отмена', name: 'cancel', desc: '', args: []);
  }

  /// `Удалить задачу "{task_name}"`
  String remove_task_name(String task_name) {
    return Intl.message(
      'Удалить задачу "$task_name"',
      name: 'remove_task_name',
      desc: 'Удаление задачи с названием имени',
      args: [task_name],
    );
  }

  /// `Сохранить`
  String get save {
    return Intl.message('Сохранить', name: 'save', desc: '', args: []);
  }

  /// `Назначить`
  String get appoint {
    return Intl.message('Назначить', name: 'appoint', desc: '', args: []);
  }

  /// `1 ответсвенный`
  String get one_responsible_person {
    return Intl.message(
      '1 ответсвенный',
      name: 'one_responsible_person',
      desc: '',
      args: [],
    );
  }

  /// `${_localResponsibleIds.length} ответственных`
  String responsibility_length(int local_responsible_length) {
    return Intl.message(
      '\${_localResponsibleIds.length} ответственных',
      name: 'responsibility_length',
      desc: 'Количество ответственных',
      args: [local_responsible_length],
    );
  }

  /// `Дедлайн`
  String get deadline {
    return Intl.message('Дедлайн', name: 'deadline', desc: '', args: []);
  }

  /// `Введите название задачи`
  String get enter_the_task_name {
    return Intl.message(
      'Введите название задачи',
      name: 'enter_the_task_name',
      desc: '',
      args: [],
    );
  }

  /// `Выберите дату начала`
  String get enter_the_start_date {
    return Intl.message(
      'Выберите дату начала',
      name: 'enter_the_start_date',
      desc: '',
      args: [],
    );
  }

  /// `Название задачи`
  String get task_name {
    return Intl.message(
      'Название задачи',
      name: 'task_name',
      desc: '',
      args: [],
    );
  }

  /// `Создать задачу`
  String get create_task {
    return Intl.message(
      'Создать задачу',
      name: 'create_task',
      desc: '',
      args: [],
    );
  }

  /// `Теги`
  String get tags {
    return Intl.message('Теги', name: 'tags', desc: '', args: []);
  }

  /// `Найти или создать тег`
  String get search_or_create_tags {
    return Intl.message(
      'Найти или создать тег',
      name: 'search_or_create_tags',
      desc: '',
      args: [],
    );
  }

  /// `Сохранить изменения`
  String get save_changes {
    return Intl.message(
      'Сохранить изменения',
      name: 'save_changes',
      desc: '',
      args: [],
    );
  }

  /// `Добавить теги`
  String get add_tags {
    return Intl.message('Добавить теги', name: 'add_tags', desc: '', args: []);
  }

  /// `Проект обновлен`
  String get project_updated {
    return Intl.message(
      'Проект обновлен',
      name: 'project_updated',
      desc: '',
      args: [],
    );
  }

  /// `Сегодня`
  String get today {
    return Intl.message('Сегодня', name: 'today', desc: '', args: []);
  }

  /// `Конец недели`
  String get end_week {
    return Intl.message('Конец недели', name: 'end_week', desc: '', args: []);
  }

  /// `Конец месяца`
  String get end_month {
    return Intl.message('Конец месяца', name: 'end_month', desc: '', args: []);
  }

  /// `Через неделю`
  String get after_week {
    return Intl.message('Через неделю', name: 'after_week', desc: '', args: []);
  }

  /// `Фильтры`
  String get filters {
    return Intl.message('Фильтры', name: 'filters', desc: '', args: []);
  }

  /// `99+`
  String get ninty_nine_plus {
    return Intl.message('99+', name: 'ninty_nine_plus', desc: '', args: []);
  }

  /// `Todo`
  String get todo {
    return Intl.message('Todo', name: 'todo', desc: '', args: []);
  }

  /// `In progress`
  String get in_progress {
    return Intl.message('In progress', name: 'in_progress', desc: '', args: []);
  }

  /// `On review`
  String get on_review {
    return Intl.message('On review', name: 'on_review', desc: '', args: []);
  }

  /// `Blocked`
  String get blocked {
    return Intl.message('Blocked', name: 'blocked', desc: '', args: []);
  }

  /// `Cancelled`
  String get cancelled {
    return Intl.message('Cancelled', name: 'cancelled', desc: '', args: []);
  }

  /// `Done`
  String get status_done {
    return Intl.message('Done', name: 'status_done', desc: '', args: []);
  }

  /// `В проекте пока нет задач или задачи были не найдены`
  String get tasks_not_found {
    return Intl.message(
      'В проекте пока нет задач или задачи были не найдены',
      name: 'tasks_not_found',
      desc: '',
      args: [],
    );
  }

  /// `По дедлайну`
  String get by_deadline {
    return Intl.message('По дедлайну', name: 'by_deadline', desc: '', args: []);
  }

  /// `По статусу`
  String get by_status {
    return Intl.message('По статусу', name: 'by_status', desc: '', args: []);
  }

  /// `Настройки`
  String get settings {
    return Intl.message('Настройки', name: 'settings', desc: '', args: []);
  }

  /// `Архив задач`
  String get task_archive {
    return Intl.message(
      'Архив задач',
      name: 'task_archive',
      desc: '',
      args: [],
    );
  }

  /// `О приложении`
  String get about_app {
    return Intl.message('О приложении', name: 'about_app', desc: '', args: []);
  }

  /// `Отчеты`
  String get reports {
    return Intl.message('Отчеты', name: 'reports', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
