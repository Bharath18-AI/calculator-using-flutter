import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calculator_app/main.dart';

void main() {
  testWidgets('Calculator UI renders and performs calculations', (WidgetTester tester) async {
    // Set a reasonable screen size
    tester.view.physicalSize = const Size(600, 1000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    // Build the Calculator App
    await tester.pumpWidget(const CalculatorApp());
    await tester.pumpAndSettle();

    // Verify initial display is 0
    expect(find.text('0'), findsWidgets);
    expect(find.text('Calculator'), findsOneWidget);

    // Tap '7'
    await tester.tap(find.widgetWithText(InkWell, '7'));
    await tester.pumpAndSettle();

    // Tap '+'
    await tester.tap(find.widgetWithText(InkWell, '+'));
    await tester.pumpAndSettle();

    // Tap '8'
    await tester.tap(find.widgetWithText(InkWell, '8'));
    await tester.pumpAndSettle();

    // Tap '='
    await tester.tap(find.widgetWithText(InkWell, '='));
    await tester.pumpAndSettle();

    // Verify result '15'
    expect(find.text('15'), findsOneWidget);
    expect(find.text('7 + 8 ='), findsOneWidget);

    // Tap 'AC' to clear
    await tester.tap(find.widgetWithText(InkWell, 'AC'));
    await tester.pumpAndSettle();

    // Verify reset to 0
    expect(find.text('0'), findsWidgets);
  });
}
