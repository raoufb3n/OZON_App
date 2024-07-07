
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const gradient = LinearGradient(
      tileMode: TileMode.decal,
      stops: [0.43, 1],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xff38B000),
        Color(0xff004B23),
      ]);
  static const primary = Color(0xff007200);
  static const secondary = Color(0xff008000);
  static const darkSecondary = Color(0xff008000);
  static const background = Color(0xffFFFFFF);
  static const darkBg = Color(0xff040C23);
  static const button = Color(0xff4C956C);
  static const onBackground = Color(0xffFFFFFF);
  static const grey = Color(0xff8789A3);
  static const darkGrey = Color(0xffA19CC5);
  static const black = Color(0xff004B23);
  static const white = Color(0xffffffff);
  static const onPrimaryDark = Color(0xff121931);
  static const surfaceDark = Color(0xff121931);
  static const pureBlack = Color(0xff000000);

  static ColorScheme lightColorScheme = const ColorScheme.light(
      primary: primary,
      onPrimary: white,
      secondary: secondary,
      background: background,
      onBackground: pureBlack,
      tertiary: grey,
      surface: white);

  static ColorScheme darkColorScheme = const ColorScheme.dark(
      primary: secondary,
      secondary: primary,
      background: darkBg,
      onBackground: background,
      onPrimary: onPrimaryDark,
      tertiary: background,
      surface: surfaceDark);
}
