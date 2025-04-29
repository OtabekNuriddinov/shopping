import 'package:flutter/material.dart';
import 'package:shoppin/core/theme/themes.dart';

sealed class AppTheme{

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: Themes.lightColorScheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: Themes.darkColorScheme
  );
}