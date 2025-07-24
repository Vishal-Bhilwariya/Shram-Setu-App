import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'login_page.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _formKey = GlobalKey<FormState>();

  String? role, state, skill, jobType, preferredSkill;
  DateTime? dob;
  bool agreeToPrivacy = false;

  final roles = ['Worker', 'Hirer'];
  final states = ['Uttar Pradesh', 'Delhi', 'Maharashtra', 'Bihar'];
  final skills = ['Plumber', 'Electrician', 'Mason', 'Carpenter'];
  final jobTypes = ['Construction', 'Painting', 'Wiring'];
  final preferredSkills = ['Plumber', 'Electrician', 'Mason'];

  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final confirmPasswordCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final cityCtrl = TextEditingController();
  final pincodeCtrl = TextEditingController();
  final experienceCtrl = TextEditingController();
  final salaryCtrl = TextEditingController();
  final companyNameCtrl = TextEditingController();
  final workLocationCtrl = TextEditingController();

  Future<void> pickDOB() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() => dob = picked);
    }
  }

  Future<void> registerUser() async {
    final url = Uri.parse('http://10.0.2.2:3000/register'); // 10.0.2.2 for Android Emulator

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "role": role,
        "firstName": firstNameCtrl.text.trim(),
        "lastName": lastNameCtrl.text.trim(),
        "email": emailCtrl.text.trim(),
        "phone": phoneCtrl.text.trim(),
        "password": passwordCtrl.text.trim(),
        "dob": dob?.toIso8601String() ?? "",
        "address": addressCtrl.text.trim(),
        "city": cityCtrl.text.trim(),
        "state": state,
        "pincode": pincodeCtrl.text.trim(),
        "experience": role == "Worker" ? experienceCtrl.text.trim() : "",
        "skill": role == "Worker" ? skill : "",
        "salary": role == "Worker" ? salaryCtrl.text.trim() : "",
        "companyName": role == "Hirer" ? companyNameCtrl.text.trim() : "",
        "workLocation": role == "Hirer" ? workLocationCtrl.text.trim() : "",
        "jobType": role == "Hirer" ? jobType : "",
        "preferredSkill": role == "Hirer" ? preferredSkill : ""
      }),
    );

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registration successful!')),
      );
      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  LoginPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed: ${response.body}')),
      );
    }
  }

  Widget buildTextField(String label, TextEditingController ctrl, IconData icon,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: TextFormField(
        controller: ctrl,
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        validator: (value) =>
        value == null || value.isEmpty ? 'Please enter $label' : null,
      ),
    );
  }

  Widget buildDropdownField(
      String label,
      List<String> items,
      String? selectedValue,
      IconData icon,
      Function(String?) onChanged,
      ) {
    String? validSelectedValue =
    items.contains(selectedValue) ? selectedValue : null;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: DropdownButtonFormField<String>(
        value: validSelectedValue,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        items: items
            .map((e) => DropdownMenuItem<String>(
          value: e,
          child: Text(e),
        ))
            .toList(),
        validator: (value) => value == null ? 'Please select $label' : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text("        Create an account"),
        backgroundColor: const Color(0xFFFF8C00),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Scrollbar(
            thumbVisibility: true,
            thickness: 6,
            radius: const Radius.circular(8),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "👋 Welcome to Shram Setu Family",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade900),
                        ),
                        const SizedBox(height: 20),

                        buildTextField("First Name", firstNameCtrl, Icons.person),
                        buildTextField("Last Name", lastNameCtrl, Icons.person_outline),
                        buildTextField("Email", emailCtrl, Icons.email),
                        buildTextField("Phone Number", phoneCtrl, Icons.phone),
                        buildTextField("Password", passwordCtrl, Icons.lock, isPassword: true),
                        buildTextField("Confirm Password", confirmPasswordCtrl, Icons.lock_outline, isPassword: true),

                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(Icons.cake),
                            const SizedBox(width: 10),
                            Text(dob == null ? "Select Date of Birth" : "DOB: ${dob!.toLocal()}".split(' ')[0]),
                            const Spacer(),
                            ElevatedButton(
                              onPressed: pickDOB,
                              child: const Text("Pick Date"),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

                        buildTextField("Current Address", addressCtrl, Icons.home),
                        buildTextField("City", cityCtrl, Icons.location_city),
                        buildDropdownField("State", states, state, Icons.map, (val) => setState(() => state = val)),
                        buildTextField("Pincode / ZIP Code", pincodeCtrl, Icons.pin_drop),
                        buildDropdownField("Role", roles, role, Icons.work, (val) => setState(() => role = val)),

                        if (role == 'Worker') ...[
                          buildDropdownField("Skill / Job Type", skills, skill, Icons.handyman, (val) => setState(() => skill = val)),
                          buildTextField("Years of Experience", experienceCtrl, Icons.timeline),
                          buildTextField("Daily Wage / Salary Expectation", salaryCtrl, Icons.attach_money),
                        ],

                        if (role == 'Hirer') ...[
                          buildTextField("Company Name (optional)", companyNameCtrl, Icons.business),
                          buildTextField("Work Location / Site Address", workLocationCtrl, Icons.place),
                          buildDropdownField("Job Type Hiring For", jobTypes, jobType, Icons.work_outline, (val) => setState(() => jobType = val)),
                          buildDropdownField("Preferred Worker Skills", preferredSkills, preferredSkill, Icons.filter_alt, (val) => setState(() => preferredSkill = val)),
                        ],

                        CheckboxListTile(
                          value: agreeToPrivacy,
                          onChanged: (val) => setState(() => agreeToPrivacy = val ?? false),
                          title: const Text("I agree to the Privacy Policy"),
                        ),
                        const SizedBox(height: 10),

                        ElevatedButton.icon(
                          onPressed: () {
                            if (_formKey.currentState!.validate() && agreeToPrivacy) {
                              registerUser(); // Now calls your backend
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Please complete the form properly')),
                              );
                            }
                          },
                          icon: const Icon(Icons.app_registration),
                          label: const Text("Register"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF8C00),
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            textStyle: const TextStyle(fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
