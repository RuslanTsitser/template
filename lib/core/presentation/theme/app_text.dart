import 'package:flutter/material.dart';

/// Основная тема для текста
abstract final class AppTextTheme {
  static const theme = TextTheme();
}

abstract final class AppTextStyle {
  /// Poppins
  static const s42w700p = TextStyle(fontSize: 42, fontFamily: 'Poppins', fontWeight: FontWeight.w700);
  static const s36w800p = TextStyle(fontSize: 36, fontFamily: 'Poppins', fontWeight: FontWeight.w800);
  static const s32w700p = TextStyle(fontSize: 32, fontFamily: 'Poppins', fontWeight: FontWeight.w700);
  static const s28w700p = TextStyle(fontSize: 28, fontFamily: 'Poppins', fontWeight: FontWeight.w700);
  static const s24w600p = TextStyle(fontSize: 24, fontFamily: 'Poppins', fontWeight: FontWeight.w600);
  static const s22w700p = TextStyle(fontSize: 22, fontFamily: 'Poppins', fontWeight: FontWeight.w700);
  static const s20w400p = TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400);
  static const s18w700p = TextStyle(fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w700);
  static const s18w600p = TextStyle(fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w600);
  static const s14w500p = TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w500);

  /// Inter
  static const s20w600i = TextStyle(fontSize: 20, fontFamily: 'Inter', fontWeight: FontWeight.w600);
  static const s18w600i = TextStyle(fontSize: 18, fontFamily: 'Inter', fontWeight: FontWeight.w600);
  static const s14w700i = TextStyle(fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w700);
  static const s14w600i = TextStyle(fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w600);
  static const s14w500i = TextStyle(fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w500);
  static const s14w400i = TextStyle(fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w400);
  static const s16w600i = TextStyle(fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.w600);
  static const s16w500i = TextStyle(fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.w500);
  static const s16w400i = TextStyle(fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.w400);
  static const s13w600i = TextStyle(fontSize: 13, fontFamily: 'Inter', fontWeight: FontWeight.w600);
  static const s13w500i = TextStyle(fontSize: 13, fontFamily: 'Inter', fontWeight: FontWeight.w500);
  static const s12w500i = TextStyle(fontSize: 12, fontFamily: 'Inter', fontWeight: FontWeight.w500);
  static const s10w600i = TextStyle(fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w600);
  static const s12w700i = TextStyle(fontSize: 12, fontFamily: 'Inter', fontWeight: FontWeight.w700);
  static const s10w700i = TextStyle(fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700);
  static const s7w600i = TextStyle(fontSize: 7, fontFamily: 'Inter', fontWeight: FontWeight.w600);
}
