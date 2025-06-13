import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    colorScheme: ColorScheme.light(
      surface: Colors.white,
      primary: Colors.grey.shade200,
      inversePrimary: Colors.grey.shade100,
      secondary: const Color.fromARGB(255, 39, 206, 150),
      inverseSurface: Colors.black,
    ),
  );

  static final ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: ColorScheme.dark(
      surface: const Color.fromARGB(255, 10, 10, 10),
      primary: Colors.grey.shade800,
      secondary: Color.fromARGB(255, 25, 143, 104),
      inversePrimary: Colors.grey.shade700,
      inverseSurface: Colors.white,
    ),
  );
}
