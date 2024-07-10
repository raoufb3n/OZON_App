import 'package:flutterstarter/Core/index.dart';

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
            vertical: 14,
            horizontal: 48,
          ),
          backgroundColor: AppColors.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(300),
          ),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
          backgroundColor: AppColors.white,
          surfaceTintColor: AppColors.white,
          labelTextStyle: WidgetStatePropertyAll(
            AppFonts.lightThemeText.labelLarge,
          ),
          elevation: 4.0,
          shadowColor: Colors.black.withOpacity(0.78),
          height: 80.h));
}
