import 'package:flutter/material.dart';

class CustomTheme {
  static const Color pink = Color(0xFFE91E63);
  static const Color orange = Color(0xFFFF9800);
  static const Color blue = Color(0xFF2196F3);
  static const Color green = Color(0xFF4CAF50);
  static const Color violet = Color(0xFF9C27B0);

  static final _light = ThemeData(
    brightness: Brightness.light,
    primaryColor: blue,
    colorScheme: ColorScheme.light(
      primary: blue,
      secondary: const Color.fromARGB(255, 173, 43, 86),
      surface: Colors.white,
      background: Colors.grey[50]!,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.white,
      error: Colors.red,
    ),
    appBarTheme: AppBarTheme(
      color: blue,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      elevation: 4,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      toolbarHeight: 70,
    ),
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.white,
    buttonTheme: ButtonThemeData(
      buttonColor: orange,
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.normal),
      titleSmall: TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.normal),
      bodyLarge: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.normal),
      bodyMedium: TextStyle(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.normal),
      bodySmall: TextStyle(color: Colors.black45, fontSize: 12, fontWeight: FontWeight.normal),
    ),
  );

  static final _dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color.fromARGB(255, 39, 116, 179),
    colorScheme: ColorScheme.dark(
      primary: const Color.fromARGB(255, 39, 116, 179),
      secondary: const Color.fromARGB(255, 135, 42, 151),
      surface: Colors.grey[900]!,
      background: Colors.black,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.white,
      onBackground: Colors.white,
      onError: Colors.white,
      error: Colors.redAccent,
    ),
    appBarTheme: AppBarTheme(
      color: const Color.fromARGB(255, 39, 116, 179),
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      elevation: 4,
      shadowColor: Colors.black45,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      toolbarHeight: 70,
    ),
    scaffoldBackgroundColor: Colors.black,
    cardColor: Colors.grey[800],
    buttonTheme: ButtonThemeData(
      buttonColor: const Color.fromARGB(255, 187, 122, 24),
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.normal),
      titleSmall: TextStyle(color: Colors.white70, fontSize: 18, fontWeight: FontWeight.normal),
      bodyLarge: TextStyle(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.normal),
      bodyMedium: TextStyle(color: Colors.white54, fontSize: 14, fontWeight: FontWeight.normal),
      bodySmall: TextStyle(color: Colors.white38, fontSize: 12, fontWeight: FontWeight.normal),
    ),
  );

  static ThemeData get lightTheme => _light;
  static ThemeData get darkTheme => _dark;
}


