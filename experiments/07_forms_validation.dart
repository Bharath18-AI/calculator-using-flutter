import 'package:flutter/material.dart';

// Experiment 7: Forms, Validation and Error Handling
// Builds an interactive arithmetic calculation form with input validation,
// division-by-zero prevention, syntax checks, and SnackBar alerts.

void main() {
  runApp(const CalculatorFormApp());
}

class CalculatorFormApp extends StatelessWidget {
  const CalculatorFormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Experiment 7 - Calculator Form',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF9F0A),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF17171C),
      ),
      home: const CalculationFormScreen(),
    );
  }
}

class CalculationFormScreen extends StatefulWidget {
  const CalculationFormScreen({super.key});

  @override
  State<CalculationFormScreen> createState() => _CalculationFormScreenState();
}

class _CalculationFormScreenState extends State<CalculationFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final num1Controller = TextEditingController();
  final num2Controller = TextEditingController();
  String selectedOperator = '+';
  String? computedResult;

  String? validateNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter a number';
    }
    if (double.tryParse(value.trim()) == null) {
      return 'Enter a valid numeric value';
    }
    return null;
  }

  String? validateSecondOperand(String? value) {
    final baseValidation = validateNumber(value);
    if (baseValidation != null) return baseValidation;

    final parsed = double.tryParse(value!.trim());
    if (selectedOperator == '÷' && parsed == 0) {
      return 'Cannot divide by zero';
    }
    return null;
  }

  void calculate() {
    if (_formKey.currentState!.validate()) {
      final n1 = double.parse(num1Controller.text.trim());
      final n2 = double.parse(num2Controller.text.trim());
      double res = 0;

      switch (selectedOperator) {
        case '+':
          res = n1 + n2;
          break;
        case '-':
          res = n1 - n2;
          break;
        case '×':
          res = n1 * n2;
          break;
        case '÷':
          res = n1 / n2;
          break;
      }

      setState(() {
        computedResult = res == res.roundToDouble() ? '${res.toInt()}' : res.toStringAsFixed(4);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Calculated: $n1 $selectedOperator $n2 = $computedResult'),
          backgroundColor: Colors.green.shade800,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please correct validation errors in the form'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  void dispose() {
    num1Controller.dispose();
    num2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator Form & Validation (Exp 7)'),
        backgroundColor: Colors.transparent,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              'Arithmetic Formula Evaluator',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 8),
            const Text(
              'Performs validated binary operations with divide-by-zero checks.',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 24),

            TextFormField(
              controller: num1Controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'First Operand',
                prefixIcon: Icon(Icons.numbers),
                border: OutlineInputBorder(),
              ),
              validator: validateNumber,
            ),
            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              initialValue: selectedOperator,
              decoration: const InputDecoration(
                labelText: 'Select Operator',
                prefixIcon: Icon(Icons.calculate),
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: '+', child: Text('Addition (+)')),
                DropdownMenuItem(value: '-', child: Text('Subtraction (-)')),
                DropdownMenuItem(value: '×', child: Text('Multiplication (×)')),
                DropdownMenuItem(value: '÷', child: Text('Division (÷)')),
              ],
              onChanged: (val) {
                if (val != null) setState(() => selectedOperator = val);
              },
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: num2Controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Second Operand',
                prefixIcon: Icon(Icons.numbers),
                border: OutlineInputBorder(),
              ),
              validator: validateSecondOperand,
            ),
            const SizedBox(height: 24),

            FilledButton.icon(
              onPressed: calculate,
              icon: const Icon(Icons.done_all),
              label: const Text('Compute Result'),
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFFFF9F0A),
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 48),
              ),
            ),

            if (computedResult != null) ...[
              const SizedBox(height: 24),
              Card(
                color: const Color(0xFF212227),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Text('Evaluation Result', style: TextStyle(color: Colors.white70)),
                      const SizedBox(height: 8),
                      Text(
                        computedResult!,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF9F0A),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
