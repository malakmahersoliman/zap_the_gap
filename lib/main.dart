import 'package:flutter/material.dart';
import 'package:zap_the_gap/ui/home_page.dart';
import 'package:zap_the_gap/ui/login_screen.dart';
import 'package:zap_the_gap/ui/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Variable to keep track of the theme mode
  bool _isDarkMode = false;

  // Function to toggle the theme mode
  void toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zap the Gap',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme, // Define your light theme in `CustomTheme`
      darkTheme: CustomTheme.darkTheme, // Define your dark theme in `CustomTheme`
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light, // Switch theme
      home: LoginScreen(toggleTheme: () {  },),
    );
  }
}
