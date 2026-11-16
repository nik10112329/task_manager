// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static String m0(task_name) => "Удалить задачу \"${task_name}\"";

  static String m1(local_responsible_length) =>
      "${local_responsible_length} ответственных";

  static String m2(name) => "Привет, ${name}!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about_app": MessageLookupByLibrary.simpleMessage("О приложении"),
    "add_participants": MessageLookupByLibrary.simpleMessage(
      "Добавить участников",
    ),
    "add_tags": MessageLookupByLibrary.simpleMessage("Добавить теги"),
    "after_week": MessageLookupByLibrary.simpleMessage("Через неделю"),
    "appoint": MessageLookupByLibrary.simpleMessage("Назначить"),
    "blocked": MessageLookupByLibrary.simpleMessage("Blocked"),
    "by_deadline": MessageLookupByLibrary.simpleMessage("По дедлайну"),
    "by_status": MessageLookupByLibrary.simpleMessage("По статусу"),
    "cancel": MessageLookupByLibrary.simpleMessage("Отмена"),
    "cancelled": MessageLookupByLibrary.simpleMessage("Cancelled"),
    "cart": MessageLookupByLibrary.simpleMessage("Корзина"),
    "clear": MessageLookupByLibrary.simpleMessage("Очистить"),
    "create": MessageLookupByLibrary.simpleMessage("Создать"),
    "create_project": MessageLookupByLibrary.simpleMessage("Создать проект"),
    "create_task": MessageLookupByLibrary.simpleMessage("Создать задачу"),
    "date_placeholder": MessageLookupByLibrary.simpleMessage("дд месяц гггг"),
    "deadline": MessageLookupByLibrary.simpleMessage("Дедлайн"),
    "delete": MessageLookupByLibrary.simpleMessage("Удалить"),
    "done": MessageLookupByLibrary.simpleMessage("Готово"),
    "end_date": MessageLookupByLibrary.simpleMessage("Дата окончания"),
    "end_month": MessageLookupByLibrary.simpleMessage("Конец месяца"),
    "end_week": MessageLookupByLibrary.simpleMessage("Конец недели"),
    "enter_the_start_date": MessageLookupByLibrary.simpleMessage(
      "Выберите дату начала",
    ),
    "enter_the_task_name": MessageLookupByLibrary.simpleMessage(
      "Введите название задачи",
    ),
    "filters": MessageLookupByLibrary.simpleMessage("Фильтры"),
    "forgot_password": MessageLookupByLibrary.simpleMessage("Забыли пароль?"),
    "home_view_header": MessageLookupByLibrary.simpleMessage("Главная"),
    "in_progress": MessageLookupByLibrary.simpleMessage("In progress"),
    "ipLocation": MessageLookupByLibrary.simpleMessage("IP-локация"),
    "log_in": MessageLookupByLibrary.simpleMessage("Войти"),
    "login": MessageLookupByLibrary.simpleMessage("Логин"),
    "new_user": MessageLookupByLibrary.simpleMessage("Нет аккаунта?"),
    "ninty_nine_plus": MessageLookupByLibrary.simpleMessage("99+"),
    "no_notifications_yet": MessageLookupByLibrary.simpleMessage(
      "Пока нет уведомлений",
    ),
    "notifications_with_colon": MessageLookupByLibrary.simpleMessage(
      "Уведомления:",
    ),
    "on_review": MessageLookupByLibrary.simpleMessage("On review"),
    "one_responsible_person": MessageLookupByLibrary.simpleMessage(
      "1 ответсвенный",
    ),
    "or_continue_with": MessageLookupByLibrary.simpleMessage(
      "Или продолжить с",
    ),
    "owner": MessageLookupByLibrary.simpleMessage("Владелец"),
    "participants": MessageLookupByLibrary.simpleMessage("Участники"),
    "password": MessageLookupByLibrary.simpleMessage("Пароль"),
    "personal_account": MessageLookupByLibrary.simpleMessage("Личный кабинет"),
    "profile": MessageLookupByLibrary.simpleMessage("Профиль"),
    "project_name": MessageLookupByLibrary.simpleMessage("Название проекта"),
    "project_tasks": MessageLookupByLibrary.simpleMessage("Задачи проекта:"),
    "project_update": MessageLookupByLibrary.simpleMessage("Проект обновлён"),
    "project_updated": MessageLookupByLibrary.simpleMessage("Проект обновлен"),
    "remove_task_name": m0,
    "reports": MessageLookupByLibrary.simpleMessage("Отчеты"),
    "responsibility_length": m1,
    "save": MessageLookupByLibrary.simpleMessage("Сохранить"),
    "save_changes": MessageLookupByLibrary.simpleMessage("Сохранить изменения"),
    "search": MessageLookupByLibrary.simpleMessage("Поиск"),
    "search_by_name_email": MessageLookupByLibrary.simpleMessage(
      "Поиск по имени или email",
    ),
    "search_or_create_tags": MessageLookupByLibrary.simpleMessage(
      "Найти или создать тег",
    ),
    "select_participants": MessageLookupByLibrary.simpleMessage(
      "Выбрать участников",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Настройки"),
    "sign_up": MessageLookupByLibrary.simpleMessage("Регистрация"),
    "start_date": MessageLookupByLibrary.simpleMessage("Дата начала"),
    "status_done": MessageLookupByLibrary.simpleMessage("Done"),
    "tags": MessageLookupByLibrary.simpleMessage("Теги"),
    "task_archive": MessageLookupByLibrary.simpleMessage("Архив задач"),
    "task_deleted": MessageLookupByLibrary.simpleMessage("Задача удалена"),
    "task_manager": MessageLookupByLibrary.simpleMessage("Task Manager"),
    "task_name": MessageLookupByLibrary.simpleMessage("Название задачи"),
    "tasks": MessageLookupByLibrary.simpleMessage("Задачи"),
    "tasks_not_found": MessageLookupByLibrary.simpleMessage(
      "В проекте пока нет задач или задачи были не найдены",
    ),
    "today": MessageLookupByLibrary.simpleMessage("Сегодня"),
    "todo": MessageLookupByLibrary.simpleMessage("Todo"),
    "welcome_message": m2,
    "welcome_wishes": MessageLookupByLibrary.simpleMessage("Have a nice day"),
  };
}
