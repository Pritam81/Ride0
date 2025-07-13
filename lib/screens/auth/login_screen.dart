import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _rememberMe = false;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      print("Email: ${_emailController.text}");
      print("Password: ${_passwordController.text}");
      // TODO: Add Firebase or backend login logic here

      // Example navigation
      Navigator.pushReplacementNamed(context, '/homescreen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/circlelogoapp.png",
                    width: 120,
                    height: 120,
                  ),
                ),
                Center(
                  child: Text(
                    "Welcome Back",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF2758AD),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Please log in to your account",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[700], fontSize: 16),
                  ),
                ),
                const SizedBox(height: 20),

                // Email Field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: _inputDecoration(
                      "Email",
                      "Enter your email",
                      Icons.email,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Email is required";
                      final emailRegex = RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$',
                      );
                      if (!emailRegex.hasMatch(value))
                        return "Enter a valid email";
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),

                // Password Field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: _inputDecoration(
                      "Password",
                      "Enter your password",
                      Icons.lock,
                    ).copyWith(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed:
                            () => setState(
                              () => _obscurePassword = !_obscurePassword,
                            ),
                      ),
                    ),
                    validator:
                        (value) =>
                            value == null || value.length < 6
                                ? "Password must be at least 6 characters"
                                : null,
                  ),
                ),

                // Remember me and forgot password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/forgot-password');
                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(color: Color(0xFF2758AD)),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // Login Button
                ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2758AD),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 100,
                      vertical: 14,
                    ),
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Divider
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Divider(color: Color(0xFFE0E3E8), thickness: 1),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Or login with",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      const Expanded(
                        child: Divider(color: Color(0xFFE0E3E8), thickness: 1),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Google Logo
                Image.asset(
                  "assets/images/googlelogo1.png",
                  width: 50,
                  height: 40,
                ),
                const SizedBox(height: 30),

                // App Logo
                Image.asset("assets/images/items.png", width: 150, height: 60),
                const SizedBox(height: 10),

                // Register Prompt
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                    children: [
                      const TextSpan(text: "Don't have an account? "),
                      TextSpan(
                        text: "Sign up",
                        style: const TextStyle(
                          color: Color(0xFF2758AD),
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/register',
                                );
                              },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label, String hint, IconData icon) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      prefixIcon: Icon(icon, color: const Color(0xFF2758AD)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFDEE1E6)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE0E3E8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF2758AD), width: 1.8),
      ),
    );
  }
}
