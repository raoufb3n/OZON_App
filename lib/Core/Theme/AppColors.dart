import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const primary = Color(0xff2BA84A);
  static const secondary = Color(0xff248232);
  static const background = Color(0xffFCFFFC);
  static const onBackground = Color(0xff040F0F);
  static const grey = Color(0xff2D3A3A);
  static const lightGrey = Color(0xffBAB8B8);
  static const white = Color(0xffffffff);
  static const error = Colors.redAccent;

  static ColorScheme lightColorScheme = const ColorScheme.light(
      primary: primary,
      onPrimary: white,
      secondary: secondary,
      surface: background,
      onSurface: onBackground,
      tertiary: grey,
      error: error,
      onSecondary: lightGrey);
}
