import 'package:flutter/material.dart';
import 'package:flutterstarter/Core/Theme/AppColors.dart';
import 'package:flutterstarter/Core/Theme/AppFonts.dart';

class AppThemes {
  AppThemes._();

  static ThemeData lightTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        titleTextStyle: TextStyle(color: AppColors.onBackground),
        iconTheme: IconThemeData(color: AppColors.onBackground),
      ),
      textTheme: AppFonts.lightThemeText,
      listTileTheme: const ListTileThemeData().copyWith(
          titleTextStyle: AppFonts.lightThemeText.titleSmall,
          subtitleTextStyle: AppFonts.lightThemeText.bodyLarge),
      colorScheme: AppColors.lightColorScheme,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 48,
          ),
          backgroundColor: AppColors.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ));


}