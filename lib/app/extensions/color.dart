import 'dart:ui';

extension ColorExtensions on Color {
  String formattedHex() {
    return toARGB32().toRadixString(16).substring(2).toUpperCase();
  }

  bool isBlackColor() {
    return r + g + b / 3 < 0.1;
  }

  bool isWhiteColor() {
    return r + g + b / 3 > 0.9;
  }
}
