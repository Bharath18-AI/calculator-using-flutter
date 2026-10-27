import 'package:flutter/material.dart';
import '../controllers/calculator_controller.dart';
import '../utils/constants.dart';
import 'calculator_button.dart';

/// Full calculator keypad containing digits, operators, and action buttons.
class CalculatorKeypad extends StatelessWidget {
  final CalculatorController controller;

  const CalculatorKeypad({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row 1: AC, ⌫, %, ÷
        Expanded(
          child: Row(
            children: [
              CalculatorButton(
                text: 'AC',
                type: ButtonType.action,
                onPressed: controller.onClear,
              ),
              CalculatorButton(
                text: '⌫',
                type: ButtonType.action,
                icon: const Icon(
                  Icons.backspace_outlined,
                  color: AppColors.textPrimary,
                  size: 22,
                ),
                onPressed: controller.onDelete,
              ),
              CalculatorButton(
                text: '%',
                type: ButtonType.action,
                onPressed: controller.onPercentage,
              ),
              CalculatorButton(
                text: '÷',
                type: ButtonType.operator,
                onPressed: () => controller.onOperator('÷'),
              ),
            ],
          ),
        ),
        // Row 2: 7, 8, 9, ×
        Expanded(
          child: Row(
            children: [
              CalculatorButton(
                text: '7',
                onPressed: () => controller.onDigit('7'),
              ),
              CalculatorButton(
                text: '8',
                onPressed: () => controller.onDigit('8'),
              ),
              CalculatorButton(
                text: '9',
                onPressed: () => controller.onDigit('9'),
              ),
              CalculatorButton(
                text: '×',
                type: ButtonType.operator,
                onPressed: () => controller.onOperator('×'),
              ),
            ],
          ),
        ),
        // Row 3: 4, 5, 6, -
        Expanded(
          child: Row(
            children: [
              CalculatorButton(
                text: '4',
                onPressed: () => controller.onDigit('4'),
              ),
              CalculatorButton(
                text: '5',
                onPressed: () => controller.onDigit('5'),
              ),
              CalculatorButton(
                text: '6',
                onPressed: () => controller.onDigit('6'),
              ),
              CalculatorButton(
                text: '-',
                type: ButtonType.operator,
                onPressed: () => controller.onOperator('-'),
              ),
            ],
          ),
        ),
        // Row 4: 1, 2, 3, +
        Expanded(
          child: Row(
            children: [
              CalculatorButton(
                text: '1',
                onPressed: () => controller.onDigit('1'),
              ),
              CalculatorButton(
                text: '2',
                onPressed: () => controller.onDigit('2'),
              ),
              CalculatorButton(
                text: '3',
                onPressed: () => controller.onDigit('3'),
              ),
              CalculatorButton(
                text: '+',
                type: ButtonType.operator,
                onPressed: () => controller.onOperator('+'),
              ),
            ],
          ),
        ),
        // Row 5: ±, 0, ., =
        Expanded(
          child: Row(
            children: [
              CalculatorButton(
                text: '±',
                type: ButtonType.action,
                onPressed: controller.onNegate,
              ),
              CalculatorButton(
                text: '0',
                onPressed: () => controller.onDigit('0'),
              ),
              CalculatorButton(
                text: '.',
                onPressed: controller.onDecimal,
              ),
              CalculatorButton(
                text: '=',
                type: ButtonType.equals,
                onPressed: controller.onEquals,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
