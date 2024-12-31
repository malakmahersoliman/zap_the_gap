import 'package:flutter/material.dart';

class CustomTheme {
  static const Color pink = Color(0xFFE91E63);
  static const Color orange = Color(0xFFFF9800);
  static const Color blue = Color(0xFF2196F3);
  static const Color green = Color(0xFF4CAF50);
  static const Color violet = Color(0xFF9C27B0);

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: blue,
    colorScheme: ColorScheme.light(
      primary: blue,
      secondary: pink,
    ),
    appBarTheme: AppBarTheme(
      color: blue,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: orange,
      unselectedItemColor: Colors.grey,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: pink,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF276EB3),
    colorScheme: ColorScheme.dark(
      primary: const Color(0xFF276EB3),
      secondary: violet,
    ),
    appBarTheme: AppBarTheme(
      color: const Color(0xFF276EB3),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: orange,
      unselectedItemColor: Colors.grey,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: orange,
    ),
  );
}
