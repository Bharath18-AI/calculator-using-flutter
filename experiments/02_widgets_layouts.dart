import 'package:flutter/material.dart';

// Experiment 2: Explore Flutter widgets and layout using Row, Column and Stack
// to build a modern calculator display and keypad interface.

void main() {
  runApp(const CalculatorLayoutApp());
}

class CalculatorLayoutApp extends StatelessWidget {
  const CalculatorLayoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Experiment 2 - Widgets & Layouts',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF17171C),
      ),
      home: const CalculatorLayoutScreen(),
    );
  }
}

class CalculatorLayoutScreen extends StatelessWidget {
  const CalculatorLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator Layouts (Exp 2)'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Column arranges the display and keypad rows vertically.
        child: Column(
          children: [
            // Stack overlays a mode badge and calculation history over the display box.
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 140,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF212227),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.white10),
                  ),
                  child: const Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      '1,024.50',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 14,
                  left: 18,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF9F0A),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'DEG',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                ),
                const Positioned(
                  top: 16,
                  right: 20,
                  child: Text(
                    '512 × 2 + 0.50 =',
                    style: TextStyle(color: Colors.white54, fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Rows arrange buttons horizontally in a 4-column matrix
            const Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        _Button(text: 'AC', color: Color(0xFF4E505F)),
                        _Button(text: '⌫', color: Color(0xFF4E505F)),
                        _Button(text: '%', color: Color(0xFF4E505F)),
                        _Button(text: '÷', color: Color(0xFFFF9F0A)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        _Button(text: '7'),
                        _Button(text: '8'),
                        _Button(text: '9'),
                        _Button(text: '×', color: Color(0xFFFF9F0A)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        _Button(text: '4'),
                        _Button(text: '5'),
                        _Button(text: '6'),
                        _Button(text: '-', color: Color(0xFFFF9F0A)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        _Button(text: '1'),
                        _Button(text: '2'),
                        _Button(text: '3'),
                        _Button(text: '+', color: Color(0xFFFF9F0A)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        _Button(text: '±', color: Color(0xFF4E505F)),
                        _Button(text: '0'),
                        _Button(text: '.'),
                        _Button(text: '=', color: Color(0xFFFF9F0A)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final String text;
  final Color color;

  const _Button({
    required this.text,
    this.color = const Color(0xFF2E2F38),
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
