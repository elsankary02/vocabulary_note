import 'package:flutter/material.dart';
import 'package:note_app/core/utils/constants/app_string.dart';

import 'app_colors.dart';

class AppThemes {
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.white,
    fontFamily: AppString.inter,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: const ColorScheme.light(
      primary: AppColors.white,
      // secondary: AppColors.secondary,
      // tertiary: AppColors.third,
      // surface: AppColors.surfaceLight,
      // error: AppColors.error2,
      // onPrimary: Colors.white,
      // onSecondary: Colors.white,
      // onSurface: AppColors.textPrimaryLight,
    ),
    textTheme: TextTheme(
      // display
      displayLarge: TextStyle(fontSize: 57),
      displayMedium: TextStyle(fontSize: 45),
      displaySmall: TextStyle(fontSize: 36),

      // headline
      headlineLarge: TextStyle(fontSize: 32),
      headlineMedium: TextStyle(fontSize: 28),
      headlineSmall: TextStyle(fontSize: 24),

      // title
      titleLarge: TextStyle(fontSize: 22),
      titleMedium: TextStyle(fontSize: 16),
      titleSmall: TextStyle(fontSize: 14),

      // Label
      labelLarge: TextStyle(fontSize: 14),
      labelMedium: TextStyle(fontSize: 12),
      labelSmall: TextStyle(fontSize: 11),

      // body
      bodyLarge: TextStyle(fontSize: 16),
      bodyMedium: TextStyle(fontSize: 14),
      bodySmall: TextStyle(fontSize: 12),
    ),
    // appBarTheme: const AppBarTheme(
    //   backgroundColor: AppColors.offWhite,
    //   foregroundColor: AppColors.textPrimaryLight,
    //   elevation: 0,
    //   centerTitle: true,
    // ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     backgroundColor: AppColors.primary,
    //     foregroundColor: Colors.white,
    //     textStyle: TextStyle(),
    //   ),
    // ),
  );

  static ThemeData get dark => ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.black,
    useMaterial3: true,
    fontFamily: AppString.inter,
    scaffoldBackgroundColor: AppColors.black,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.black,
      // secondary: AppColors.secondary,
      // tertiary: AppColors.third,
      // surface: AppColors.surfaceDark,
      // error: AppColors.error2,
      // onPrimary: Colors.white,
      // onSecondary: Colors.white,
      // onSurface: AppColors.textPrimaryDark,
    ),
    textTheme: TextTheme(
      // display
      displayLarge: TextStyle(fontSize: 57),
      displayMedium: TextStyle(fontSize: 45),
      displaySmall: TextStyle(fontSize: 36),

      // headline
      headlineLarge: TextStyle(fontSize: 32),
      headlineMedium: TextStyle(fontSize: 28),
      headlineSmall: TextStyle(fontSize: 24),

      // title
      titleLarge: TextStyle(fontSize: 22),
      titleMedium: TextStyle(fontSize: 16),
      titleSmall: TextStyle(fontSize: 14),

      // Label
      labelLarge: TextStyle(fontSize: 14),
      labelMedium: TextStyle(fontSize: 12),
      labelSmall: TextStyle(fontSize: 11),

      // body
      bodyLarge: TextStyle(fontSize: 16),
      bodyMedium: TextStyle(fontSize: 14),
      bodySmall: TextStyle(fontSize: 12),
    ),
    // appBarTheme: const AppBarTheme(
    //   backgroundColor: AppColors.surfaceDark,
    //   foregroundColor: AppColors.textPrimaryDark,
    //   elevation: 0,
    //   centerTitle: true,
    // ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     backgroundColor: AppColors.primary,
    //     foregroundColor: Colors.white,
    //     textStyle: TextStyle(),
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    //   ),
    // ),
  );
}
