import 'package:flutter/material.dart';
import '../utils/constants.dart';

/// Reusable calculator button widget with smooth splash effects and distinct styles.
class CalculatorButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final VoidCallback onPressed;
  final ButtonType type;
  final int flex;

  const CalculatorButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.type = ButtonType.number,
    this.flex = 1,
  });

  Color _getBackgroundColor() {
    switch (type) {
      case ButtonType.operator:
        return AppColors.operatorButton;
      case ButtonType.action:
        return AppColors.functionButton;
      case ButtonType.equals:
        return AppColors.equalsButton;
      case ButtonType.number:
        return AppColors.numberButton;
    }
  }

  Color _getTextColor() {
    return AppColors.textPrimary;
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = _getBackgroundColor();
    final textColor = _getTextColor();

    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Material(
          color: bgColor,
          borderRadius: BorderRadius.circular(24.0),
          clipBehavior: Clip.antiAlias,
          elevation: 2,
          shadowColor: Colors.black38,
          child: InkWell(
            onTap: onPressed,
            splashColor: Colors.white10,
            highlightColor: Colors.white12,
            child: Center(
              child: icon ??
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        text,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 26,
                          fontWeight: type == ButtonType.operator ||
                                  type == ButtonType.equals
                              ? FontWeight.w600
                              : FontWeight.w400,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
