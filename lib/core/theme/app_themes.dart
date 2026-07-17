import 'package:flutter/material.dart';

import '../utils/constants/app_string.dart';
import 'app_colors.dart';

class AppThemes {
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    fontFamily: AppString.sofiaPro,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.darkThemeTitle,
      onPrimary: AppColors.white,
      onSurface: AppColors.lightThemeTitle,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.fillWhite,
    ),
    textTheme: TextTheme(
      // display
      displayLarge: const TextStyle(fontSize: 57),
      displayMedium: const TextStyle(fontSize: 45),
      displaySmall: const TextStyle(fontSize: 36),

      // headline
      headlineLarge: const TextStyle(fontSize: 32),
      headlineMedium: const TextStyle(fontSize: 28),
      headlineSmall: const TextStyle(fontSize: 24),

      // title
      titleLarge: const TextStyle(fontSize: 22),
      titleMedium: const TextStyle(fontSize: 16),
      titleSmall: const TextStyle(fontSize: 14),

      // Label
      labelLarge: const TextStyle(fontSize: 14),
      labelMedium: const TextStyle(fontSize: 12),
      labelSmall: const TextStyle(fontSize: 11),

      // body
      bodyLarge: const TextStyle(fontSize: 16),
      bodyMedium: const TextStyle(fontSize: 14),
      bodySmall: const TextStyle(fontSize: 12),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.black,
      elevation: 0,
      centerTitle: false,
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
    ),
  );

  static ThemeData get dark => ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    useMaterial3: true,
    fontFamily: AppString.sofiaPro,
    scaffoldBackgroundColor: AppColors.black,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.lightThemeTitle,
      onPrimary: AppColors.white,
      onSurface: AppColors.darkThemeTitle,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.fillBlack,
    ),
    textTheme: TextTheme(
      // display
      displayLarge: const TextStyle(fontSize: 57),
      displayMedium: const TextStyle(fontSize: 45),
      displaySmall: const TextStyle(fontSize: 36),

      // headline
      headlineLarge: const TextStyle(fontSize: 32),
      headlineMedium: const TextStyle(fontSize: 28),
      headlineSmall: const TextStyle(fontSize: 24),

      // title
      titleLarge: const TextStyle(fontSize: 22),
      titleMedium: const TextStyle(fontSize: 16),
      titleSmall: const TextStyle(fontSize: 14),

      // Label
      labelLarge: const TextStyle(fontSize: 14),
      labelMedium: const TextStyle(fontSize: 12),
      labelSmall: const TextStyle(fontSize: 11),

      // body
      bodyLarge: const TextStyle(fontSize: 16),
      bodyMedium: const TextStyle(fontSize: 14),
      bodySmall: const TextStyle(fontSize: 12),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.black,
      foregroundColor: AppColors.white,
      elevation: 0,
      centerTitle: false,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
    ),
  );
}
