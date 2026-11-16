import 'package:freezed_annotation/freezed_annotation.dart';

class ColorConverter implements JsonConverter<int?, String?> {
  const ColorConverter();

  @override
  int? fromJson(String? json) {
    if (json == null || json.isEmpty) return null;

    String value = json.toUpperCase().replaceAll('#', '');

    // если нет альфы — добавляем FF
    if (value.length == 6) {
      value = 'FF$value';
    }

    // если приходит уже с 0x
    if (value.startsWith('0X')) {
      return int.tryParse(value);
    }

    return int.tryParse('0x$value');
  }

  @override
  String? toJson(int? object) {
    if (object == null) return null;

    final hex = object.toRadixString(16).toUpperCase();

    // убираем альфу если она FF (по желанию)
    if (hex.length == 8 && hex.startsWith('FF')) {
      return hex.substring(2);
    }

    return hex;
  }
}
