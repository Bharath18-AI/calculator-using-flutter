/// Immutable model representing the current state of the calculator.
class CalculatorState {
  final String displayValue;
  final String expression;
  final double? firstOperand;
  final String? operator;
  final bool waitingForSecondOperand;
  final bool hasError;
  final String? errorMessage;

  const CalculatorState({
    required this.displayValue,
    required this.expression,
    this.firstOperand,
    this.operator,
    this.waitingForSecondOperand = false,
    this.hasError = false,
    this.errorMessage,
  });

  /// Initial clean state
  factory CalculatorState.initial() {
    return const CalculatorState(
      displayValue: '0',
      expression: '',
      firstOperand: null,
      operator: null,
      waitingForSecondOperand: false,
      hasError: false,
      errorMessage: null,
    );
  }

  CalculatorState copyWith({
    String? displayValue,
    String? expression,
    double? firstOperand,
    String? operator,
    bool? waitingForSecondOperand,
    bool? hasError,
    String? errorMessage,
    bool clearFirstOperand = false,
    bool clearOperator = false,
    bool clearErrorMessage = false,
  }) {
    return CalculatorState(
      displayValue: displayValue ?? this.displayValue,
      expression: expression ?? this.expression,
      firstOperand:
          clearFirstOperand ? null : (firstOperand ?? this.firstOperand),
      operator: clearOperator ? null : (operator ?? this.operator),
      waitingForSecondOperand:
          waitingForSecondOperand ?? this.waitingForSecondOperand,
      hasError: hasError ?? this.hasError,
      errorMessage:
          clearErrorMessage ? null : (errorMessage ?? this.errorMessage),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalculatorState &&
          runtimeType == other.runtimeType &&
          displayValue == other.displayValue &&
          expression == other.expression &&
          firstOperand == other.firstOperand &&
          operator == other.operator &&
          waitingForSecondOperand == other.waitingForSecondOperand &&
          hasError == other.hasError &&
          errorMessage == other.errorMessage;

  @override
  int get hashCode => Object.hash(
        displayValue,
        expression,
        firstOperand,
        operator,
        waitingForSecondOperand,
        hasError,
        errorMessage,
      );
}
