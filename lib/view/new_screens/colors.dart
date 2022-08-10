import 'package:flutter/material.dart';

class AppColors {
  // static const Color colorPrimary = Color(0xFF0E745F);
  static const Color colorPrimary = Color(0xFF62a926);
  // static const Color colorPrimary = Color(0xFF62a926);
  // static const Color colorPrimary = Color.fromARGB(255, 158, 33, 112);
  static const Color colorGreenLight = Color(0xFFEEF6F6);
}


ThemeData light({Color color = const Color(0xFF039D55)}) => ThemeData(
  fontFamily: 'Roboto',
  primaryColor: color,
  secondaryHeaderColor: Color(0xFF1ED7AA),
  disabledColor: Color(0xFFBABFC4),
  backgroundColor: Color(0xFFF3F3F3),
  errorColor: Color(0xFFE84D4F),
  brightness: Brightness.light,
  hintColor: Color(0xFF9F9F9F),
  cardColor: Colors.white,
  colorScheme: ColorScheme.light(primary: color, secondary: color),
  textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(primary: color)),
);