import 'package:flutter/material.dart';

// Experiment 5(a): State Management using setState()
// Demonstrates local state updates within a StatefulWidget for calculator accumulation.

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SetStateCalculatorScreen(),
    ));

class SetStateCalculatorScreen extends StatefulWidget {
  const SetStateCalculatorScreen({super.key});

  @override
  State<SetStateCalculatorScreen> createState() => _SetStateCalculatorScreenState();
}

class _SetStateCalculatorScreenState extends State<SetStateCalculatorScreen> {
  int accumulatedValue = 0;

  void add(int delta) {
    setState(() => accumulatedValue += delta);
  }

  void multiply(int factor) {
    setState(() => accumulatedValue *= factor);
  }

  void reset() {
    setState(() => accumulatedValue = 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF17171C),
      appBar: AppBar(
        title: const Text('setState Calculator Accumulator'),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Current Accumulated Total',
                style: TextStyle(fontSize: 18, color: Colors.white70),
              ),
              const SizedBox(height: 12),
              Text(
                '$accumulatedValue',
                style: const TextStyle(
                  fontSize: 72,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF9F0A),
                ),
              ),
              const SizedBox(height: 28),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => add(1),
                    child: const Text('+1'),
                  ),
                  ElevatedButton(
                    onPressed: () => add(5),
                    child: const Text('+5'),
                  ),
                  ElevatedButton(
                    onPressed: () => add(10),
                    child: const Text('+10'),
                  ),
                  ElevatedButton(
                    onPressed: () => multiply(2),
                    child: const Text('× 2'),
                  ),
                  FilledButton(
                    onPressed: reset,
                    style: FilledButton.styleFrom(backgroundColor: Colors.redAccent),
                    child: const Text('Reset to 0'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
