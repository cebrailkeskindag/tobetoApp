import 'package:flutter/material.dart';

class AppColorLight {
  static ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF6514C8),
    onPrimary: const Color(0xFFFFFFFF),
    primary: const Color(0xFF6514C8),
    secondary: const Color.fromARGB(255, 53, 234, 186),
    background: const Color(0xFFFFFFFF),
    surface: const Color(0xFF515151),
    onSecondary: const Color(0xFF000000),
  );
  static Color textColor = const Color(0xFF515151);
  static Color iconColor = const Color(0xFF515151);
  static Color boxColor = const Color(0xFF0E0B93);
  static Color favoriteButtonColor = const Color(0xFFFE4657);
  static Color appBarBacgroundColor = const Color(0xFFFFFFFF);
  static Color appBartextColor = const Color(0xFF515151);
  static Color drawerBacgroundColor = const Color(0xFFFFFFFF);
  static Color elevatedButtonColor = Color(0xFF6514C8);
  static Color cardColor = const Color(0xFFFFFFFF);
}

class AppColorDark {
  static ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF6514C8),
    onPrimary: const Color(0xFFFFFFFF),
    primary: const Color(0xFF00d29b),
    secondary: const Color(0xFF00d29b),
    background: const Color(0xFF010827),
    surface: const Color(0xFFFFFFFF),
    onSecondary: const Color(0xFFFFFFFF),
  );
  static Color textColor = const Color(0xFFFFFFFF);
  static Color iconColor = const Color(0xFFFFFFFF);
  static Color boxColor = const Color.fromARGB(255, 9, 9, 12);
  static Color appBarBacgroundColor = const Color(0xFF010827);
  static Color appBartextColor = const Color(0xFFFFFFFF);
  static Color drawerBacgroundColor = const Color(0xFF010827);
  static Color elevatedButtonColor = const Color(0xFF6514C8);
  static Color cardColor = const Color(0xFF0B2B40);
}
