import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final List<String> _taglines = [
    "Real-time Driver Booking",
    "Temporary Driver Hire",
    "Full-time Professional Drivers",
  ];

  int _currentIndex = 0;
  late Timer _textSwitchTimer;

  @override
  void initState() {
    super.initState();

    // Rotate taglines every 2 seconds
    _textSwitchTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _taglines.length;
      });
    });

    // Navigate to the next screen after splash
    Future.delayed(const Duration(seconds: 5), () {
      // Example navigation (replace with your real route)
      // Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  void dispose() {
    _textSwitchTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF053381),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/applogo2.jpg", width: 180, height: 180),
            const SizedBox(height: 20),
            const Text(
              "RideO",
              style: TextStyle(
                fontSize: 44,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 10),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Text(
                _taglines[_currentIndex],
                key: ValueKey<String>(_taglines[_currentIndex]),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              "A product of Visito Venture India (P) Ltd.",
              style: TextStyle(fontSize: 12, color: Colors.white60),
            ),
          ],
        ),
      ),
    );
  }
}
