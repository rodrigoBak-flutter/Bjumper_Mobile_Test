import 'package:flutter/material.dart';

class BjumperColors {
  // PRIMARY COLORS
  static const Color primary005Background = Color(0xFFF2F8FF);
  static const Color primary007 = Color(0xFFE6F3FD);
  static const Color primary010Background = Color(0xFFDBECFF);
  static const Color primary015Background = Color(0xFFBCDBFF);
  static const Color primary020 = Color(0xFF8FB1D9);
  static const Color primary025 = Color(0xFF1096ED);
  static const Color primary030 = Color(0xFF0045E6);
  static const Color primary040 = Color(0xFF0021C9);
  static const Color primary050 = Color(0xFF001489);

  // GRADIENT COLORS
  static const Color secondaryColor = Color(0xFF0D5AFD);
  static const LinearGradient splashGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF0D5AFD),
        Color(0xFF0021C9),
      ]);

  // ACCENT COLORS
  static const Color accent010 = Color(0xFFFFFAE6);
  static const Color accent020 = Color(0xFFFFF2BB);
  static const Color accent030 = Color(0xFFFFCC00);
  static const Color accent040 = Color(0xFFA88600);
  static const Color accent050 = Color(0xFF7A6200);
  // NEUTRAL COLORS
  static const Color neutral010 = Color(0xFFFFFFFF);
  static const Color neutral020Background = Color(0xFFF6F8FB);
  static const Color neutral030DisabledBG = Color(0xFFEBEDEF);
  static const Color neutral035 = Color(0xFFE1E3E5);
  static const Color neutral040 = Color(0xFFB6BCC3);
  static const Color neutral050DisabledTxt = Color(0xFF868E98);
  static const Color neutral060BodyCopy = Color(0xFF5D636B);
  static const Color neutral070Midnight = Color(0xFF0F172A);
  // OVERLAY COLORS
  static const Color overlay = Color(0x26001489);
  // SYSTEM COLORS
  // Success
  static const Color system010SuccessBG = Color(0xFFF1F8E7);
  static const Color system020SuccessStroke = Color(0xFFE3F2CE);
  static const Color system030SuccessTxt = Color(0xFF0E7D21);
//  Error
  static const Color system010ErrorBG = Color(0xFFFFF1F1);
  static const Color system020ErrorStroke = Color(0xFFFFE1E1);
  static const Color system025Intense = Color(0xFFFFC3C3);
  static const Color system030ErrorTxt = Color(0xFFD20303);
// Warning
  static const Color system010WarningBG = Color(0xFFFFF5ED);
  static const Color system020WarningStroke = Color(0xFFFFDEC0);
  static const Color system030WarningTxt = Color(0xFFD96900);
  const BjumperColors._();
}
