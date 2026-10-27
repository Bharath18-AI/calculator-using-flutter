import 'package:flutter/material.dart';

/// App color palette and styling constants
class AppColors {
  AppColors._();

  static const Color background = Color(0xFF17171C);
  static const Color displayBackground = Color(0xFF212227);
  static const Color surface = Color(0xFF2E2F38);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF9E9EA7);
  static const Color operatorButton = Color(0xFFFF9F0A);
  static const Color functionButton = Color(0xFF4E505F);
  static const Color numberButton = Color(0xFF2E2F38);
  static const Color equalsButton = Color(0xFFFF9F0A);
  static const Color error = Color(0xFFFF453A);
}

/// Types of calculator buttons for distinct styling
enum ButtonType {
  number,
  operator,
  action,
  equals,
}
