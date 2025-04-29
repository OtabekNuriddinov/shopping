import 'package:flutter/material.dart';

sealed class Themes{

  static Color darkBlue = Colors.blue.shade900;
  static Color orange = Colors.orange.shade50;
  static Color deepPurple = Colors.deepPurple.shade900;
  static Color white = Colors.white;
  static Color grey = Colors.grey;
  static Color black = Colors.black;
  static Color lightBlue = Colors.lightBlue;


  static Color primary = Colors.blue.shade900;
  static Color onPrimary = Colors.white;
  static Color secondary = Colors.orange.shade50;
  static Color onSecondary = Colors.black;
  static Color surface = Colors.white;
  static Color onSurface = Colors.black;
  static Color error = Colors.red;
  static Color onError = Colors.white;

  static var darkColorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: deepPurple,
      onPrimary: black,
      secondary:lightBlue,
      onSecondary: black,
      error: error,
      onError: black,
      surface: grey,
      onSurface: white,
  );
  static var lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: darkBlue,
    onPrimary: white,
    secondary: orange,
    onSecondary: black,
    error: error,
    onError: white,
    surface: white,
    onSurface: black,
  );

  static const textTheme = TextTheme(
    headlineLarge: TextStyle(),
    headlineMedium: TextStyle(),
    headlineSmall: TextStyle(),
    titleLarge: TextStyle(),
    titleMedium: TextStyle(),
    titleSmall: TextStyle(),
    labelLarge: TextStyle(),
    labelMedium: TextStyle(),
    labelSmall: TextStyle(),
    bodyLarge: TextStyle(),
    bodyMedium: TextStyle(),
    bodySmall: TextStyle(),
  );
}