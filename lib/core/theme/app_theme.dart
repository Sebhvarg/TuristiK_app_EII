import 'package:flutter/material.dart';
import '../constants/colors.dart';

class AppTheme {
  static final light = ThemeData(
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.primary,
      secondary: AppColors.accent,
    ),
  );
}
