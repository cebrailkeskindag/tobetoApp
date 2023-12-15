import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tobetoapp/theme/app_color.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: AppColorLight.colorScheme,
      primaryColor: AppColorLight.colorScheme.primary,
      scaffoldBackgroundColor: AppColorLight.colorScheme.background,
      listTileTheme: ListTileThemeData(
          titleTextStyle: GoogleFonts.poppins(
            fontSize: 18.0,
            color: AppColorLight.textColor,
          ),
          iconColor: AppColorLight.iconColor),
      iconTheme: IconThemeData(color: AppColorLight.iconColor),
      textTheme: TextTheme(
        titleLarge: GoogleFonts.poppins(
          fontSize: 18.0,
          color: AppColorLight.textColor,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 18.0,
          color: AppColorLight.textColor,
        ),
        displaySmall: GoogleFonts.poppins(),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: AppColorLight.appBarBacgroundColor,
        iconTheme: IconThemeData(color: AppColorLight.iconColor),
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 22.0,
          color: AppColorLight.textColor,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: AppColorLight.textColor,
        ),
        prefixIconColor: AppColorLight.iconColor,
        suffixIconColor: AppColorLight.iconColor,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: AppColorDark.colorScheme,
      primaryColor: AppColorDark.colorScheme.primary,
      scaffoldBackgroundColor: AppColorDark.colorScheme.background,
      listTileTheme: ListTileThemeData(
          titleTextStyle: GoogleFonts.poppins(
            fontSize: 18.0,
            color: AppColorDark.textColor,
          ),
          iconColor: AppColorDark.iconColor),
      iconTheme: IconThemeData(color: AppColorDark.iconColor),
      textTheme: TextTheme(
        titleLarge: GoogleFonts.poppins(
          fontSize: 18.0,
          color: AppColorDark.textColor,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 18.0,
          color: AppColorDark.textColor,
        ),
        displaySmall: GoogleFonts.poppins(),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: AppColorDark.appBarBacgroundColor,
        iconTheme: IconThemeData(color: AppColorDark.iconColor),
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 22.0,
          color: AppColorDark.textColor,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: AppColorDark.textColor,
        ),
        prefixIconColor: AppColorDark.iconColor,
        suffixIconColor: AppColorDark.iconColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              AppColorDark.elevatedButtonColor),
        ),
      ),
    );
  }
}
