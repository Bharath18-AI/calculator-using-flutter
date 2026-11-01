import 'package:flutter/material.dart';

// Experiment 4: Navigation and Named Routes in Flutter
// Demonstrates Navigator.pushNamed(), route arguments, and multi-screen navigation
// across Standard Calculator, Scientific Mode, and Calculation History screens.

void main() => runApp(const CalculatorNavigationApp());

class AppRoutes {
  static const standard = '/';
  static const scientific = '/scientific';
  static const history = '/history';
}

class CalculatorNavigationApp extends StatelessWidget {
  const CalculatorNavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Experiment 4 - Calculator Navigation',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF17171C),
      ),
      initialRoute: AppRoutes.standard,
      routes: {
        AppRoutes.standard: (context) => const StandardCalculatorScreen(),
        AppRoutes.scientific: (context) => const ScientificCalculatorScreen(),
        AppRoutes.history: (context) => const HistoryScreen(),
      },
    );
  }
}

class StandardCalculatorScreen extends StatelessWidget {
  const StandardCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Standard Calculator'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.history),
            tooltip: 'View History',
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFF212227),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Standard Mode Active', style: TextStyle(color: Colors.orange, fontSize: 14)),
                    SizedBox(height: 12),
                    Text('345 + 155', style: TextStyle(color: Colors.white54, fontSize: 18)),
                    SizedBox(height: 8),
                    Text('500', style: TextStyle(color: Colors.white, fontSize: 52, fontWeight: FontWeight.w300)),
                  ],
                ),
              ),
              const SizedBox(height: 36),
              FilledButton.icon(
                onPressed: () => Navigator.pushNamed(context, AppRoutes.scientific),
                icon: const Icon(Icons.functions),
                label: const Text('Switch to Scientific Calculator'),
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFFFF9F0A),
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
              const SizedBox(height: 16),
              OutlinedButton.icon(
                onPressed: () => Navigator.pushNamed(context, AppRoutes.history),
                icon: const Icon(Icons.history),
                label: const Text('Open Calculation History'),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScientificCalculatorScreen extends StatelessWidget {
  const ScientificCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scientific Calculator'),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Advanced Mathematical Functions',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
            ),
            const SizedBox(height: 16),
            const Text('Supported functions in Scientific Mode:'),
            const SizedBox(height: 16),
            const Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                Chip(label: Text('sin(x)')),
                Chip(label: Text('cos(x)')),
                Chip(label: Text('tan(x)')),
                Chip(label: Text('log₁₀(x)')),
                Chip(label: Text('ln(x)')),
                Chip(label: Text('√x')),
                Chip(label: Text('x²')),
                Chip(label: Text('xʸ')),
                Chip(label: Text('π (3.14159)')),
                Chip(label: Text('e (2.71828)')),
              ],
            ),
            const Spacer(),
            const Text(
              'Use the top-left back button or Navigator.pop() to return to Standard Mode.',
              style: TextStyle(color: Colors.white54),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 48)),
              child: const Text('Back to Standard Calculator'),
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculation History'),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.calculate)),
            title: Text('345 + 155 ='),
            trailing: Text('500', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.orange)),
          ),
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.calculate)),
            title: Text('12.5 × 8 ='),
            trailing: Text('100', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.orange)),
          ),
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.calculate)),
            title: Text('√144 ='),
            trailing: Text('12', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.orange)),
          ),
        ],
      ),
    );
  }
}
