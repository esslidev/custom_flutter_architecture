import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class AppThemes {
  // Add more text styles as needed...
  static ThemeData themeData = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.redColor, // Set your primary color
    fontFamily: 'SpaceMono',
    scaffoldBackgroundColor: Colors.transparent,
  );

  static const TextStyle headline = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColors.meriGoldColor,
    fontStyle: FontStyle.italic,
  );
  static const TextStyle secondaryHeadline = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColors.subtleColor,
  );

  static const TextStyle bodyText = TextStyle(
    color: AppColors.meriGoldColor,
  );
}
