import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rideo/controller/ridenow_controller.dart';

class RidenowScreen extends StatelessWidget {
  RidenowScreen({super.key});

  final RideNowController rideNowController = Get.put(RideNowController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(left: 4, bottom: 12),
            //   child: Row(
            //     children: const [
            //       Icon(
            //         Icons.directions_car,
            //         color: Color(0xFF2758AD),
            //         size: 24,
            //       ),
            //       SizedBox(width: 8),
            //       Text(
            //         "Ride Details",
            //         style: TextStyle(
            //           fontSize: 22,
            //           fontWeight: FontWeight.bold,
            //           color: Color(0xFF2758AD),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            // Main Card Container
            SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section Header
                  const Text(
                    "Pickup Address",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Pickup Field
                  Obx(
                    () => TextFormField(
                      controller: rideNowController.pickupController,
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'Enter your pickup location',
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.my_location_rounded,
                          color:
                              rideNowController.isPickupFilled.value
                                  ? Colors.red
                                  : Colors.grey,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        filled: true,
                        fillColor: const Color(0xFFF9F9F9),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF2758AD),
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Section Header
                  const Text(
                    "Destination Address",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Destination Field
                  Obx(
                    () => TextFormField(
                      controller: rideNowController.destinationController,
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'Enter your destination',
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.location_on_outlined,
                          color:
                              rideNowController.isDestinationFilled.value
                                  ? Colors.green
                                  : Colors.grey,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        filled: true,
                        fillColor: const Color(0xFFF9F9F9),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF2758AD),
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),

                  // Confirm Button
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: rideNowController.onSubmit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2758AD),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                      ),
                      child: const Text(
                        'Confirm Ride',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
