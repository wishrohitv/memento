import 'package:flutter/material.dart';

@immutable
class ColorExtensions extends ThemeExtension<ColorExtensions> {
  final Color borderStrong;
  final Color borderDefault;
  final Color borderActive;

  final Color fillGreySurface;
  final Color fillLightBlueSurface;
  final Color scaffoldBg;

  const ColorExtensions({
    required this.borderStrong,
    required this.borderDefault,
    required this.borderActive,
    required this.fillGreySurface,
    required this.fillLightBlueSurface,
    required this.scaffoldBg,
  });

  @override
  ColorExtensions copyWith({
    Color? borderStrong,
    Color? borderDefault,
    Color? borderActive,
    Color? fillGreySurface,
    Color? fillLightBlueSurface,
    Color? scaffoldBg,
  }) {
    return ColorExtensions(
      borderStrong: borderStrong ?? this.borderStrong,
      borderDefault: borderDefault ?? this.borderDefault,
      borderActive: borderActive ?? this.borderActive,
      fillGreySurface: fillGreySurface ?? this.fillGreySurface,
      fillLightBlueSurface: fillLightBlueSurface ?? this.fillLightBlueSurface,
      scaffoldBg: scaffoldBg ?? this.scaffoldBg,
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
    );
  }
}
