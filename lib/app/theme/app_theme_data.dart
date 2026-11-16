import 'package:flutter/material.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';

class AppThemeData {
  static ThemeData get light {
    return ThemeData(
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: lightColors.primary,
        onPrimary: lightColors.darkAccent,
        secondary: lightColors.accent,
        onSecondary: lightColors.darkAccent,
        error: lightColors.background,
        onError: lightColors.darkAccent,
        surface: lightColors.lightBackground,
        onSurface: lightColors.darkAccent,
      ),
      appBarTheme: AppBarTheme(surfaceTintColor: lightColors.background),
      brightness: Brightness.light,
      extensions: [lightColors, lightStyles],
      scaffoldBackgroundColor: lightColors.background,
      buttonTheme: ButtonThemeData(
        buttonColor: lightColors.accent,
        disabledColor: lightColors.darkAccent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: lightColors.accent,
      ),
      iconTheme: IconThemeData(color: lightColors.darkAccent),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: lightColors.accent,
        unselectedItemColor: lightColors.darkAccent,
      ),
      textTheme: TextTheme(
        bodyLarge: lightStyles.h1,
        bodySmall: lightStyles.textStyle,
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: darkColors.accent,
        onPrimary: darkColors.darkAccent,
        secondary: darkColors.accent,
        onSecondary: darkColors.darkAccent,
        error: darkColors.background,
        onError: darkColors.darkAccent,
        surface: darkColors.lightBackground,
        onSurface: darkColors.darkAccent,
      ),
      appBarTheme: AppBarTheme(surfaceTintColor: lightColors.background),
      brightness: Brightness.dark,
      extensions: [darkColors, darkStyles],
      scaffoldBackgroundColor: darkColors.background,
      buttonTheme: ButtonThemeData(
        buttonColor: darkColors.accent,
        disabledColor: darkColors.darkAccent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: darkColors.accent,
      ),
      iconTheme: IconThemeData(color: darkColors.darkAccent),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: lightColors.accent,
        unselectedItemColor: lightColors.darkAccent,
      ),
      textTheme: TextTheme(
        bodyLarge: lightStyles.h1,
        bodySmall: lightStyles.textStyle,
      ),
    );
  }
}
