import 'package:flutter/material.dart';

class JobHistoryScreen extends StatefulWidget {
  const JobHistoryScreen({super.key});

  @override
  State<JobHistoryScreen> createState() => _JobHistoryScreenState();
}

class _JobHistoryScreenState extends State<JobHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 13, 46, 63),
      body: Center(
        child: Text(
          "Job History Screen",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
