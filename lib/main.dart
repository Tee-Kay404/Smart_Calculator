import 'package:calculator_project/Screens/calculator/calculator.dart';
import 'package:calculator_project/Screens/calculator/theme2.dart';
import 'package:calculator_project/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:calculator_project/providers/calculator_provider.dart';
import 'package:calculator_project/Screens/calculator/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CalculatorProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => Theme2()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final themeMode =
        themeProvider.themeMode == ThemeMode.system
            ? ThemeMode.light
            : themeProvider.themeMode;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightMode,
      darkTheme: AppTheme.darkMode,
      themeMode: themeMode,
      home: Calculator(),
    );
  }
}
