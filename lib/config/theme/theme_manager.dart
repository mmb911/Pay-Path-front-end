import 'package:flutter/material.dart';

import '../../core/utils/color_constants.dart';

class ThemeManager {
  final lightTheme = ThemeData(
    fontFamily: 'SourceSans3',
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: primaryAppColor,
      surface: scaffoldBackgroundColor,
      brightness: Brightness.light,
      error: errorColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: scaffoldBackgroundColor,
      surfaceTintColor: transparentColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryAppColor,
      ),
    ),
  );


}
