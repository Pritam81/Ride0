import 'package:flutter/material.dart';

class CurrentDrivesScreen extends StatefulWidget {
  const CurrentDrivesScreen({super.key});

  @override
  State<CurrentDrivesScreen> createState() => _CurrentDrivesScreenState();
}

class _CurrentDrivesScreenState extends State<CurrentDrivesScreen> {
  List<Map<String, String>> currentDrives = [
    {
      "name": "John Doe",
      "status": "Present",
      "attendance": "87%",
      "imageAddress":
          "https://t4.ftcdn.net/jpg/02/90/27/39/360_F_290273933_ukYZjDv8nqgpOBcBUo5CQyFcxAzYlZRW.jpg",
    },
    {
      "name": "Jane Smith",
      "status": "Present",
      "attendance": "92%",
      "imageAddress":
          "https://upload.wikimedia.org/wikipedia/commons/7/76/Russian_passport_photo.JPG",
    },
    {
      "name": "Alice Johnson",
      "status": "Absent",
      "attendance": "0%",
      "imageAddress":
          "https://upload.wikimedia.org/wikipedia/commons/7/76/Russian_passport_photo.JPG",
    },
    {
      "name": "John Doe",
      "status": "Present",
      "attendance": "87%",
      "imageAddress":
          "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.shutterstock.com%2Fsearch%2Fman-passport-picture&psig=AOvVaw2rp-KmoS50Ujl-rfq07jAt&ust=1752509986215000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLjCjs2euo4DFQAAAAAdAAAAABAE",
    },
    {
      "name": "Jane Smith",
      "status": "Present",
      "attendance": "92%",
      "imageAddress":
          "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.shutterstock.com%2Fsearch%2Fwoman-passport-picture&psig=AOvVaw2rp-KmoS50Ujl-rfq07jAt&ust=1752509986215000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLjCjs2euo4DFQAAAAAdAAAAABAE",
    },
    {
      "name": "Alice Johnson",
      "status": "Absent",
      "attendance": "0%",
      "imageAddress":
          "https://t4.ftcdn.net/jpg/02/90/27/39/360_F_290273933_ukYZjDv8nqgpOBcBUo5CQyFcxAzYlZRW.jpg",
    },
    {
      "name": "Bob Brown",
      "status": "Present",
      "attendance": "95%",
      "imageAddress":
          "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.shutterstock.com%2Fsearch%2Fman-passport-picture&psig=AOvVaw2rp-KmoS50Ujl-rfq07jAt&ust=1752509986215000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLjCjs2euo4DFQAAAAAdAAAAABAE",
    },
    {
      "name": "Charlie White",
      "status": "Absent",
      "attendance": "0%",
      "imageAddress":
          "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.shutterstock.com%2Fsearch%2Fwoman-passport-picture&psig=AOvVaw2rp-KmoS50Ujl-rfq07jAt&ust=1752509986215000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLjCjs2euo4DFQAAAAAdAAAAABAE",
    },
    {
      "name": "David Green",
      "status": "Present",
      "attendance": "88%",
      "imageAddress":
          "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.shutterstock.com%2Fsearch%2Fman-passport-picture&psig=AOvVaw2rp-KmoS50Ujl-rfq07jAt&ust=1752509986215000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLjCjs2euo4DFQAAAAAdAAAAABAE",
    },

    // Add more sample data as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListView.builder(
          itemCount: currentDrives.length,
          itemBuilder: (BuildContext context, int index) {
            return cardDesign(
              currentDrives[index]["name"] ?? "Unknown",
              currentDrives[index]["status"] ?? "Unknown",
              currentDrives[index]["attendance"] ?? "0%",
              currentDrives[index]["imageAddress"] ?? "",
            );
          },
        ),
      ),
    );
  }

  Widget cardDesign(
    String name,
    String status,
    String attendance,
    String imageAddress,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 254, 254, 254),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 0,
              blurRadius: 4,
              //offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            // Profile Image

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
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    status,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),

                  Row(
                    children: [
                      Text(
                        "Attendance " + attendance,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      // Handle details action
                      Navigator.pushNamed(
                        context,
                        '/current-driver-details',
                        arguments: {
                          'name': name,
                          'status': status,
                          'attendance': attendance,
                          'imageAddress': imageAddress,
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Details",
                      style: TextStyle(
                        color: Color.fromARGB(255, 34, 128, 252),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Bottom Right Button
                ],
              ),
            ),

            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                //  color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20), // Same as container
                child: Image.network(imageAddress, fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
