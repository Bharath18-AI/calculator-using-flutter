import 'package:flutter/material.dart';

// Experiment 6: Custom Widgets and Themes
// Demonstrates creating reusable modular UI components for calculator applications
// and customizing app-wide visual styling using ThemeData and color schemes.

void main() {
  runApp(const CustomCalculatorThemeApp());
}

class CustomCalculatorThemeApp extends StatelessWidget {
  const CustomCalculatorThemeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Experiment 6 - Custom Widgets & Themes',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF9F0A),
          brightness: Brightness.dark,
          surface: const Color(0xFF212227),
        ),
        scaffoldBackgroundColor: const Color(0xFF17171C),
        cardTheme: const CardThemeData(
          color: Color(0xFF212227),
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8),
        ),
      ),
      home: const CustomThemeScreen(),
    );
  }
}

// Custom reusable widget for calculator mode headers
class CalculatorHeader extends StatelessWidget {
  final String title;
  final String mode;

  const CalculatorHeader({
    super.key,
    required this.title,
    required this.mode,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFF9F0A).withAlpha(40),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.calculate, color: Color(0xFFFF9F0A), size: 32),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text('Mode: $mode', style: const TextStyle(color: Colors.white70)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom reusable widget for calculator display
class CalculatorDisplayCard extends StatelessWidget {
  final String expression;
  final String result;

  const CalculatorDisplayCard({
    super.key,
    required this.expression,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(expression, style: const TextStyle(color: Colors.white54, fontSize: 16)),
            const SizedBox(height: 8),
            Text(
              result,
              style: const TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.w300,
                color: Color(0xFFFF9F0A),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom reusable calculator action button
class CalculatorActionButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback onPressed;
  final Color? color;

  const CalculatorActionButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onPressed,
      icon: Icon(icon ?? Icons.touch_app),
      label: Text(label),
      style: FilledButton.styleFrom(
        backgroundColor: color ?? const Color(0xFFFF9F0A),
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}

class CustomThemeScreen extends StatelessWidget {
  const CustomThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experiment 6 - Custom Widgets'),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const CalculatorHeader(
            title: 'Precision Math Engine',
            mode: 'Arithmetic Evaluation',
          ),
          const SizedBox(height: 12),
          const CalculatorDisplayCard(
            expression: '256 × 4 + 128 =',
            result: '1,152',
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CalculatorActionButton(
                  label: 'Evaluate Expression',
                  icon: Icons.play_arrow,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Custom Calculator Action Triggered')),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
