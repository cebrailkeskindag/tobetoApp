import 'package:flutter/material.dart';

class AppColorLight {
  static ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF6514C8),
    primary: const Color(0xFF6514C8),
    secondary: const Color.fromARGB(255, 53, 234, 186),
    background: const Color(0xFFFFFFFF),
    surface: const Color(0xFF515151),
  );
  static Color textColor = const Color(0xFF515151);
  static Color iconColor = const Color(0xFF515151);
  static Color boxColor = const Color(0xFF0E0B93);
  static Color favoriteButtonColor = const Color(0xFFFE4657);
  static Color appBarBacgroundColor = const Color(0xFFFFFFFF);
  static Color appBartextColor = const Color(0xFFFE4657);
  static Color elevatedButtonColor = Colors.purple;
}

class AppColorDark {
  static ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF6514C8),
    primary: const Color.fromARGB(255, 38, 7, 76),
    secondary: const Color(0xFF004D40),
    background: const Color(0xFF010827),
    surface: const Color(0xFFFFFFFF),
  );
  static Color textColor = const Color(0xFFFFFFFF);
  static Color iconColor = const Color(0xFFFFFFFF);
  static Color boxColor = const Color.fromARGB(255, 9, 9, 12);
  static Color appBarBacgroundColor = const Color(0xFF010827);
  static Color appBartextColor = const Color(0xFFFE4657);
  static Color elevatedButtonColor = Colors.purple;
}
