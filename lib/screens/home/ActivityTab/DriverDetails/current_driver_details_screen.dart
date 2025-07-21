import 'package:flutter/material.dart';

class CurrentDriverDetailsScreen extends StatefulWidget {
  const CurrentDriverDetailsScreen({super.key});

  @override
  State<CurrentDriverDetailsScreen> createState() => _CurrentDriverDetailsScreenState();
}

class _CurrentDriverDetailsScreenState extends State<CurrentDriverDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Current Driver Details Screen",
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}