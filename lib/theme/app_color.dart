import 'package:flutter/material.dart';

class AppColorLight {
  static ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF6514C8),
      primary: const Color(0xFF6514C8),
      secondary: const Color(0xFF00D29B),
      background: const Color(0xFFFFFFFF));
  static final Color textColor = Color(0xFF515151);
  static final Color boxColor = Color(0xFF0E0B93);
  static final Color favoriteButtonColor = Color(0xFFFE4657);
}
class AppColorDark {
  static ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF6514C8),
      primary: Color.fromARGB(255, 38, 7, 76),
      secondary: const Color(0xFF004D40),
      background: const Color(0xFF212121));
  static final Color textColor = Color(0xFFFFFFFF);
  static final Color boxColor = Color(0xFF0E0B93);
  static final Color favoriteButtonColor = Color(0xFFFE4657);
}