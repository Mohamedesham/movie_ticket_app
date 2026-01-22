import 'package:flutter/material.dart';

class AppFont {
  static const String primaryFont = 'Poppins';
}

class AppTextStyle {
  // bold
  static const TextStyle bold14 = TextStyle(
    fontFamily: AppFont.primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bold16 = TextStyle(
    fontFamily: AppFont.primaryFont,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle bold18 = TextStyle(
    fontFamily: AppFont.primaryFont,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  // semi bold
  static const TextStyle semibold20 = TextStyle(
    fontFamily: AppFont.primaryFont,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  // regular
  static const TextStyle regular12 = TextStyle(
    fontFamily: AppFont.primaryFont,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
}
