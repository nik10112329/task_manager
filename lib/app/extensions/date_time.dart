import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension RussianDate on DateTime {
  String get toRuDate {
    final day = DateFormat('dd', 'ru').format(this);
    final year = DateFormat('yyyy', 'ru').format(this);

    String month = DateFormat('MMMM', 'ru').format(this);
    month = toBeginningOfSentenceCase(month) ?? month;

    return '$day $month $year';
  }

  RichText get toRuDateRich {
    final day = DateFormat('dd', 'ru').format(this);
    final year = DateFormat(' yyyy', 'ru').format(this);

    String month = DateFormat('MMMM', 'ru').format(this);
    month = toBeginningOfSentenceCase(month) ?? month;

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: day),
          TextSpan(text: ' $month'),
          TextSpan(text: year),
        ],
      ),
    );
  }
}

extension NullableDateTime on DateTime? {
  bool whereType() {
    return this is DateTime;
  }
}
