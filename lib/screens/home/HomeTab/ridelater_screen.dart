import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RideLaterScreen extends StatefulWidget {
  const RideLaterScreen({super.key});

  @override
  State<RideLaterScreen> createState() => _RideLaterScreenState();
}

class _RideLaterScreenState extends State<RideLaterScreen> {
  final TextEditingController pickupController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  int selectedPassengers = 1;
  String selectedService = "Cab + Driver";

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      dateController.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      timeController.text = picked.format(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F9),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabel("Pickup Location"),
            _buildTextField(pickupController, "Enter pickup location"),

            const SizedBox(height: 15),
            _buildLabel("Destination Location"),
            _buildTextField(
              destinationController,
              "Enter destination location",
            ),

            const SizedBox(height: 15),
            _buildLabel("Date"),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: _buildTextField(dateController, "Select ride date"),
              ),
            ),

            const SizedBox(height: 15),
            _buildLabel("Time"),
            GestureDetector(
              onTap: () => _selectTime(context),
              child: AbsorbPointer(
                child: _buildTextField(timeController, "Select ride time"),
              ),
            ),

            const SizedBox(height: 15),
            _buildLabel("Number of Passengers"),
            DropdownButtonFormField<int>(
              value: selectedPassengers,
              decoration: _inputDecoration(),
              items:
                  List.generate(10, (index) => index + 1)
                      .map(
                        (e) => DropdownMenuItem<int>(
                          value: e,
                          child: Text(e.toString()),
                        ),
                      )
                      .toList(),
              onChanged: (val) {
                if (val != null) setState(() => selectedPassengers = val);
              },
            ),

            const SizedBox(height: 15),
            _buildLabel("Service Type"),
            Row(
              children: [
                Radio<String>(
                  value: "Cab + Driver",
                  groupValue: selectedService,
                  onChanged:
                      (value) => setState(() => selectedService = value!),
                ),
                const Text("Cab + Driver"),
                const SizedBox(width: 10),
                Radio<String>(
                  value: "Only Driver",
                  groupValue: selectedService,
                  onChanged:
                      (value) => setState(() => selectedService = value!),
                ),
                const Text("Only Driver"),
              ],
            ),

            const SizedBox(height: 15),
            _buildLabel("Additional Notes"),
            _buildTextField(notesController, "Optional notes", maxLines: 3),

            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(Icons.schedule_send),
                label: const Text(
                  "Reserve Ride",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                onPressed: () {
                  // Add your booking logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Ride Reserved Successfully!"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 15,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String hint, {
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: _inputDecoration().copyWith(hintText: hint),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE0E3E8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF2563EB), width: 1.5),
      ),
    );
  }
}
