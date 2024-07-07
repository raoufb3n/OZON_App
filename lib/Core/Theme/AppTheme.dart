import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterstarter/Core/Theme/AppColors.dart';
import 'package:flutterstarter/Core/Theme/AppFonts.dart';

class AppThemes {
  AppThemes._();

  static ThemeData lightTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        titleTextStyle: TextStyle(color: AppColors.black),
        iconTheme: IconThemeData(color: AppColors.black),
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
          backgroundColor: AppColors.button,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ));

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBg,
      elevation: 0,
      titleTextStyle: TextStyle(color: AppColors.white),
      iconTheme: IconThemeData(color: AppColors.white),
    ),
    textTheme: AppFonts.darkThemeText,
    colorScheme: AppColors.darkColorScheme,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: 15.h,
          horizontal: 20.w,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.button,
        padding: EdgeInsets.symmetric(
          vertical: 10.h,
          horizontal: 20.w,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    ),
    listTileTheme: const ListTileThemeData().copyWith(
        titleTextStyle: AppFonts.darkThemeText.titleSmall,
        subtitleTextStyle: AppFonts.darkThemeText.bodyLarge),
  );
}