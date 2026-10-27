import 'package:flutter_test/flutter_test.dart';
import 'package:calculator_app/src/controllers/calculator_controller.dart';

void main() {
  group('CalculatorController Tests', () {
    late CalculatorController controller;

    setUp(() {
      controller = CalculatorController();
    });

    test('Initial state is correct', () {
      expect(controller.state.displayValue, '0');
      expect(controller.state.expression, '');
      expect(controller.state.hasError, false);
      expect(controller.state.firstOperand, null);
      expect(controller.state.operator, null);
    });

    test('Digit input replaces leading zero', () {
      controller.onDigit('5');
      expect(controller.state.displayValue, '5');

      controller.onDigit('8');
      expect(controller.state.displayValue, '58');
    });

    test('Decimal input works correctly', () {
      controller.onDigit('3');
      controller.onDecimal();
      controller.onDigit('1');
      controller.onDigit('4');
      expect(controller.state.displayValue, '3.14');

      // Second decimal should be ignored
      controller.onDecimal();
      expect(controller.state.displayValue, '3.14');
    });

    test('Simple addition: 15 + 27 = 42', () {
      controller.onDigit('1');
      controller.onDigit('5');
      controller.onOperator('+');
      expect(controller.state.expression, '15 +');

      controller.onDigit('2');
      controller.onDigit('7');
      controller.onEquals();

      expect(controller.state.displayValue, '42');
      expect(controller.state.expression, '15 + 27 =');
      expect(controller.state.hasError, false);
    });

    test('Simple subtraction: 50 - 18 = 32', () {
      controller.onDigit('5');
      controller.onDigit('0');
      controller.onOperator('-');
      controller.onDigit('1');
      controller.onDigit('8');
      controller.onEquals();

      expect(controller.state.displayValue, '32');
      expect(controller.state.expression, '50 - 18 =');
    });

    test('Simple multiplication: 7 × 8 = 56', () {
      controller.onDigit('7');
      controller.onOperator('×');
      controller.onDigit('8');
      controller.onEquals();

      expect(controller.state.displayValue, '56');
      expect(controller.state.expression, '7 × 8 =');
    });

    test('Simple division: 144 ÷ 12 = 12', () {
      controller.onDigit('1');
      controller.onDigit('4');
      controller.onDigit('4');
      controller.onOperator('÷');
      controller.onDigit('1');
      controller.onDigit('2');
      controller.onEquals();

      expect(controller.state.displayValue, '12');
      expect(controller.state.expression, '144 ÷ 12 =');
    });

    test('Division by zero yields error state', () {
      controller.onDigit('9');
      controller.onOperator('÷');
      controller.onDigit('0');
      controller.onEquals();

      expect(controller.state.hasError, true);
      expect(controller.state.displayValue, 'Error');
      expect(controller.state.errorMessage, 'Cannot divide by zero');
    });

    test('Chained operations: 10 + 5 + 3 = 18', () {
      controller.onDigit('1');
      controller.onDigit('0');
      controller.onOperator('+');
      controller.onDigit('5');
      controller.onOperator('+');

      expect(controller.state.displayValue, '15');
      expect(controller.state.expression, '15 +');

      controller.onDigit('3');
      controller.onEquals();

      expect(controller.state.displayValue, '18');
      expect(controller.state.expression, '15 + 3 =');
    });

    test('Percentage calculation', () {
      controller.onDigit('2');
      controller.onDigit('5');
      controller.onPercentage();

      expect(controller.state.displayValue, '0.25');
    });

    test('Negation toggle (±)', () {
      controller.onDigit('4');
      controller.onDigit('2');
      controller.onNegate();
      expect(controller.state.displayValue, '-42');

      controller.onNegate();
      expect(controller.state.displayValue, '42');
    });

    test('Backspace deletes last character', () {
      controller.onDigit('1');
      controller.onDigit('2');
      controller.onDigit('3');
      controller.onDelete();
      expect(controller.state.displayValue, '12');

      controller.onDelete();
      expect(controller.state.displayValue, '1');

      controller.onDelete();
      expect(controller.state.displayValue, '0');
    });

    test('Clear (AC) resets everything', () {
      controller.onDigit('9');
      controller.onOperator('×');
      controller.onDigit('9');
      controller.onClear();

      expect(controller.state.displayValue, '0');
      expect(controller.state.expression, '');
      expect(controller.state.hasError, false);
      expect(controller.state.firstOperand, null);
    });

    test('Floating point precision format handles rounding cleanly', () {
      // 0.1 + 0.2 in raw IEEE-754 is 0.30000000000000004
      controller.onDigit('0');
      controller.onDecimal();
      controller.onDigit('1');
      controller.onOperator('+');
      controller.onDigit('0');
      controller.onDecimal();
      controller.onDigit('2');
      controller.onEquals();

      expect(controller.state.displayValue, '0.3');
    });
  });
}
