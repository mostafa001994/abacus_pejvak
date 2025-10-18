import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/theme_data.dart';
import 'theme/theme_provider.dart';
import 'screens/gold_calculator_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const GoldCalculatorApp(),
    ),
  );
}

class GoldCalculatorApp extends StatelessWidget {
  const GoldCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'ماشین‌حساب طلا',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeProvider.themeMode,
      home: const GoldCalculatorScreen(),
    );
  }
}