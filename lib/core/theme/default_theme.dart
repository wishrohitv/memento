import 'package:flutter/material.dart';
import 'color_extensions.dart';
import 'base_colors.dart';

ThemeData defaultTheme = ThemeData(
  extensions: [
    ColorExtensions(
      borderStrong: BaseColors.neutral900,
      borderDefault: BaseColors.neutral600,
      borderActive: BaseColors.neutral500,
      fillGreySurface: BaseColors.neutral700,
      fillLightBlueSurface: BaseColors.brand500,
      scaffoldBg: BaseColors.neutral800,
    ),
  ],
  primaryColor: BaseColors.brand900,
  scaffoldBackgroundColor: BaseColors.neutral900,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
  textSelectionTheme: TextSelectionThemeData(
    selectionHandleColor: BaseColors.neutral100,
    cursorColor: BaseColors.neutral400,
  ),

  appBarTheme: AppBarTheme(
    backgroundColor: BaseColors.neutral900,
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
