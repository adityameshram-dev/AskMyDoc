import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
      primary: AppColors.primary,
      secondary: AppColors.accent,
      surface: AppColors.surfaceLight,
      background: AppColors.backgroundLight,
      error: AppColors.error,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      canvasColor: AppColors.backgroundLight,
      cardColor: AppColors.surfaceLight,
      dialogBackgroundColor: AppColors.surfaceLight,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.surfaceDark,
        foregroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
      ),
      dividerColor: AppColors.borderLight,
      iconTheme: const IconThemeData(color: AppColors.primary),
      textTheme: TextTheme(
        headlineMedium: const TextStyle(color: AppColors.textPrimaryLight),
        titleLarge: const TextStyle(color: AppColors.textPrimaryLight),
        bodyLarge: const TextStyle(color: AppColors.textPrimaryLight),
        bodyMedium: const TextStyle(color: AppColors.textPrimaryLight),
        bodySmall: const TextStyle(color: AppColors.textSecondaryLight),
        labelMedium: const TextStyle(color: AppColors.textSecondaryLight),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceLight,
        hintStyle: const TextStyle(color: AppColors.textSecondaryLight),
        labelStyle: const TextStyle(color: AppColors.textSecondaryLight),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          borderSide: BorderSide(color: AppColors.borderLight),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          borderSide: BorderSide(color: AppColors.primary, width: 1.5),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          borderSide: BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          borderSide: BorderSide(color: AppColors.error, width: 1.5),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          elevation: 0,
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.surfaceDark,
        contentTextStyle: TextStyle(color: AppColors.white),
      ),
    );
  }

  static ThemeData get darkTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
      primary: AppColors.primary,
      secondary: AppColors.accent,
      surface: AppColors.surfaceDark,
      background: AppColors.backgroundDark,
      error: AppColors.error,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      canvasColor: AppColors.backgroundDark,
      cardColor: AppColors.surfaceDark,
      dialogBackgroundColor: AppColors.surfaceDark,
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF111827),
        foregroundColor: AppColors.textPrimaryDark,
        elevation: 0,
        centerTitle: true,
      ),
      dividerColor: AppColors.borderDark,
      iconTheme: const IconThemeData(color: AppColors.primary),
      textTheme: TextTheme(
        headlineMedium: const TextStyle(color: AppColors.textPrimaryDark),
        titleLarge: const TextStyle(color: AppColors.textPrimaryDark),
        bodyLarge: const TextStyle(color: AppColors.textPrimaryDark),
        bodyMedium: const TextStyle(color: AppColors.textPrimaryDark),
        bodySmall: const TextStyle(color: AppColors.textSecondaryDark),
        labelMedium: const TextStyle(color: AppColors.textSecondaryDark),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceDark,
        hintStyle: const TextStyle(color: AppColors.textSecondaryDark),
        labelStyle: const TextStyle(color: AppColors.textSecondaryDark),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          borderSide: BorderSide(color: AppColors.borderDark),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          borderSide: BorderSide(color: AppColors.primary, width: 1.5),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          borderSide: BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          borderSide: BorderSide(color: AppColors.error, width: 1.5),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          elevation: 0,
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.surfaceElevatedDark,
        contentTextStyle: TextStyle(color: AppColors.textPrimaryDark),
      ),
    );
  }
}
