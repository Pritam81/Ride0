import 'package:flutter/material.dart';
import 'package:rideo/screens/home/ActivityTab/DriverDetails/current_driver_details_screen.dart';
import 'package:rideo/screens/home/ActivityTab/DriversProfile/past_driver_profile_screen.dart';
import 'package:rideo/screens/auth/forgot_password_screen.dart';
import 'package:rideo/screens/auth/login_screen.dart';
import 'package:rideo/screens/auth/register_screen.dart';
import 'package:rideo/screens/home/home_screen.dart';
import 'package:rideo/screens/onboarding_screen.dart';
import 'package:rideo/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      routes: {
        '/register': (context) => const RegisterScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        '/homescreen': (context) => const HomeScreen(),
        '/past-driver-profile': (context) => const PastDriverProfileScreen(),
        '/current-driver-details': (context) => const CurrentDriverDetailsScreen(),
      },
    );
  }
}
