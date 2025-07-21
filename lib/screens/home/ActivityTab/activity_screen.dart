import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:rideo/screens/home/ActivityTab/current_drives_screen.dart';
import 'package:rideo/screens/home/ActivityTab/job_history_screen.dart';
import 'package:rideo/screens/home/ActivityTab/past_driver_screen.dart';
import 'package:rideo/utils/colors.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  var isSelected = 0;
  final List<String> activityTabs = [
    "Current Drivers",
    "Past Drivers",
    "Job History",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
            child: Text(
              "Activity",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 45,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 12,
                  ),
                  hintText: "Search drivers...",
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                  prefixIcon: Icon(Icons.search, color: primaryColor, size: 22),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: primaryColor.withOpacity(0.4),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: primaryColor, width: 1.5),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(activityTabs.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    isSelected = index;
                  });
                },
                child: Column(
                  children: [
                    Text(
                      activityTabs[index],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight:
                            isSelected == index
                                ? FontWeight.bold
                                : FontWeight.w500,
                        color:
                            isSelected == index
                                ? primaryColor
                                : Colors.grey[600],
                      ),
                    ),
                    if (isSelected == index)
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        height: 2.5,
                        width: index == 0 ? 120 : 85,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                  ],
                ),
              );
            }),
          ),

          if (isSelected == 0) ...[Expanded(child: CurrentDrivesScreen())],
          if (isSelected == 1) ...[Expanded(child: PastDriverScreen())],
          if (isSelected == 2) ...[Expanded(child: JobHistoryScreen())],
        ],
      ),
    );
  }
}
