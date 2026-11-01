import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_provider.dart';

// Experiment 5(b): Advanced State Management using Provider and ChangeNotifier
// Demonstrates centralized reactive calculation state and notifying listeners across widgets.

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: const CalculatorProviderApp(),
    ),
  );
}

class CalculatorProviderApp extends StatelessWidget {
  const CalculatorProviderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Experiment 5 - Provider Calculator',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF17171C),
      ),
      home: const ProviderCalculatorScreen(),
    );
  }
}

class ProviderCalculatorScreen extends StatelessWidget {
  const ProviderCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final calc = context.watch<CounterProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider State Management'),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Calculator Engine Output',
                style: TextStyle(fontSize: 20, color: Colors.white70),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFF212227),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white12),
                ),
                child: Text(
                  calc.value == calc.value.roundToDouble()
                      ? '${calc.value.toInt()}'
                      : calc.value.toStringAsFixed(2),
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFFFF9F0A),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => calc.add(10),
                    icon: const Icon(Icons.add),
                    label: const Text('+10'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => calc.subtract(5),
                    icon: const Icon(Icons.remove),
                    label: const Text('-5'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => calc.multiply(2),
                    icon: const Icon(Icons.close),
                    label: const Text('×2'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => calc.divide(2),
                    icon: const Icon(Icons.safety_divider),
                    label: const Text('÷2'),
                  ),
                  FilledButton.icon(
                    onPressed: calc.reset,
                    icon: const Icon(Icons.clear_all),
                    label: const Text('Clear All'),
                    style: FilledButton.styleFrom(backgroundColor: Colors.redAccent),
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
