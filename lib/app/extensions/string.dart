import 'package:flutter/material.dart';

extension StringExtensions on String {
  @Deprecated('Do not forget to remove hardcoded strings')
  String get hardCoded => this;

  String get capitalized =>
      '${this[0].toUpperCase()}${substring(1).toLowerCase()}';

  Size getTextWidgetSize({TextStyle? style, int? maxLines, double? maxWidth}) =>
      (TextPainter(
        text: TextSpan(text: this, style: style),
        maxLines: maxLines ?? 1,
      )..layout(maxWidth: maxWidth ?? double.infinity)).size;

  String get fromSnakeCase => split('_')
      .map(
        (word) => word.isEmpty ? '' : word[0].capitalized + word.substring(1),
      )
      .join(' ');

  String toCamelCase() {
    final words = split('_');
    if (words.isEmpty) return this;
    return words.first +
        words
            .skip(1)
            .map(
              (word) =>
                  word.isEmpty ? '' : word[0].toUpperCase() + word.substring(1),
            )
            .join();
  }

  Color? parseHex() {
    final clean = replaceAll('#', '').trim();
    if (clean.length == 6) {
      final value = int.tryParse('FF$clean', radix: 16);
      if (value != null) return Color(value);
    }
    return null;
  }

  String shortId() {
    if (length < 10) return this;

    return '${substring(0, 4)}...${substring(length - 4)}';
  }
  String shortDisplayName() {
    if (length < 18) return this;

    return '${substring(0, 8)}...${substring(length - 10)}';
  }
}
