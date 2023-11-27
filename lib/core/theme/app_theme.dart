import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../gen/fonts.gen.dart';
import 'export.dart';

const _textColor = Colors.white;

ThemeData appTheme = ThemeData(
  useMaterial3: true,
  fontFamily: FontFamily.montserrat,
  scaffoldBackgroundColor: AppColors.primaryColor,
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
  colorScheme: const ColorScheme.dark(
    background: AppColors.primaryDarkColor,
    onBackground: AppColors.white,
    primary: AppColors.primaryColor,
    onPrimary: AppColors.white,
    secondary: AppColors.white,
    onSecondary: AppColors.black,
    error: AppColors.red50,
    onError: AppColors.white,
  ),
  textTheme: textTheme.apply(
    bodyColor: _textColor,
    displayColor: _textColor,
  ),
  primaryTextTheme: textTheme.apply(
    bodyColor: _textColor,
    displayColor: _textColor,
  ),
  textSelectionTheme: const TextSelectionThemeData(cursorColor: _textColor),
);

TextTheme textTheme = const TextTheme(
  headlineLarge: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontFamily: FontFamily.montserrat,
    color: _textColor,
  ),
  headlineMedium: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontFamily: FontFamily.montserrat,
    color: _textColor,
  ),
  headlineSmall: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.montserrat,
    color: _textColor,
  ),
  titleLarge: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: FontFamily.montserrat,
    color: _textColor,
  ),
  titleMedium: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: FontFamily.montserrat,
    color: _textColor,
  ),
  bodyLarge: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontFamily: FontFamily.montserrat,
    color: _textColor,
  ),
  bodyMedium: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: FontFamily.montserrat,
    color: _textColor,
  ),
  bodySmall: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: FontFamily.montserrat,
    color: _textColor,
  ),
  labelLarge: TextStyle(
    // For button text
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: FontFamily.montserrat,
    color: AppColors.buttonTextBlack,
  ),
  labelMedium: TextStyle(
    // For input fields
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: FontFamily.montserrat,
    color: _textColor,
  ),
  labelSmall: TextStyle(
    // For input fields (error text)
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: FontFamily.montserrat,
    color: _textColor,
  ),
);
