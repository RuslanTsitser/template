import 'package:flutter/material.dart';
import 'package:project_template/core/presentation/theme/app_colors.dart';
import 'package:project_template/core/presentation/theme/app_text.dart';
import 'package:project_template/core/utils/color.dart';

abstract class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
        primarySwatch: generateMaterialColor(AppColors.primary),
        hintColor: AppColors.hint,
        brightness: Brightness.light,
        useMaterial3: false, // TODO: remove after migration to material3
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          outline: AppColors.primary,
          background: AppColors.background,
          error: AppColors.error,
        ),
        textTheme: AppTextTheme.theme,
        fontFamily: 'Montserrat',
        appBarTheme: const AppBarTheme(
          toolbarHeight: 40,
          color: AppColors.white,
          foregroundColor: AppColors.black,
          shadowColor: Colors.transparent,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(),
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary),
            borderRadius: AppBorderRadius.all16,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.error),
            borderRadius: AppBorderRadius.all16,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.error),
            borderRadius: AppBorderRadius.all16,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary),
            borderRadius: AppBorderRadius.all16,
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.background),
            borderRadius: AppBorderRadius.all16,
          ),
        ),
      );
}

abstract final class AppInputDecoration {
  static const none = InputDecoration(
    border: InputBorder.none,
    enabledBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    focusedErrorBorder: InputBorder.none,
  );

  static const grey = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: AppBorderRadius.all12,
      borderSide: BorderSide(color: AppColors.greyElements),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: AppBorderRadius.all12,
      borderSide: BorderSide(color: AppColors.greyElements),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: AppBorderRadius.all12,
      borderSide: BorderSide(color: AppColors.greyElements),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: AppBorderRadius.all12,
      borderSide: BorderSide(color: AppColors.greyElements),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: AppBorderRadius.all12,
      borderSide: BorderSide(color: AppColors.greyElements),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: AppBorderRadius.all12,
      borderSide: BorderSide(color: AppColors.greyElements),
    ),
  );
}

abstract final class AppBorderRadius {
  /// all
  static const all24 = BorderRadius.all(Radius.circular(24));
  static const all20 = BorderRadius.all(Radius.circular(20));
  static const all16 = BorderRadius.all(Radius.circular(16));
  static const all12 = BorderRadius.all(Radius.circular(12));
  static const all9 = BorderRadius.all(Radius.circular(9));
  static const all8 = BorderRadius.all(Radius.circular(8));

  /// bottom
  static const bottom24 = BorderRadius.vertical(bottom: Radius.circular(24));

  /// top
  static const top24 = BorderRadius.vertical(top: Radius.circular(24));
  static const top20 = BorderRadius.vertical(top: Radius.circular(20));
  static const top14 = BorderRadius.vertical(top: Radius.circular(14));
}
