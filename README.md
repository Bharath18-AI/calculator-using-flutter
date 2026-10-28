<div align="center">

# 🧮 Modern Flutter Calculator

**A sleek, responsive, and minimalist cross-platform calculator built with Flutter & Dart.**

[![Flutter](https://img.shields.io/badge/Flutter-3.47.8-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.13.7-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web%20%7C%20Windows%20%7C%20macOS%20%7C%20Linux-brightgreen?style=for-the-badge)](https://flutter.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](LICENSE)
[![Tests Passing](https://img.shields.io/badge/Tests-15%20Passed-success?style=for-the-badge&logo=checkmarx&logoColor=white)](test/)

<br/>

</div>

<img width="1280" height="731" alt="Screenshot 2026-10-27 222908" src="https://github.com/user-attachments/assets/0d5a0c5b-81a7-4f4a-a755-22594c27f9af" />

| Element | Flutter Widget | Used For |
| :--- | :--- | :--- |
| **Background & Layout** | `Scaffold`, `Container`, `Column`, `Row`, `Padding` | Screen background, alignment, spacing, and layout. |
| **Title & Display** | `Text` | Displays the calculator title, expression, and result. |
| **Button Grid** | `GridView.count` | Arranges calculator buttons in a grid. |
| **Number & Operation Buttons** | `ElevatedButton` | Handles digits, arithmetic operations, percentage, decimal, sign change, clear, and equals. |
| **Backspace Icon** | `IconButton`, `Icon` | Deletes the last entered character. |
| **Button Styling** | `ButtonStyle`, `RoundedRectangleBorder` | Sets button colors, rounded corners, and appearance. |
| **State Management** | `StatefulWidget`, `setState()` | Updates the display when buttons are pressed. |
| **Calculation Logic** | Dart functions | Performs calculations and handles user input. |

---

## Video Preview


https://github.com/user-attachments/assets/e0a38def-b50b-4813-b8cc-2bbfda6b4d43


---

## ✨ Features

- 🎨 **Minimalist Obsidian UI**: Dark aesthetic inspired by modern macOS and iOS system calculators.
- ⚡ **Real-Time Expression Preview**: Dynamic equation history above the primary display.
- 📐 **High-Precision Arithmetic**: Strips IEEE-754 precision artifacts (e.g., `0.1 + 0.2 = 0.3`).
- 🛡️ **Zero-Division Protection**: Graceful error handling (`Cannot divide by zero`) without crashes.
- 🔄 **Chained Calculations**: Supports continuous sequence operations (e.g., `10 + 5 + 3 = 18`).
- 🔘 **Tactile Button Feedback**: Distinct color palettes for digits, operators, and action buttons with ripple effects.
- 📱 **Adaptive & Responsive**: Dynamically scales across mobile screens, desktop monitors, and web viewports.
- 🧪 **100% Tested**: Comprehensive unit test suite and widget interaction tests.
- 🤖 **Automated Daily Activity**: Scheduled GitHub Actions workflow for continuous daily repository updates.

---

## 🏛️ Clean Architecture

The codebase follows the **Single Responsibility Principle (SRP)** and separation of concerns:

```
lib/
├── main.dart                               # Application bootstrap & Material 3 theme
└── src/
    ├── models/
    │   └── calculator_state.dart          # Immutable state representation
    ├── controllers/
    │   └── calculator_controller.dart     # Pure business logic & calculation handler
    ├── utils/
    │   └── constants.dart                 # App colors, styles, and button type enums
    ├── widgets/
    │   ├── calculator_display.dart        # Screen showing expression and numeric output
    │   ├── calculator_button.dart         # Reusable tactile button with custom styling
    │   └── calculator_keypad.dart         # 4x5 button matrix
    └── screens/
        └── calculator_screen.dart         # Scaffolding and responsive layout container
```

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (`>= 3.0.0`)
- [Dart SDK](https://dart.dev/get-dart) (`>= 3.0.0`)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Bharath18-AI/calculator-using-flutter.git
   cd calculator-using-flutter
   ```

2. Fetch Flutter packages:
   ```bash
   flutter pub get
   ```

3. Run the application:
   ```bash
   # Windows Desktop
   flutter run -d windows

   # Chrome Web
   flutter run -d chrome

   # Connected mobile device / emulator
   flutter run
   ```

---

## 🧪 Testing

Run the full automated test suite (15 unit and widget tests):

```bash
flutter test
```

Run static code analysis:

```bash
flutter analyze
```

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

<div align="center">
  <sub>Built with ❤️ using Flutter and Dart</sub>
</div>
<!-- Last automated health check: 2026-10-28 10:42:44 UTC -->
