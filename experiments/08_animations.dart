import 'package:flutter/material.dart';

// Experiment 8: Animations in Flutter
// Demonstrates AnimationController, CurvedAnimation, FadeTransition, and ScaleTransition
// to animate calculator result evaluations and button press ripples.

void main() {
  runApp(const CalculatorAnimationApp());
}

class CalculatorAnimationApp extends StatelessWidget {
  const CalculatorAnimationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Experiment 8 - Animations',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF17171C),
      ),
      home: const CalculatorAnimationScreen(),
    );
  }
}

class CalculatorAnimationScreen extends StatefulWidget {
  const CalculatorAnimationScreen({super.key});

  @override
  State<CalculatorAnimationScreen> createState() => _CalculatorAnimationScreenState();
}

class _CalculatorAnimationScreenState extends State<CalculatorAnimationScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  void replayAnimation() {
    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator Animations (Exp 8)'),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(28),
                      decoration: BoxDecoration(
                        color: const Color(0xFF212227),
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(color: const Color(0xFFFF9F0A).withAlpha(100), width: 1.5),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFFF9F0A).withAlpha(30),
                            blurRadius: 20,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: const Column(
                        children: [
                          Icon(Icons.auto_awesome, size: 40, color: Color(0xFFFF9F0A)),
                          SizedBox(height: 12),
                          Text(
                            'Result Computed',
                            style: TextStyle(color: Colors.white70, fontSize: 16),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '42.0',
                            style: TextStyle(
                              fontSize: 64,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFF9F0A),
                            ),
                          ),
                          Text(
                            'Fade + Scale + Slide Reveal',
                            style: TextStyle(color: Colors.white54, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              FilledButton.icon(
                onPressed: replayAnimation,
                icon: const Icon(Icons.replay),
                label: const Text('Replay Evaluation Animation'),
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFFFF9F0A),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
