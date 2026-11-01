import 'package:flutter/foundation.dart';

/// Provider handling calculator accumulator and count state for Experiment 5.
class CounterProvider extends ChangeNotifier {
  double value = 0.0;

  void add(double amount) {
    value += amount;
    notifyListeners();
  }

  void subtract(double amount) {
    value -= amount;
    notifyListeners();
  }

  void multiply(double factor) {
    value *= factor;
    notifyListeners();
  }

  void divide(double divisor) {
    if (divisor != 0) {
      value /= divisor;
      notifyListeners();
    }
  }

  void reset() {
    value = 0.0;
    notifyListeners();
  }
}
