import 'package:flutter/material.dart';
import 'package:myapp/constants/app_color.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  // Add other light theme properties
);

ThemeData darkTheme = ThemeData(
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: AppColor.primaryColor,
    scaffoldBackgroundColor: AppColor.primaryBgColor,
    useMaterial3: true,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 34, color: AppColor.whiteColor),
      titleMedium: TextStyle(fontSize: 28, color: AppColor.whiteColor),
      titleSmall: TextStyle(
          fontSize: 22,
          color: AppColor.whiteColor,
          fontWeight: FontWeight.w400),
      bodySmall: TextStyle(
          fontSize: 14,
          color: AppColor.whiteColor,
          fontWeight: FontWeight.w300),
    )
    // Add other dark theme properties
    );
