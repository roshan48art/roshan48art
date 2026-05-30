import 'package:flutter/material.dart';

class DisciplineTheme {
  static ThemeData dark() {
    const surface = Color(0xFF111622);
    const primary = Color(0xFF7C5CFF);
    const accent = Color(0xFF00F5D4);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        secondary: accent,
        surface: surface,
        onSurface: Color(0xFFF7F8FF),
      ),
      fontFamily: 'SF Pro Display',
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 48, fontWeight: FontWeight.w800, letterSpacing: -1.8),
        headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, letterSpacing: -0.8),
        titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        bodyLarge: TextStyle(fontSize: 16, height: 1.45, color: Color(0xFFD9DEFF)),
        bodyMedium: TextStyle(fontSize: 14, height: 1.35, color: Color(0xFFAAB2D5)),
      ),
      cardTheme: CardThemeData(
        color: Colors.white.withOpacity(0.08),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      ),
    );
  }
}
