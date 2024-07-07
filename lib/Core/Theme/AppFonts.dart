import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterstarter/Core/Theme/AppColors.dart';
import 'package:google_fonts/google_fonts.dart';

/// | NAME             | SIZE |  WEIGHT |  SPACING |             |
/// |-----------------|------|---------|----------|-------------|
/// | displayLarge   | 96.0 | light   | -1.5     |             |
/// | displayMedium  | 60.0 | light   | -0.5     |             |
/// | displaySmall   | 48.0 | regular |  0.0     |             |
/// | headlineMedium | 34.0 | regular |  0.25    |             |
/// | headlineSmall | 24.0 | regular |  0.0     |             |
/// | titleLarge    | 20.0 | medium  |  0.15    |             |
/// | titleMedium   | 16.0 | regular |  0.15    |             |
/// | titleSmall    | 14.0 | medium  |  0.1     |             |
/// | bodyLarge     | 16.0 | regular |  0.5     | (bodyText1) |
/// | bodyMedium    | 14.0 | regular |  0.25    | (bodyText2) |
/// | bodySmall     | 14.0 | medium  |  1.25    |             |
/// | labelLarge    | 12.0 | regular |  0.4     |             |
/// | labelSmall    | 10.0 | regular |  1.5     |             |

class AppFonts {
  static TextTheme get _fontTextTheme => GoogleFonts.poppinsTextTheme();

  static final _blackheadlineLarge = _fontTextTheme.headlineLarge?.copyWith(
    fontSize: 28.sp,
    color: AppColors.black,
    fontWeight: FontWeight.bold,
  );

  static final _blackheadlineMeduim = _fontTextTheme.headlineMedium?.copyWith(
    fontSize: 24.sp,
    color: AppColors.black,
    fontWeight: FontWeight.w700,
  );
  static final _blackheadlineSmall = _fontTextTheme.headlineSmall?.copyWith(
    fontSize: 20.sp,
    color: AppColors.black,
    fontWeight: FontWeight.bold,
  );

  static final _blacktitleLarge = _fontTextTheme.titleLarge?.copyWith(
    fontSize: 18.sp,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );
  static final _blacktitleMedium = _fontTextTheme.titleMedium?.copyWith(
    fontSize: 18.sp,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );
  static final _blacktitleSmall = _fontTextTheme.titleSmall?.copyWith(
    fontSize: 16.sp,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );

  static final _blackbodyMedium = _fontTextTheme.bodyMedium?.copyWith(
    fontSize: 14.sp,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );
  static final _blackbodySmall = _fontTextTheme.bodySmall?.copyWith(
    fontSize: 14.sp,
    color: Colors.white,
  );
  static final _blacklabelLarge = _fontTextTheme.labelLarge?.copyWith(
    fontSize: 12.sp,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );

  static get lightThemeText => TextTheme(
        headlineLarge: _blackheadlineLarge,
        headlineMedium: _blackheadlineMeduim,
        headlineSmall: _blackheadlineSmall,
        titleLarge: _blacktitleLarge,
        titleMedium: _blacktitleMedium,
        titleSmall: _blacktitleSmall,
        bodyMedium: _blackbodyMedium,
        bodySmall: _blackbodySmall,
        labelLarge: _blacklabelLarge,
      );

  static get darkThemeText => TextTheme(
        headlineLarge: _blackheadlineLarge?.copyWith(color: Colors.white),
        headlineMedium: _blackheadlineMeduim?.copyWith(color: Colors.white),
        headlineSmall: _blackheadlineSmall?.copyWith(color: Colors.white),
        titleLarge: _blacktitleLarge?.copyWith(color: Colors.white),
        titleMedium: _blacktitleMedium?.copyWith(color: Colors.white),
        titleSmall: _blacktitleSmall?.copyWith(color: Colors.white),
        bodyMedium: _blackbodyMedium?.copyWith(color: Colors.white),
        bodySmall: _blackbodySmall?.copyWith(color: Colors.white),
        labelLarge: _blacklabelLarge?.copyWith(color: Colors.white),
      );
}