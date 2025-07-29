import 'package:flutter/material.dart';

class PostJobScreen extends StatefulWidget {
  const PostJobScreen({super.key});

  @override
  State<PostJobScreen> createState() => _PostJobScreenState();
}

class _PostJobScreenState extends State<PostJobScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController headingController = TextEditingController();
  final TextEditingController briefController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();

  String selectedDuration = "Full-Time";
  String selectedState = "Delhi";
  bool isRecording = false;
  bool voiceNoteAttached = false;

  final List<String> durations = [
    "Full-Time",
    "Part-Time",
    "Temporary",
    "Contract",
    "One-Time",
  ];

  final List<String> states = [
    "Delhi",
    "Mumbai",
    "Bangalore",
    "Hyderabad",
    "Kolkata",
    "Chennai",
    "Goa",
    "Sikkim",
    "Punjab",
    "Rajasthan",
  ];

  void _toggleRecording() {
    setState(() {
      isRecording = !isRecording;
      if (!isRecording) voiceNoteAttached = true; // Assume recorded
    });
    // Real recording logic should be implemented here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLabel("Job Heading"),
                _buildTextField(
                  controller: headingController,
                  hint: "e.g. Need urgent driver for WagonR",
                  icon: Icons.title,
                  validatorText: "Heading is required",
                ),

                const SizedBox(height: 20),
                _buildLabel("Brief Description"),
                _buildTextField(
                  controller: briefController,
                  hint: "Describe the role, timing, etc.",
                  icon: Icons.description,
                  maxLines: 4,
                  validatorText: "Description is required",
                ),

                const SizedBox(height: 20),
                _buildLabel("Job Duration"),
                DropdownButtonFormField<String>(
                  value: selectedDuration,
                  decoration: _inputDecoration(icon: Icons.timer),
                  items:
                      durations
                          .map(
                            (d) => DropdownMenuItem(value: d, child: Text(d)),
                          )
                          .toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => selectedDuration = val);
                  },
                ),

                const SizedBox(height: 20),
                _buildLabel("Job Location (State)"),
                DropdownButtonFormField<String>(
                  value: selectedState,
                  decoration: _inputDecoration(icon: Icons.location_on),
                  items:
                      states
                          .map(
                            (s) => DropdownMenuItem(value: s, child: Text(s)),
                          )
                          .toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => selectedState = val);
                  },
                ),

                const SizedBox(height: 20),
                _buildLabel("Salary Offer (₹)"),
                _buildTextField(
                  controller: salaryController,
                  hint: "e.g. 650 per day",
                  icon: Icons.money,
                  keyboardType: TextInputType.number,
                  validatorText: "Salary is required",
                ),

                const SizedBox(height: 25),
                _buildLabel("Voice Note (Optional but preferred)"),
                InkWell(
                  onTap: _toggleRecording,
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color:
                          isRecording
                              ? Colors.red.withOpacity(0.1)
                              : const Color(0xFFE8EFFA),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isRecording ? Colors.red : Colors.blueAccent,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          isRecording
                              ? Icons.mic_off_rounded
                              : Icons.mic_rounded,
                          color: isRecording ? Colors.red : Colors.blueAccent,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          isRecording
                              ? "Recording... Tap to stop"
                              : (voiceNoteAttached
                                  ? "Voice note attached (00:32)"
                                  : "Tap to record voice note"),
                          style: TextStyle(
                            fontSize: 15,
                            color: isRecording ? Colors.red : Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
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
                    icon: const Icon(Icons.publish, color: Colors.white),
                    label: const Text(
                      "Post Job",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Post job logic
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Job Posted Successfully!"),
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
      ),
    );
  }

  Widget _buildLabel(String text) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15,
          color: Colors.black87,
        ),
        children: const [
          TextSpan(
            text: " *",
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    required String validatorText,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator:
          (value) =>
              value == null || value.trim().isEmpty ? validatorText : null,
      decoration: _inputDecoration(icon: icon).copyWith(hintText: hint),
    );
  }

  InputDecoration _inputDecoration({required IconData icon}) {
    return InputDecoration(
      prefixIcon: Icon(icon, color: const Color(0xFF2563EB)),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      // border: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(12),
      //   borderSide: const BorderSide(color: Colors.grey),
      // ),
      // enabledBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(12),
      //   borderSide: const BorderSide(color: Color(0xFFE0E3E8)),
      // ),
      // focusedBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(12),
      //   borderSide: const BorderSide(color: Color(0xFF2563EB), width: 1.5),
      // ),
    );
  }
}
