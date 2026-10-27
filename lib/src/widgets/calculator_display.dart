import 'package:flutter/material.dart';
import '../models/calculator_state.dart';
import '../utils/constants.dart';

/// Screen display area showing calculation history, current number, and error status.
class CalculatorDisplay extends StatelessWidget {
  final CalculatorState state;

  const CalculatorDisplay({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: AppColors.displayBackground,
        borderRadius: BorderRadius.circular(28.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Expression / operation history
          AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: state.expression.isNotEmpty ? 1.0 : 0.0,
            child: SizedBox(
              height: 28,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Text(
                  state.expression.isEmpty ? ' ' : state.expression,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          // Main current value display
          FittedBox(
            alignment: Alignment.centerRight,
            fit: BoxFit.scaleDown,
            child: Text(
              state.displayValue,
              style: TextStyle(
                color: state.hasError ? AppColors.error : AppColors.textPrimary,
                fontSize: 54,
                fontWeight: FontWeight.w300,
                letterSpacing: 1.2,
              ),
              maxLines: 1,
            ),
          ),
          if (state.errorMessage != null) ...[
            const SizedBox(height: 4.0),
            Text(
              state.errorMessage!,
              style: const TextStyle(
                color: AppColors.error,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
