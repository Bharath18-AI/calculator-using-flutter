// Experiment 1: Simple Dart program to understand language basics.
// Covers variables, primitive data types, arithmetic operations,
// string interpolation, and conditional statements in a calculator context.

void main() {
  // Dart variable declarations and primitive data types
  String appName = 'Flutter Calculator Engine';
  int operand1 = 45;
  int operand2 = 15;
  double piValue = 3.14159;
  bool isScientificMode = false;

  print('=== $appName ===');
  print('Operand 1: $operand1');
  print('Operand 2: $operand2');
  print('Pi Constant: $piValue');
  print('Scientific Mode: $isScientificMode');

  // Basic arithmetic operations
  int sum = operand1 + operand2;
  int difference = operand1 - operand2;
  int product = operand1 * operand2;
  double quotient = operand1 / operand2;
  int integerDivision = operand1 ~/ operand2;
  int remainder = operand1 % operand2;

  print('\n--- Arithmetic Operations ---');
  print('$operand1 + $operand2 = $sum');
  print('$operand1 - $operand2 = $difference');
  print('$operand1 × $operand2 = $product');
  print('$operand1 ÷ $operand2 = $quotient');
  print('$operand1 ~/ $operand2 = $integerDivision');
  print('$operand1 % $operand2 = $remainder');

  // Conditional statements and zero-division safeguard
  int divisor = 0;
  print('\n--- Conditional Validation ---');
  if (divisor == 0) {
    print('Error: Division by zero is undefined');
  } else {
    print('Result: ${operand1 / divisor}');
  }

  // Range and sign check
  if (sum > 50) {
    print('Evaluation: High magnitude result ($sum)');
  } else {
    print('Evaluation: Standard range result ($sum)');
  }
}
