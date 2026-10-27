import 'package:flutter/material.dart';
import 'src/screens/calculator_screen.dart';
import 'src/utils/constants.dart';

void main() {
  runApp(const CalculatorApp());
}

/// Root widget of the application.
class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.operatorButton,
          surface: AppColors.surface,
        ),
      ),
      home: const CalculatorScreen(),
    );
  }
}
