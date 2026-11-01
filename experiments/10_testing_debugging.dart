import 'package:flutter/material.dart';

/// Experiment 10: Testing and Debugging in Flutter
///
/// Demonstrates unit testing, widget testing, and Flutter debugging tools
/// for the Calculator application. Automated tests are located in:
///   - test/calculator_controller_test.dart
///   - test/widget_test.dart
///   - test/exp10_testing_debugging_test.dart

void main() => runApp(const Experiment10App());

class Experiment10App extends StatelessWidget {
  const Experiment10App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Experiment 10 - Testing & Debugging',
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xFF17171C),
        ),
        home: const Experiment10Screen(),
      );
}

class Experiment10Screen extends StatelessWidget {
  const Experiment10Screen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Testing & Debugging (Exp 10)'),
          backgroundColor: Colors.transparent,
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: const [
            Text(
              'A. Calculator Testing Suites',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFFFF9F0A)),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.check_circle, color: Colors.green),
              title: Text('Unit Tests (Arithmetic Logic)'),
              subtitle: Text('Validates addition, subtraction, multiplication, division, zero-checks, and precision formatting in calculator_controller_test.dart.'),
            ),
            ListTile(
              leading: Icon(Icons.touch_app, color: Colors.green),
              title: Text('Widget Tests (UI Interaction)'),
              subtitle: Text('Simulates user button taps (e.g. 7 + 8 = 15) and verifies display output updates in widget_test.dart.'),
            ),
            ListTile(
              leading: Icon(Icons.rule, color: Colors.green),
              title: Text('Boundary & Exception Tests'),
              subtitle: Text('Tests division by zero, duplicate decimal suppression, and negative sign toggling.'),
            ),
            Divider(height: 32, color: Colors.white12),
            Text(
              'B. Flutter Debugging Tools',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFFFF9F0A)),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.account_tree, color: Colors.blueAccent),
              title: Text('Flutter Inspector'),
              subtitle: Text('Inspect widget hierarchy, keypad grid layout, constraints, and padding in real time.'),
            ),
            ListTile(
              leading: Icon(Icons.speed, color: Colors.blueAccent),
              title: Text('Flutter DevTools'),
              subtitle: Text('Profile CPU frames, analyze memory allocations, and inspect network calls.'),
            ),
            ListTile(
              leading: Icon(Icons.bug_report, color: Colors.blueAccent),
              title: Text('IDE Debugger & Breakpoints'),
              subtitle: Text('Step through controller arithmetic execution and inspect state mutations.'),
            ),
            ListTile(
              leading: Icon(Icons.terminal, color: Colors.blueAccent),
              title: Text('Console Logging & Assertions'),
              subtitle: Text('Use debugPrint() and assert() statements to catch arithmetic edge-case regressions.'),
            ),
            Divider(height: 32, color: Colors.white12),
            Text(
              'C. Verification Commands',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.play_arrow),
              title: Text('flutter analyze'),
              subtitle: Text('Performs static code analysis and checks for zero lint warnings.'),
            ),
            ListTile(
              leading: Icon(Icons.play_arrow),
              title: Text('flutter test'),
              subtitle: Text('Executes all unit and widget tests in the test/ directory.'),
            ),
            ListTile(
              leading: Icon(Icons.play_arrow),
              title: Text('flutter run -d chrome'),
              subtitle: Text('Launches the web application in development/debug mode.'),
            ),
          ],
        ),
      );
}
