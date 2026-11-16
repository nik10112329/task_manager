// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'app_theme_extensions_colors.dart';

part 'app_theme_extensions.tailor.dart';

part 'app_theme_extensions_text_styles.dart';

/// You can get colors from context
///
/// context.colors.accent
@TailorMixin(themeGetter: ThemeGetter.onBuildContext)
class Colors extends ThemeExtension<Colors> with _$ColorsTailorMixin {
  Colors({
    required this.accent,
    required this.darkAccent,
    required this.background,
    required this.lightBackground,
    required this.primary,
    required this.secondary,
    required this.iconColor,
    required this.iconDisable,
    required this.white,
    required this.textColor,
    required this.backgroundTagColor,
    required this.splashBackground,
    required this.primaryGradient,
    required this.primaryGradient2,
    required this.deleteColor,
    required this.error,
    required this.standardShadow,
    required this.selectedBackgroundTagColor,
    required this.completed,
    this.transparent = _AppColors.transparent,
  });

  @override
  final Color transparent;
  @override
  final Color background;
  @override
  final Color lightBackground;
  @override
  final Color accent;
  @override
  final Color darkAccent;
  @override
  final Color primary;
  @override
  final Color secondary;
  @override
  final Color iconColor;
  @override
  final Color iconDisable;
  @override
  final Color white;
  @override
  final Color textColor;
  @override
  final Color backgroundTagColor;
  @override
  final Color splashBackground;
  @override
  final Color deleteColor;
  @override
  final Color error;
  @override
  final Color selectedBackgroundTagColor;
  @override
  final Color completed;
  @override
  final Gradient primaryGradient;
  @override
  final Gradient primaryGradient2;
  @override
  final BoxShadow standardShadow;
}

@TailorMixin(themeGetter: ThemeGetter.onBuildContext)
class Styles extends ThemeExtension<Styles> with _$StylesTailorMixin {
  Styles({required this.h1, required this.subtitle, required this.textStyle});

  @override
  final TextStyle h1;
  @override
  final TextStyle subtitle;
  @override
  final TextStyle textStyle;
}

final lightColors = Colors(
  accent: _AppColors.primaryBlue,
  darkAccent: _AppColors.darkBlue,
  background: _AppColors.lightWhite,
  lightBackground: _AppColors.whiteGreyLight,
  primary: _AppColors.primary,
  secondary: _AppColors.white,
  iconDisable: _AppColors.grey,
  iconColor: _AppColors.greyBlue,
  white: _AppColors.white,
  textColor: _AppColors.blackBlue,
  splashBackground: _AppColors.primaryBlue2,
  backgroundTagColor: _AppColors.lightGrey,
  primaryGradient: _AppColors.violetBlueGradient,
  primaryGradient2: _AppColors.violetBlueGradient2,
  standardShadow: _AppColors.shadow,
  selectedBackgroundTagColor: _AppColors.white,
  deleteColor: _AppColors.vinous,
  error: _AppColors.vinous,
  completed: _AppColors.darkGreen,
);

final darkColors = Colors(
  accent: _AppColors.primaryBlue,
  darkAccent: _AppColors.darkBlue,

  background: _AppColors.darkBlue,
  lightBackground: _AppColors.darkBlue,

  primary: _AppColors.primary,
  secondary: _AppColors.blackBlue,

  iconDisable: _AppColors.whiteGrey,
  iconColor: _AppColors.white,

  white: _AppColors.white,

  textColor: _AppColors.whiteGreyLight,

  splashBackground: _AppColors.primaryBlue2,

  backgroundTagColor: _AppColors.greyBlue,

  primaryGradient: _AppColors.violetBlueGradient,
  primaryGradient2: _AppColors.violetBlueGradient2,

  standardShadow: _AppColors.whiteShadow,
  selectedBackgroundTagColor: _AppColors.primary,
  deleteColor: _AppColors.vinous,
  error: _AppColors.vinous,
  completed: _AppColors.darkGreen,
);

final lightStyles = Styles(
  h1: _TextStyles.instance.h1Style.copyWith(color: _AppColors.greyBlue),
  subtitle: _TextStyles.instance.textStyle.copyWith(
    fontSize: 18,
    color: _AppColors.greyBlue.withValues(alpha: 0.54),
  ),
  textStyle: _TextStyles.instance.textStyle,
);

final darkStyles = Styles(
  h1: _TextStyles.instance.h1Style.copyWith(color: _AppColors.white),
  subtitle: _TextStyles.instance.textStyle.copyWith(
    fontSize: 18,
    color: _AppColors.white.withValues(alpha: 0.54),
  ),
  textStyle: _TextStyles.instance.textStyle.copyWith(color: _AppColors.white),
);
