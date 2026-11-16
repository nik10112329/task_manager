import 'package:flutter/material.dart';
import 'package:task_manager/app/localization/generated/l10n.dart';

enum DeadlineValues { today, thisWeek, thisMonth, afterWeek }

extension DeadlineValuesName on DeadlineValues {
  String label(BuildContext context) {
    return switch (this) {
      DeadlineValues.today => S.of(context).today,
      DeadlineValues.thisWeek => S.of(context).end_week,
      DeadlineValues.thisMonth => S.of(context).end_month,
      DeadlineValues.afterWeek => S.of(context).after_week,
    };
  }

  String get key => name;
}

extension DeadlinevaluesDate on DeadlineValues {
  DateTime toDate() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    return switch (this) {
      DeadlineValues.today =>
        today
            .add(const Duration(days: 1))
            .subtract(const Duration(milliseconds: 1)),
      DeadlineValues.thisWeek => _endOfThisWeek(now),
      DeadlineValues.thisMonth => _endOfThisMonth(now),
      DeadlineValues.afterWeek => today.add(const Duration(days: 7)),
    };
  }

  static DeadlineValues? fromDate(DateTime? date) {
    if (date == null) return null;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dateOnly = DateTime(date.year, date.month, date.day);

    // Сегодня (до конца сегодняшнего дня)
    if (dateOnly.isAtSameMomentAs(today)) {
      return DeadlineValues.today;
    }

    // Эта неделя (до конца текущей недели)
    final endOfWeek = _endOfThisWeek(now);
    if (!dateOnly.isAfter(endOfWeek)) {
      return DeadlineValues.thisWeek;
    }

    // Этот месяц
    final endOfMonth = _endOfThisMonth(now);
    if (!dateOnly.isAfter(endOfMonth)) {
      return DeadlineValues.thisMonth;
    }

    // После недели
    final afterWeek = today.add(const Duration(days: 7));
    if (dateOnly.isAfter(afterWeek)) {
      return DeadlineValues.afterWeek;
    }

    return null; // если не попадает ни в одну категорию
  }

  static DateTime _endOfThisWeek(DateTime now) {
    final weekday = now.weekday; // 1 = Понедельник, 7 = Воскресенье
    final daysToSunday = 7 - weekday;
    return DateTime(now.year, now.month, now.day + daysToSunday);
  }

  static DateTime _endOfThisMonth(DateTime now) {
    final lastDay = DateTime(now.year, now.month + 1, 0);
    return lastDay;
  }
}
