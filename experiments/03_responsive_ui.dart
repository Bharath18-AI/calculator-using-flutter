import 'package:flutter/material.dart';

// Experiment 3: Responsive UI in Flutter using MediaQuery and adaptive breakpoints
// to transition between standard mobile view and wide desktop/tablet calculator with calculation history.

void main() {
  runApp(const ResponsiveCalculatorApp());
}

class ResponsiveCalculatorApp extends StatelessWidget {
  const ResponsiveCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Experiment 3 - Responsive Calculator',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF17171C),
      ),
      home: const ResponsiveCalculatorScreen(),
    );
  }
}

class ResponsiveCalculatorScreen extends StatelessWidget {
  const ResponsiveCalculatorScreen({super.key});

  static const double tabletBreakpoint = 600;
  static const double desktopBreakpoint = 900;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isDesktop = width >= desktopBreakpoint;
    final isTablet = width >= tabletBreakpoint;

    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Calculator (${width.toInt()}px)'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Padding(
            padding: EdgeInsets.all(isTablet ? 24 : 12),
            child: isDesktop
                // Desktop: side-by-side keypad and calculation history panel
                ? const Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(flex: 3, child: _CalculatorPanel()),
                      SizedBox(width: 20),
                      Expanded(flex: 2, child: _HistoryTapePanel()),
                    ],
                  )
                // Mobile & Tablet: vertical flow
                : const Column(
                    children: [
                      Expanded(flex: 4, child: _CalculatorPanel()),
                      SizedBox(height: 12),
                      Expanded(flex: 2, child: _HistoryTapePanel()),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class _CalculatorPanel extends StatelessWidget {
  const _CalculatorPanel();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF212227),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                color: const Color(0xFF17171C),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('480 × 12', style: TextStyle(color: Colors.white54, fontSize: 16)),
                  SizedBox(height: 4),
                  Text('5,760', style: TextStyle(color: Colors.white, fontSize: 44, fontWeight: FontWeight.w300)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  _GridKey('C', Colors.blueGrey),
                  _GridKey('±', Colors.blueGrey),
                  _GridKey('%', Colors.blueGrey),
                  _GridKey('÷', Colors.orange),
                  _GridKey('7', Color(0xFF2E2F38)),
                  _GridKey('8', Color(0xFF2E2F38)),
                  _GridKey('9', Color(0xFF2E2F38)),
                  _GridKey('×', Colors.orange),
                  _GridKey('4', Color(0xFF2E2F38)),
                  _GridKey('5', Color(0xFF2E2F38)),
                  _GridKey('6', Color(0xFF2E2F38)),
                  _GridKey('-', Colors.orange),
                  _GridKey('1', Color(0xFF2E2F38)),
                  _GridKey('2', Color(0xFF2E2F38)),
                  _GridKey('3', Color(0xFF2E2F38)),
                  _GridKey('+', Colors.orange),
                  _GridKey('0', Color(0xFF2E2F38)),
                  _GridKey('.', Color(0xFF2E2F38)),
                  _GridKey('⌫', Colors.blueGrey),
                  _GridKey('=', Colors.orange),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GridKey extends StatelessWidget {
  final String label;
  final Color color;

  const _GridKey(this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Center(
        child: Text(label, style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class _HistoryTapePanel extends StatelessWidget {
  const _HistoryTapePanel();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF212227),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Calculation History', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                Icon(Icons.history, color: Colors.orange),
              ],
            ),
            const Divider(height: 24, color: Colors.white10),
            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    title: Text('480 × 12 =', style: TextStyle(color: Colors.white70)),
                    trailing: Text('5,760', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.orange)),
                  ),
                  ListTile(
                    title: Text('1,250 + 750 =', style: TextStyle(color: Colors.white70)),
                    trailing: Text('2,000', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.orange)),
                  ),
                  ListTile(
                    title: Text('100 ÷ 4 =', style: TextStyle(color: Colors.white70)),
                    trailing: Text('25', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.orange)),
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
