import 'package:flutter/material.dart';

/// Colours from the Figma wireframes (minimalist, growth teal accent).
class AppColors {
  const AppColors._();

  static const Color teal = Color(0xFF0F766E);
  static const Color tealLight = Color(0xFFE6F2F1);
  static const Color ink = Color(0xFF1F2328);
  static const Color muted = Color(0xFF5F6368);
  static const Color line = Color(0xFFD1D5DB);
  static const Color soft = Color(0xFFF3F4F6);
  static const Color background = Color(0xFFFFFFFF);
}

/// Spacing and radius tokens shared by every screen.
class AppSpacing {
  const AppSpacing._();

  static const double screenPadding = 24;
  static const double gap = 16;
  static const double radius = 14;
  static const double buttonHeight = 52;
}

class AppTheme {
  const AppTheme._();

  static ThemeData light() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.teal,
      primary: AppColors.teal,
      surface: AppColors.background,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.background,
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: AppColors.ink,
          height: 1.3,
        ),
        titleMedium: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w700,
          color: AppColors.ink,
        ),
        bodyLarge: TextStyle(fontSize: 16, color: AppColors.ink, height: 1.4),
        bodyMedium: TextStyle(
          fontSize: 15,
          color: AppColors.muted,
          height: 1.4,
        ),
        labelMedium: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: AppColors.muted,
        ),
      ),
    );
  }
}
