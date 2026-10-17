import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Warm autumn palette from the reference
  static const Color ink        = Color(0xFFF3E9D6); // cream (text on dark)
  static const Color inkDark    = Color(0xFF2E2A24); // dark text on light
  static const Color muted      = Color(0xFF8A8175);
  static const Color faint      = Color(0xFFA1A276);

  static const Color cream      = Color(0xFFF3E9D6); // page background (light mode)
  static const Color linen      = Color(0xFFEBDEC6);
  static const Color sand       = Color(0xFFDFD0B4);

  // Dark ground palette (matches HTML dark pass)
  static const Color bgDark     = Color(0xFF133420); // Racing green
  static const Color surfDark   = Color(0xFF1E4A2E); // surface
  static const Color surfDark2  = Color(0xFF173D25);

  // Greens
  static const Color forest     = Color(0xFF1D2A10);
  static const Color leaf       = Color(0xFF595D2B);
  static const Color trackGreen = Color(0xFF2E5C3C);
  static const Color moss       = Color(0xFF595D2B);
  static const Color sage       = Color(0xFF8F9259);
  static const Color sagePale   = Color(0xFFE1E2C5);

  // Warm accents
  static const Color terracotta = Color(0xFF7B4A2A); // Walnut — primary action
  static const Color clay       = Color(0xFF4E2F1A);
  static const Color amber      = Color(0xFFA67B5B); // Tan Brown

  static const Color line       = Color(0x1A060D08);
  static const Color lineSoft   = Color(0x0E060D08);

  // Aliases so existing code doesn't break
  static const Color primary    = terracotta;
  static const Color secondary  = amber;
  static const Color accent     = sage;
  static const Color background = cream;
  static const Color cardBg     = Color(0xFFFFFFFF);
  static const Color textDark   = inkDark;
  static const Color textLight  = muted;
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.cream,
    primaryColor: AppColors.terracotta,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.terracotta,
      primary: AppColors.terracotta,
      secondary: AppColors.amber,
      surface: AppColors.cardBg,
    ),
    textTheme: GoogleFonts.interTextTheme().apply(
      bodyColor: AppColors.inkDark,
      displayColor: AppColors.inkDark,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.cream,
      elevation: 0,
      centerTitle: false,
      iconTheme: const IconThemeData(color: AppColors.inkDark),
      titleTextStyle: GoogleFonts.fraunces(
        color: AppColors.inkDark,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.terracotta,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 22),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 13),
      ),
    ),
  );

  // Fraunces for headings
  static TextStyle fraunces({
    double size = 20,
    FontWeight weight = FontWeight.w500,
    Color? color,
    double? height,
    double? spacing,
  }) =>
      GoogleFonts.fraunces(
        fontSize: size,
        fontWeight: weight,
        color: color ?? AppColors.inkDark,
        height: height,
        letterSpacing: spacing ?? -0.4,
      );

  // Inter for body & labels
  static TextStyle inter({
    double size = 12,
    FontWeight weight = FontWeight.w400,
    Color? color,
    double? height,
    double? spacing,
  }) =>
      GoogleFonts.inter(
        fontSize: size,
        fontWeight: weight,
        color: color ?? AppColors.inkDark,
        height: height,
        letterSpacing: spacing,
      );

  // Small caps "section caption" style
  static TextStyle label({
    Color? color,
    double size = 9,
    FontWeight weight = FontWeight.w600,
    double spacing = 1.8,
  }) =>
      GoogleFonts.inter(
        fontSize: size,
        fontWeight: weight,
        color: color ?? AppColors.muted,
        letterSpacing: spacing,
      );
}