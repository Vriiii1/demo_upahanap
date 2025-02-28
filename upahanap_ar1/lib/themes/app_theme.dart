import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFA21623), // Primary color
      onPrimary: Color(0xFFFEF8FA), // Text color on background
      surface: Color(0xFFFEF8FA), // Surface color
      onSurface: Colors.black, // Text color on surface
    ),
    scaffoldBackgroundColor: const Color(0xFFFEF8FA),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFFEF8FA),
      foregroundColor: Color(0xFFA21623),
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.black),
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFA21623),
        foregroundColor: const Color(0xFFFEF8FA),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
    cardColor: Colors.white.withOpacity(0.9),
    dividerColor: Colors.black.withOpacity(0.2),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF1F1C2D), // Primary color
      onPrimary: Color(0xFF928DAB), // Text color on background
      surface: Color(0xFF1F1C2D), // Surface color
      onSurface: Colors.white, // Text color on surface
    ),
    scaffoldBackgroundColor: const Color(0xFF1F1C2D),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1F1C2D),
      foregroundColor: Color(0xFF928DAB),
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white),
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF928DAB),
        foregroundColor: const Color(0xFF1F1C2D),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
    cardColor: Colors.white.withOpacity(0.15),
    dividerColor: Colors.white.withOpacity(0.2),
  );
}
