import 'package:flutter/material.dart';

class PastDriverProfileScreen extends StatefulWidget {
  const PastDriverProfileScreen({super.key});

  @override
  State<PastDriverProfileScreen> createState() => _PastDriverProfileScreenState();
}

class _PastDriverProfileScreenState extends State<PastDriverProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Past Driver Profile Screen",
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}