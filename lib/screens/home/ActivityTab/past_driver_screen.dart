import 'package:flutter/material.dart';
import 'package:rideo/utils/colors.dart';

class PastDriverScreen extends StatefulWidget {
  const PastDriverScreen({super.key});

  @override
  State<PastDriverScreen> createState() => _PastDriverScreenState();
}

class _PastDriverScreenState extends State<PastDriverScreen> {
  List<Map<String, String>> pastDrivers = [
    {
      "name": "John Doe",
      "hiredDate": "12/12/2023",
      "imageAddress":
          "https://t4.ftcdn.net/jpg/02/90/27/39/360_F_290273933_ukYZjDv8nqgpOBcBUo5CQyFcxAzYlZRW.jpg", // Placeholder image URL
    },
    {
      "name": "Jane Smith",
      "hiredDate": "11/11/2023",
      "imageAddress":
          "https://upload.wikimedia.org/wikipedia/commons/7/76/Russian_passport_photo.JPG", // Placeholder image URL
    },
    {
      "name": "Alice Johnson",
      "hiredDate": "10/10/2023",
      "imageAddress":
          "https://t4.ftcdn.net/jpg/02/90/27/39/360_F_290273933_ukYZjDv8nqgpOBcBUo5CQyFcxAzYlZRW.jpg", // Placeholder image URL, // Placeholder image URL
    },
    {
      "name": "Bob Brown",
      "hiredDate": "09/09/2023",
      "imageAddress":
          "https://upload.wikimedia.org/wikipedia/commons/7/76/Russian_passport_photo.JPG", // Placeholder image URLPlaceholder image URL
    },
    // Add more past drivers as needed
    {
      "name": "Charlie Green",
      "hiredDate": "08/08/2023",
      "imageAddress":
          "https://via.placeholder.com/150", // Placeholder image URL
    },
    {
      "name": "David Blue",
      "hiredDate": "07/07/2023",
      "imageAddress":
          "https://via.placeholder.com/150", // Placeholder image URL
    },
    // Add more past drivers as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListView.builder(
          itemCount: pastDrivers.length,
          itemBuilder: (context, index) {
            return cardDesign(
              pastDrivers[index]["name"] ?? "",
              pastDrivers[index]["hiredDate"] ?? "",
              pastDrivers[index]["imageAddress"] ?? "",
            );
          },
        ),
      ),
    );
  }

  Widget cardDesign(String name, String hiredDate, String imageAddress) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            // Profile Image
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                imageAddress, // Use network image URL
              ),
            ), // Replace with your asset

            const SizedBox(width: 16),

            // User Info and Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name, // Replace with dynamic user name
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Hired on",
                    style: TextStyle(fontSize: 14, color: Colors.black38),
                  ),
                  Text(
                    hiredDate, // Replace with dynamic hired date",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //
                      InkWell(
                        onTap: () {
                          // Handle view profile action
                          Navigator.pushNamed(
                            context,
                            '/past-driver-profile',
                            arguments: {
                              'name': name,
                              'hiredDate': hiredDate,
                              'imageAddress': imageAddress,
                            },
                          );
                        },
                        child: Container(
                          width: 120,
                          height: 35,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Center(
                            child: Text(
                              "View Profile",
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Handle re-hire action
                        },
                        child: Container(
                          width: 90,
                          height: 35,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              "Re-Hire",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),

                      // ElevatedButton(
                      //   onPressed: () {
                      //     // Handle details action
                      //   },
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: Colors.white,
                      //     padding: const EdgeInsets.symmetric(
                      //       horizontal: 16,
                      //       vertical: 8,
                      //     ),
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(8),
                      //     ),
                      //   ),
                      //   child: const Text(
                      //     "Details",
                      //     style: TextStyle(
                      //       color: Color.fromARGB(255, 34, 128, 252),
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),

                  // Bottom Right Button
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
