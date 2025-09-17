import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    primaryColor: AppColors.lilac,
    colorScheme: const ColorScheme.light(
      primary: AppColors.lilac,
      secondary: AppColors.accent,
      surface: AppColors.backgroundLight,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightBlue,
      foregroundColor: AppColors.textLight,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accent,
        foregroundColor: AppColors.textLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.softBeige,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      hintStyle: const TextStyle(color: AppColors.textLight),
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.pinky,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: AppColors.textLight,
      ),
    ),
    dialogTheme: DialogTheme(
  backgroundColor: Colors.white, // خلفية بيضاء
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  ),
  titleTextStyle: const TextStyle(
    color: Color(0xFF1A237E), // أزرق غامق
    fontWeight: FontWeight.bold,
    fontSize: 18,
  ),
  contentTextStyle: const TextStyle(
    color: Colors.black87,
    fontSize: 16,
  ),
),

  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    primaryColor: AppColors.pinky,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.pinky,
      secondary: AppColors.accent,
      surface: AppColors.backgroundDark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.pinky,
      foregroundColor: AppColors.textDark,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.pinky,
        foregroundColor: AppColors.textDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[800],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      hintStyle: const TextStyle(color: AppColors.textDark),
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.accent,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: AppColors.textDark,
      ),
    ),
    dialogTheme: DialogTheme(
  backgroundColor: Colors.grey[850],
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  ),
  titleTextStyle: const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  ),
  contentTextStyle: const TextStyle(
    color: Colors.white70,
    fontSize: 16,
  ),
),

  );
}