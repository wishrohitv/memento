import 'package:flutter/material.dart';

@immutable
class ColorExtensions extends ThemeExtension<ColorExtensions> {
  final Color borderStrong;
  final Color borderDefault;
  final Color borderActive;

  final Color fillGreySurface;
  final Color fillLightBlueSurface;
  final Color scaffoldBg;
  final Color borderBlueStrong;
  final Color borderSelectedBlue;

  final Color textPrimary;
  final Color textMedium;
  final Color textSecondary;

  final Color teal;
  final Color limeGreen;
  final Color softOrange;
  final Color softRed;

  const ColorExtensions({
    required this.scaffoldBg,
    required this.borderStrong,
    required this.borderDefault,
    required this.borderActive,
    required this.fillGreySurface,
    required this.fillLightBlueSurface,
    required this.borderBlueStrong,
    required this.borderSelectedBlue,
    required this.textPrimary,
    required this.textMedium,
    required this.textSecondary,
    required this.teal,
    required this.limeGreen,
    required this.softOrange,
    required this.softRed,
  });

  @override
  ColorExtensions copyWith({
    Color? borderStrong,
    Color? borderDefault,
    Color? borderActive,
    Color? fillGreySurface,
    Color? fillLightBlueSurface,
    Color? scaffoldBg,
    Color? borderBlueStrong,
    Color? borderSelectedBlue,
    Color? textPrimary,
    Color? textSecondary,
    Color? teal,
    Color? limeGreen,
    Color? softOrange,
    Color? softRed,
  }) {
    return ColorExtensions(
      borderStrong: borderStrong ?? this.borderStrong,
      borderDefault: borderDefault ?? this.borderDefault,
      borderActive: borderActive ?? this.borderActive,
      fillGreySurface: fillGreySurface ?? this.fillGreySurface,
      fillLightBlueSurface: fillLightBlueSurface ?? this.fillLightBlueSurface,
      scaffoldBg: scaffoldBg ?? this.scaffoldBg,
      borderBlueStrong: borderBlueStrong ?? this.borderBlueStrong,
      borderSelectedBlue: borderSelectedBlue ?? this.borderSelectedBlue,
      textPrimary: textPrimary ?? this.textPrimary,
      textMedium: textMedium ?? this.textMedium,
      textSecondary: textSecondary ?? this.textSecondary,
      teal: teal ?? this.teal,
      limeGreen: limeGreen ?? this.limeGreen,
      softOrange: softOrange ?? this.softOrange,
      softRed: softRed ?? this.softRed,
    );
  }

  @override
  ColorExtensions lerp(
    covariant ThemeExtension<ColorExtensions>? other,
    double t,
  ) {
    if (other is! ColorExtensions) return this;

    return ColorExtensions(
      borderStrong: Color.lerp(borderStrong, other.borderStrong, t)!,
      borderDefault: Color.lerp(borderDefault, other.borderDefault, t)!,
      borderActive: Color.lerp(borderActive, other.borderActive, t)!,
      fillGreySurface: Color.lerp(fillGreySurface, other.fillGreySurface, t)!,
      fillLightBlueSurface: Color.lerp(
        fillLightBlueSurface,
        other.fillLightBlueSurface,
        t,
      )!,
      scaffoldBg: Color.lerp(scaffoldBg, other.scaffoldBg, t)!,
      borderBlueStrong: Color.lerp(
        borderBlueStrong,
        other.borderBlueStrong,
        t,
      )!,
      borderSelectedBlue: Color.lerp(
        borderSelectedBlue,
        other.borderSelectedBlue,
        t,
      )!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textMedium: Color.lerp(textMedium, other.textMedium, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      teal: Color.lerp(teal, other.teal, t)!,
      limeGreen: Color.lerp(limeGreen, other.limeGreen, t)!,
      softOrange: Color.lerp(softOrange, other.softOrange, t)!,
      softRed: Color.lerp(softRed, other.softRed, t)!,
    );
  }
}
