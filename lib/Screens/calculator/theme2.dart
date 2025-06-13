import 'package:calculator_project/Screens/calculator/theme.dart';
import 'package:flutter/material.dart';

class Theme2 with ChangeNotifier {
  ThemeData _currentTheme = AppTheme.lightMode;
  ThemeData get themeData => _currentTheme;
  bool get isDarkMode => themeData == _currentTheme;
  set themeData(ThemeData themeData) {
    themeData = _currentTheme;
    notifyListeners();
  }

  void toggleTheme() async {
    if (themeData == AppTheme.darkMode) {
      themeData == AppTheme.lightMode;
    } else {
      themeData == AppTheme.darkMode;
    }
  }
}
