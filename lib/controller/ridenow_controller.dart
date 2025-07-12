import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RideNowController extends GetxController {
  var pickupController = TextEditingController();
  var destinationController = TextEditingController();

  var isPickupFilled = false.obs;
  var isDestinationFilled = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();

    pickupController.addListener(() {
      isPickupFilled.value = pickupController.text.trim().isNotEmpty;
    });

    destinationController.addListener(() {
      isDestinationFilled.value = destinationController.text.trim().isNotEmpty;
    });
  }

  void onSubmit() {
    if (formKey.currentState!.validate()) {
      Get.snackbar(
        "Ride Confirmed",
        "From: ${pickupController.text}, To: ${destinationController.text}",
        backgroundColor: Colors.green.shade100,
        colorText: Colors.black,
        duration: const Duration(seconds: 2),
      );
    }
  }

  @override
  void onClose() {
    pickupController.dispose();
    destinationController.dispose();
    super.onClose();
  }
}
