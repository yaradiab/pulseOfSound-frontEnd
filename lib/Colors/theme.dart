import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    primaryColor: AppColors.skyBlue,
    colorScheme: const ColorScheme.light(
      primary: AppColors.skyBlue,
      secondary: AppColors.peach,
      surface: AppColors.backgroundLight,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.babyPink,
      foregroundColor: AppColors.textLight,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.pink,
        foregroundColor: AppColors.textLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.babyBlue,
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
        color: AppColors.pink,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: AppColors.textLight,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    primaryColor: AppColors.pastelBlue,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.pastelBlue,
      secondary: AppColors.butter,
      surface: AppColors.backgroundDark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.pastelBlue,
      foregroundColor: AppColors.textDark,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.butter,
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
        color: AppColors.butter,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: AppColors.textDark,
      ),
    ),
  );
}
