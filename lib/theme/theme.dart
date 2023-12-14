import 'package:flutter/material.dart';
import 'package:tobetoapp/theme/app_color.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: AppColorLight.colorScheme,
      primaryColor: AppColorLight.colorScheme.primary,
      scaffoldBackgroundColor: AppColorLight.colorScheme.background,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: AppColorDark.colorScheme,
      primaryColor: AppColorDark.colorScheme.primary,
      scaffoldBackgroundColor: AppColorDark.colorScheme.background,
    );
  }
}
