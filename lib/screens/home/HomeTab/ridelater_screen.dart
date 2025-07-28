import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RideLaterScreen extends StatefulWidget {
  const RideLaterScreen({super.key});

  @override
  State<RideLaterScreen> createState() => _RideLaterScreenState();
}

class _RideLaterScreenState extends State<RideLaterScreen> {
  final _formKey = GlobalKey<FormState>();

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
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel("Pickup Location"),
              _buildUnderlineField(
                controller: pickupController,
                hint: "Enter pickup location",
                icon: Icons.location_on_outlined,
                validatorText: "Pickup location is required",
              ),
              const SizedBox(height: 20),

              _buildLabel("Destination Location"),
              _buildUnderlineField(
                controller: destinationController,
                hint: "Enter destination location",
                icon: Icons.flag_outlined,
                validatorText: "Destination is required",
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel("Date"),
                        GestureDetector(
                          onTap: () => _selectDate(context),
                          child: AbsorbPointer(
                            child: _buildUnderlineField(
                              controller: dateController,
                              hint: "Select date",
                              icon: Icons.calendar_today_outlined,
                              validatorText: "Date is required",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel("Time"),
                        GestureDetector(
                          onTap: () => _selectTime(context),
                          child: AbsorbPointer(
                            child: _buildUnderlineField(
                              controller: timeController,
                              hint: "Select time",
                              icon: Icons.access_time,
                              validatorText: "Time is required",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              _buildLabel("Number of Passengers"),
              DropdownButtonFormField<int>(
                value: selectedPassengers,
                decoration: _underlineDecoration(icon: Icons.group),
                items:
                    List.generate(6, (index) => index + 1)
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
              const SizedBox(height: 20),

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
              const SizedBox(height: 20),

              _buildLabel("Additional Notes", required: false),
              _buildUnderlineField(
                controller: notesController,
                hint: "Optional notes",
                icon: Icons.notes,
                maxLines: 3,
                validatorText: null,
              ),

              const SizedBox(height: 30),
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
                  icon: const Icon(Icons.send, color: Colors.white),
                  label: const Text(
                    "Reserve Ride",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Ride Reserved Successfully!"),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text, {bool required = true}) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15,
          color: Colors.black87,
        ),
        children:
            required
                ? const [
                  TextSpan(
                    text: " *",
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ]
                : [],
      ),
    );
  }

  Widget _buildUnderlineField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    String? validatorText,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: _underlineDecoration(icon: icon).copyWith(hintText: hint),
      validator:
          validatorText != null
              ? (value) =>
                  value == null || value.trim().isEmpty ? validatorText : null
              : null,
    );
  }

  InputDecoration _underlineDecoration({required IconData icon}) {
    return InputDecoration(
      prefixIcon: Icon(icon, color: const Color(0xFF2563EB)),
      border: const UnderlineInputBorder(),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF2563EB), width: 2),
      ),
    );
  }
}
