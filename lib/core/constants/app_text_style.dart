import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextStyle get medium12 => GoogleFonts.roboto(
    textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
  );
  static TextStyle get medium14 => GoogleFonts.roboto(
    textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
  );
  static TextStyle get medium16 => GoogleFonts.roboto(
    textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
  );
  static TextStyle get medium18 => GoogleFonts.roboto(
    textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
  );
  static TextStyle get semiBold16 => GoogleFonts.roboto(
    textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
  );
  static TextStyle get semiBold18 => GoogleFonts.roboto(
    textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
  );
  static TextStyle get semiBold32 => GoogleFonts.roboto(
    textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 32),
  );
  static TextStyle get regular14 => GoogleFonts.roboto(
    textStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
  );
  static TextStyle get regular16 => GoogleFonts.roboto(
    textStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
  );
}
