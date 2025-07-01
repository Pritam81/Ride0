import 'package:flutter/material.dart';
import 'package:rideo/screens/auth/register_screen.dart';
import 'package:rideo/screens/onboarding_screen.dart';
import 'package:rideo/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const SplashScreen(), routes: {
      '/register': (context) => const RegisterScreen(),
      '/onboarding': (context) => const OnboardingScreen(),
    });
  }
}
