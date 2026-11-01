import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../experiments/06_custom_widgets_themes.dart';
import '../experiments/07_forms_validation.dart';
import '../experiments/10_testing_debugging.dart';

void main() {
  group('Experiment 10 - Calculator UI Widget Tests', () {
    testWidgets('CalculatorHeader displays title and mode correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CalculatorHeader(
              title: 'Precision Math Engine',
              mode: 'Arithmetic Evaluation',
            ),
          ),
        ),
      );

      expect(find.text('Precision Math Engine'), findsOneWidget);
      expect(find.text('Mode: Arithmetic Evaluation'), findsOneWidget);
    });

    testWidgets('CalculatorDisplayCard renders expression and result', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CalculatorDisplayCard(
              expression: '256 × 4 =',
              result: '1,024',
            ),
          ),
        ),
      );

      expect(find.text('256 × 4 ='), findsOneWidget);
      expect(find.text('1,024'), findsOneWidget);
    });

    testWidgets('CalculationFormScreen shows validation errors when submitted empty', (tester) async {
      await tester.pumpWidget(const CalculatorFormApp());
      await tester.pumpAndSettle();

      final computeButton = find.text('Compute Result');
      await tester.ensureVisible(computeButton);
      await tester.tap(computeButton);
      await tester.pumpAndSettle();

      expect(find.text('Please enter a number'), findsNWidgets(2));
    });

    testWidgets('CalculationFormScreen rejects division by zero', (tester) async {
      await tester.pumpWidget(const CalculatorFormApp());
      await tester.pumpAndSettle();

      // Enter first operand: 10
      final firstField = find.widgetWithText(TextFormField, 'First Operand');
      await tester.enterText(firstField, '10');

      // Change operator to division (÷)
      final dropdown = find.byType(DropdownButtonFormField<String>);
      await tester.tap(dropdown);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Division (÷)').last);
      await tester.pumpAndSettle();

      // Enter second operand: 0
      final secondField = find.widgetWithText(TextFormField, 'Second Operand');
      await tester.enterText(secondField, '0');

      // Submit
      final computeButton = find.text('Compute Result');
      await tester.ensureVisible(computeButton);
      await tester.tap(computeButton);
      await tester.pumpAndSettle();

      expect(find.text('Cannot divide by zero'), findsOneWidget);
    });

    testWidgets('Experiment10Screen renders testing and verification checklist', (tester) async {
      tester.view.physicalSize = const Size(800, 1400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(const Experiment10App());
      await tester.pumpAndSettle();

      expect(find.text('A. Calculator Testing Suites'), findsOneWidget);
      expect(find.text('B. Flutter Debugging Tools'), findsOneWidget);

      final analyzeCmd = find.text('flutter analyze');
      await tester.scrollUntilVisible(analyzeCmd, 200);
      expect(analyzeCmd, findsOneWidget);

      final testCmd = find.text('flutter test');
      await tester.scrollUntilVisible(testCmd, 200);
      expect(testCmd, findsOneWidget);
    });
  });
}
