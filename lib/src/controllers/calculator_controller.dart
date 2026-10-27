import 'package:flutter/foundation.dart';
import '../models/calculator_state.dart';

/// Controller handling all calculator arithmetic, input state, and validation.
class CalculatorController extends ChangeNotifier {
  CalculatorState _state = CalculatorState.initial();

  CalculatorState get state => _state;

  /// Appends a digit (0-9) to the current input.
  void onDigit(String digit) {
    if (_state.hasError) {
      _state = CalculatorState(
        displayValue: digit,
        expression: '',
      );
      notifyListeners();
      return;
    }

    if (_state.waitingForSecondOperand) {
      _state = _state.copyWith(
        displayValue: digit,
        waitingForSecondOperand: false,
      );
      notifyListeners();
      return;
    }

    final current = _state.displayValue;
    // Limit max input digits to prevent overflow
    if (current.replaceAll(RegExp(r'[^0-9]'), '').length >= 15) {
      return;
    }

    if (current == '0') {
      _state = _state.copyWith(displayValue: digit);
    } else {
      _state = _state.copyWith(displayValue: current + digit);
    }
    notifyListeners();
  }

  /// Appends a decimal point if not already present.
  void onDecimal() {
    if (_state.hasError) {
      _state = const CalculatorState(
        displayValue: '0.',
        expression: '',
      );
      notifyListeners();
      return;
    }

    if (_state.waitingForSecondOperand) {
      _state = _state.copyWith(
        displayValue: '0.',
        waitingForSecondOperand: false,
      );
      notifyListeners();
      return;
    }

    if (!_state.displayValue.contains('.')) {
      _state = _state.copyWith(
        displayValue: '${_state.displayValue}.',
      );
      notifyListeners();
    }
  }

  /// Sets or evaluates an operator (+, -, ×, ÷).
  void onOperator(String op) {
    if (_state.hasError) return;

    final currentVal = double.tryParse(_state.displayValue);
    if (currentVal == null) return;

    // Chain operations if an operator is already queued and user has entered the second operand
    if (_state.operator != null &&
        _state.firstOperand != null &&
        !_state.waitingForSecondOperand) {
      final success = _performCalculation();
      if (!success) return;
    }

    final newFirstOperand = double.tryParse(_state.displayValue) ?? currentVal;

    _state = _state.copyWith(
      firstOperand: newFirstOperand,
      operator: op,
      expression: '${formatNumber(newFirstOperand)} $op',
      waitingForSecondOperand: true,
    );
    notifyListeners();
  }

  /// Calculates the final result when '=' is pressed.
  void onEquals() {
    if (_state.hasError) return;
    if (_state.operator == null || _state.firstOperand == null) return;

    _performCalculation(isFinal: true);
  }

  /// Clears the entire calculation state (AC).
  void onClear() {
    _state = CalculatorState.initial();
    notifyListeners();
  }

  /// Removes the last entered character (Backspace).
  void onDelete() {
    if (_state.hasError) {
      onClear();
      return;
    }

    if (_state.waitingForSecondOperand) return;

    final current = _state.displayValue;
    if (current.length <= 1 ||
        (current.length == 2 && current.startsWith('-'))) {
      _state = _state.copyWith(displayValue: '0');
    } else {
      _state = _state.copyWith(
        displayValue: current.substring(0, current.length - 1),
      );
    }
    notifyListeners();
  }

  /// Converts the current number into a percentage (x / 100).
  void onPercentage() {
    if (_state.hasError) return;

    final current = double.tryParse(_state.displayValue);
    if (current == null) return;

    final result = current / 100.0;
    _state = _state.copyWith(
      displayValue: formatNumber(result),
    );
    notifyListeners();
  }

  /// Toggles positive / negative sign (±).
  void onNegate() {
    if (_state.hasError) return;
    final current = _state.displayValue;
    if (current == '0' || current == '0.') return;

    if (current.startsWith('-')) {
      _state = _state.copyWith(displayValue: current.substring(1));
    } else {
      _state = _state.copyWith(displayValue: '-$current');
    }
    notifyListeners();
  }

  /// Core calculation helper. Returns false on error.
  bool _performCalculation({bool isFinal = false}) {
    final first = _state.firstOperand;
    final op = _state.operator;
    final second = double.tryParse(_state.displayValue);

    if (first == null || op == null || second == null) return false;

    double result;
    switch (op) {
      case '+':
        result = first + second;
        break;
      case '-':
        result = first - second;
        break;
      case '×':
        result = first * second;
        break;
      case '÷':
        if (second == 0) {
          _state = _state.copyWith(
            displayValue: 'Error',
            expression: '${formatNumber(first)} ÷ 0',
            hasError: true,
            errorMessage: 'Cannot divide by zero',
            clearFirstOperand: true,
            clearOperator: true,
            waitingForSecondOperand: false,
          );
          notifyListeners();
          return false;
        }
        result = first / second;
        break;
      default:
        return false;
    }

    if (result.isNaN || result.isInfinite) {
      _state = _state.copyWith(
        displayValue: 'Error',
        expression: '',
        hasError: true,
        errorMessage: 'Invalid calculation',
        clearFirstOperand: true,
        clearOperator: true,
      );
      notifyListeners();
      return false;
    }

    final formattedResult = formatNumber(result);

    if (isFinal) {
      _state = _state.copyWith(
        displayValue: formattedResult,
        expression:
            '${formatNumber(first)} $op ${formatNumber(second)} =',
        firstOperand: result,
        clearOperator: true,
        waitingForSecondOperand: true,
      );
    } else {
      _state = _state.copyWith(
        displayValue: formattedResult,
        firstOperand: result,
      );
    }

    notifyListeners();
    return true;
  }

  /// Nicely formats numbers, stripping trailing zeros and resolving floating-point precision artifacts.
  static String formatNumber(double number) {
    if (number.isNaN || number.isInfinite) return 'Error';

    // If it's effectively an integer within standard precision
    if (number == number.roundToDouble() && number.abs() < 1e12) {
      return number.toInt().toString();
    }

    // Format with precision to remove IEEE-754 precision artifacts (e.g., 0.1 + 0.2 = 0.30000000000000004)
    String str = number.toStringAsPrecision(10);

    // If in exponential notation, return standard toString if cleaner
    if (str.contains('e') || str.contains('E')) {
      return number.toString();
    }

    if (str.contains('.')) {
      str = str.replaceAll(RegExp(r'0+$'), '');
      str = str.replaceAll(RegExp(r'\.$'), '');
    }

    return str;
  }
}
