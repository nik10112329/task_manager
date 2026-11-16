// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_theme_extensions.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$ColorsTailorMixin on ThemeExtension<Colors> {
  Color get transparent;
  Color get background;
  Color get lightBackground;
  Color get accent;
  Color get darkAccent;
  Color get primary;
  Color get secondary;
  Color get iconColor;
  Color get iconDisable;
  Color get white;
  Color get textColor;
  Color get backgroundTagColor;
  Color get splashBackground;
  Color get deleteColor;
  Color get error;
  Color get selectedBackgroundTagColor;
  Color get completed;
  Gradient get primaryGradient;
  Gradient get primaryGradient2;
  BoxShadow get standardShadow;

  @override
  Colors copyWith({
    Color? transparent,
    Color? background,
    Color? lightBackground,
    Color? accent,
    Color? darkAccent,
    Color? primary,
    Color? secondary,
    Color? iconColor,
    Color? iconDisable,
    Color? white,
    Color? textColor,
    Color? backgroundTagColor,
    Color? splashBackground,
    Color? deleteColor,
    Color? error,
    Color? selectedBackgroundTagColor,
    Color? completed,
    Gradient? primaryGradient,
    Gradient? primaryGradient2,
    BoxShadow? standardShadow,
  }) {
    return Colors(
      transparent: transparent ?? this.transparent,
      background: background ?? this.background,
      lightBackground: lightBackground ?? this.lightBackground,
      accent: accent ?? this.accent,
      darkAccent: darkAccent ?? this.darkAccent,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      iconColor: iconColor ?? this.iconColor,
      iconDisable: iconDisable ?? this.iconDisable,
      white: white ?? this.white,
      textColor: textColor ?? this.textColor,
      backgroundTagColor: backgroundTagColor ?? this.backgroundTagColor,
      splashBackground: splashBackground ?? this.splashBackground,
      deleteColor: deleteColor ?? this.deleteColor,
      error: error ?? this.error,
      selectedBackgroundTagColor:
          selectedBackgroundTagColor ?? this.selectedBackgroundTagColor,
      completed: completed ?? this.completed,
      primaryGradient: primaryGradient ?? this.primaryGradient,
      primaryGradient2: primaryGradient2 ?? this.primaryGradient2,
      standardShadow: standardShadow ?? this.standardShadow,
    );
  }

  @override
  Colors lerp(covariant ThemeExtension<Colors>? other, double t) {
    if (other is! Colors) return this as Colors;
    return Colors(
      transparent: Color.lerp(transparent, other.transparent, t)!,
      background: Color.lerp(background, other.background, t)!,
      lightBackground: Color.lerp(lightBackground, other.lightBackground, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      darkAccent: Color.lerp(darkAccent, other.darkAccent, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      iconDisable: Color.lerp(iconDisable, other.iconDisable, t)!,
      white: Color.lerp(white, other.white, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
      backgroundTagColor: Color.lerp(
        backgroundTagColor,
        other.backgroundTagColor,
        t,
      )!,
      splashBackground: Color.lerp(
        splashBackground,
        other.splashBackground,
        t,
      )!,
      deleteColor: Color.lerp(deleteColor, other.deleteColor, t)!,
      error: Color.lerp(error, other.error, t)!,
      selectedBackgroundTagColor: Color.lerp(
        selectedBackgroundTagColor,
        other.selectedBackgroundTagColor,
        t,
      )!,
      completed: Color.lerp(completed, other.completed, t)!,
      primaryGradient: t < 0.5 ? primaryGradient : other.primaryGradient,
      primaryGradient2: t < 0.5 ? primaryGradient2 : other.primaryGradient2,
      standardShadow: t < 0.5 ? standardShadow : other.standardShadow,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Colors &&
            const DeepCollectionEquality().equals(
              transparent,
              other.transparent,
            ) &&
            const DeepCollectionEquality().equals(
              background,
              other.background,
            ) &&
            const DeepCollectionEquality().equals(
              lightBackground,
              other.lightBackground,
            ) &&
            const DeepCollectionEquality().equals(accent, other.accent) &&
            const DeepCollectionEquality().equals(
              darkAccent,
              other.darkAccent,
            ) &&
            const DeepCollectionEquality().equals(primary, other.primary) &&
            const DeepCollectionEquality().equals(secondary, other.secondary) &&
            const DeepCollectionEquality().equals(iconColor, other.iconColor) &&
            const DeepCollectionEquality().equals(
              iconDisable,
              other.iconDisable,
            ) &&
            const DeepCollectionEquality().equals(white, other.white) &&
            const DeepCollectionEquality().equals(textColor, other.textColor) &&
            const DeepCollectionEquality().equals(
              backgroundTagColor,
              other.backgroundTagColor,
            ) &&
            const DeepCollectionEquality().equals(
              splashBackground,
              other.splashBackground,
            ) &&
            const DeepCollectionEquality().equals(
              deleteColor,
              other.deleteColor,
            ) &&
            const DeepCollectionEquality().equals(error, other.error) &&
            const DeepCollectionEquality().equals(
              selectedBackgroundTagColor,
              other.selectedBackgroundTagColor,
            ) &&
            const DeepCollectionEquality().equals(completed, other.completed) &&
            const DeepCollectionEquality().equals(
              primaryGradient,
              other.primaryGradient,
            ) &&
            const DeepCollectionEquality().equals(
              primaryGradient2,
              other.primaryGradient2,
            ) &&
            const DeepCollectionEquality().equals(
              standardShadow,
              other.standardShadow,
            ));
  }

  @override
  int get hashCode {
    return Object.hashAll([
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(transparent),
      const DeepCollectionEquality().hash(background),
      const DeepCollectionEquality().hash(lightBackground),
      const DeepCollectionEquality().hash(accent),
      const DeepCollectionEquality().hash(darkAccent),
      const DeepCollectionEquality().hash(primary),
      const DeepCollectionEquality().hash(secondary),
      const DeepCollectionEquality().hash(iconColor),
      const DeepCollectionEquality().hash(iconDisable),
      const DeepCollectionEquality().hash(white),
      const DeepCollectionEquality().hash(textColor),
      const DeepCollectionEquality().hash(backgroundTagColor),
      const DeepCollectionEquality().hash(splashBackground),
      const DeepCollectionEquality().hash(deleteColor),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(selectedBackgroundTagColor),
      const DeepCollectionEquality().hash(completed),
      const DeepCollectionEquality().hash(primaryGradient),
      const DeepCollectionEquality().hash(primaryGradient2),
      const DeepCollectionEquality().hash(standardShadow),
    ]);
  }
}

extension ColorsBuildContext on BuildContext {
  Colors get colors => Theme.of(this).extension<Colors>()!;
}

mixin _$StylesTailorMixin on ThemeExtension<Styles> {
  TextStyle get h1;
  TextStyle get subtitle;
  TextStyle get textStyle;

  @override
  Styles copyWith({TextStyle? h1, TextStyle? subtitle, TextStyle? textStyle}) {
    return Styles(
      h1: h1 ?? this.h1,
      subtitle: subtitle ?? this.subtitle,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  Styles lerp(covariant ThemeExtension<Styles>? other, double t) {
    if (other is! Styles) return this as Styles;
    return Styles(
      h1: TextStyle.lerp(h1, other.h1, t)!,
      subtitle: TextStyle.lerp(subtitle, other.subtitle, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Styles &&
            const DeepCollectionEquality().equals(h1, other.h1) &&
            const DeepCollectionEquality().equals(subtitle, other.subtitle) &&
            const DeepCollectionEquality().equals(textStyle, other.textStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(h1),
      const DeepCollectionEquality().hash(subtitle),
      const DeepCollectionEquality().hash(textStyle),
    );
  }
}

extension StylesBuildContext on BuildContext {
  Styles get styles => Theme.of(this).extension<Styles>()!;
}
