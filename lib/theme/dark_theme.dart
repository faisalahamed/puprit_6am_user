import 'package:flutter/material.dart';

ThemeData dark({Color color = const Color(0xFF54b46b)}) => ThemeData(
      fontFamily: 'Roboto',
      primaryColor: color,
      secondaryHeaderColor: Color(0xFF009f67),
      disabledColor: Color(0xffa2a7ad),
      backgroundColor: Color(0xFF343636),
      // backgroundColor: Colors.black87,
      errorColor: Color(0xFFdd3135),
      brightness: Brightness.dark,
      hintColor: Color(0xFFbebebe),
      // cardColor: Colors.black,
      cardColor: Color(0xFF343636),
      colorScheme: ColorScheme.dark(primary: color, secondary: color),
      textButtonTheme:
          TextButtonThemeData(style: TextButton.styleFrom(primary: color)),
      // textTheme: TextTheme(
      //     bodyText1: TextStyle(color: Colors.white),
      //     bodyText2: TextStyle(color: Colors.black),
      // subtitle1: TextStyle(color: Colors.black),
      //   ),
    );
