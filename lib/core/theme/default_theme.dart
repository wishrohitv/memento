import 'package:flutter/material.dart';
import 'color_extensions.dart';
import 'base_colors.dart';

ThemeData defaultTheme = ThemeData(
  extensions: [
    ColorExtensions(
      scaffoldBg: BaseColors.neutral800,
      borderStrong: BaseColors.neutral900,
      borderDefault: BaseColors.neutral600,
      borderActive: BaseColors.neutral500,
      fillGreySurface: BaseColors.neutral700,
      borderSelectedBlue: BaseColors.brand700,
      fillLightBlueSurface: BaseColors.brand500,
      borderBlueStrong: BaseColors.brand900,

      textPrimary: BaseColors.neutral300,
      textMedium: BaseColors.neutral200,
      textSecondary: BaseColors.neutral600,

      teal: BaseColors.teal,
      limeGreen: BaseColors.limeGreen,
      softOrange: BaseColors.softOrange,
      softRed: BaseColors.softRed,
    ),
  ],
  primaryColor: BaseColors.brand900,
  highlightColor: Colors.transparent,
  scaffoldBackgroundColor: BaseColors.neutral800,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
  textSelectionTheme: TextSelectionThemeData(
    selectionHandleColor: BaseColors.neutral100,
    cursorColor: BaseColors.neutral400,
  ),

  appBarTheme: AppBarTheme(
    backgroundColor: BaseColors.neutral800,
    surfaceTintColor: BaseColors.neutral800,
    elevation: 4.0,
  ),
  bottomAppBarTheme: BottomAppBarThemeData(color: BaseColors.neutral800),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(color: BaseColors.neutral600),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(color: BaseColors.neutral500),
    ),
  ),
);
