import 'package:flutter/material.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _formKey = GlobalKey<FormState>();

  // Common Fields
  String? role;
  String? state;
  String? skill;
  String? jobType;
  String? preferredSkill;
  DateTime? dob;

  // Lists
  final List<String> roles = ['Worker', 'Hirer'];
  final List<String> states = ['Uttar Pradesh', 'Delhi', 'Maharashtra', 'Bihar'];
  final List<String> skills = ['Plumber', 'Electrician', 'Mason', 'Carpenter'];
  final List<String> jobTypes = ['Construction', 'Painting', 'Wiring'];
  final List<String> preferredSkills = ['Plumber', 'Electrician', 'Mason'];

  // Controllers
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

  bool agreeToPrivacy = false;

  Future<void> pickDOB() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        dob = picked;
      });
    }
  }

  Widget buildTextField(String label, TextEditingController controller, IconData icon,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        validator: (value) => value == null || value.isEmpty ? 'Please enter $label' : null,
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
    String? validSelectedValue = items.contains(selectedValue) ? selectedValue : null;

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
        backgroundColor: Color(0xFFFF8C00),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                "👋 Welcome to Shram Setu Family",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue.shade900),
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

              // Role Based Fields
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
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Registration successful!')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please complete the form properly')),
                    );
                  }
                },
                icon: const Icon(Icons.app_registration),
                label: const Text("Register"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade800,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
//
// class CreateAccountPage extends StatefulWidget {
//   @override
//   State<CreateAccountPage> createState() => _CreateAccountPageState();
// }
//
// class _CreateAccountPageState extends State<CreateAccountPage> {
//   final _formKey = GlobalKey<FormState>();
//
//   final firstNameController = TextEditingController();
//   final lastNameController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final dobController = TextEditingController();
//
//   bool isConsentGiven = false;
//   String selectedRole = 'Worker';
//
//   void _selectDate(BuildContext context) async {
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime(2005),
//       firstDate: DateTime(1960),
//       lastDate: DateTime(2025),
//     );
//     if (picked != null) {
//       setState(() {
//         dobController.text = "${picked.toLocal()}".split(' ')[0];
//       });
//     }
//   }
//
//   void handleRegister() {
//     if (_formKey.currentState!.validate() && isConsentGiven) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Registration successful!')),
//       );
//       Navigator.pushNamed(context, '/success');
//     } else if (!isConsentGiven) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please accept the terms and conditions')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.orange.shade50,
//       appBar: AppBar(
//         title: Text("Create Account"),
//         backgroundColor: Color(0xFFFF6F00),
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(20),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               Image.asset('assets/images/logo.jpg', height: 120),
//               SizedBox(height: 20),
//               Text(
//                 "Join the Shram Setu Family",
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 30),
//
//               // First Name
//               TextFormField(
//                 controller: firstNameController,
//                 decoration: _inputDecoration("First Name", Icons.person),
//                 validator: (value) => value!.isEmpty ? "Enter first name" : null,
//               ),
//               SizedBox(height: 16),
//
//               // Last Name
//               TextFormField(
//                 controller: lastNameController,
//                 decoration: _inputDecoration("Last Name", Icons.person_outline),
//                 validator: (value) => value!.isEmpty ? "Enter last name" : null,
//               ),
//               SizedBox(height: 16),
//
//               // Email
//               TextFormField(
//                 controller: emailController,
//                 decoration: _inputDecoration("Email", Icons.email),
//                 keyboardType: TextInputType.emailAddress,
//                 validator: (value) =>
//                 value!.contains('@') ? null : "Enter a valid email",
//               ),
//               SizedBox(height: 16),
//
//               // Password
//               TextFormField(
//                 controller: passwordController,
//                 obscureText: true,
//                 decoration: _inputDecoration("Password", Icons.lock),
//                 validator: (value) => value!.length < 6
//                     ? "Password must be at least 6 characters"
//                     : null,
//               ),
//               SizedBox(height: 16),
//
//               // Date of Birth
//               TextFormField(
//                 controller: dobController,
//                 readOnly: true,
//                 onTap: () => _selectDate(context),
//                 decoration: _inputDecoration("Date of Birth", Icons.cake),
//                 validator: (value) => value!.isEmpty ? "Select DOB" : null,
//               ),
//               SizedBox(height: 16),
//
//               // Dropdown
//               DropdownButtonFormField<String>(
//                 value: selectedRole,
//                 items: ['Worker', 'Hirer']
//                     .map((role) => DropdownMenuItem(
//                   child: Text(role),
//                   value: role,
//                 ))
//                     .toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     selectedRole = value!;
//                   });
//                 },
//                 decoration: _inputDecoration("Register as", Icons.work),
//               ),
//               SizedBox(height: 20),
//
//               // Consent Checkbox
//               Row(
//                 children: [
//                   Checkbox(
//                     value: isConsentGiven,
//                     onChanged: (val) {
//                       setState(() {
//                         isConsentGiven = val!;
//                       });
//                     },
//                   ),
//                   Expanded(
//                     child: Text(
//                       "I agree to the terms and conditions.",
//                       style: TextStyle(fontSize: 15),
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(height: 20),
//
//               // Register Button
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: handleRegister,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.deepOrange,
//                     padding: EdgeInsets.symmetric(vertical: 18),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     elevation: 8,
//                     shadowColor: Colors.orangeAccent,
//                   ),
//                   child: Text("Register",
//                       style:
//                       TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                 ),
//               ),
//
//               // Login Link
//               TextButton(
//                 onPressed: () => Navigator.pushNamed(context, '/login'),
//                 child: Text("Already have an account? Login"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   InputDecoration _inputDecoration(String label, IconData icon) {
//     return InputDecoration(
//       labelText: label,
//       prefixIcon: Icon(icon, color: Colors.deepOrange),
//       border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//       filled: true,
//       fillColor: Colors.white,
//     );
//   }
// }
//
//
// // import 'package:flutter/material.dart';
// //
// // class CreateAccountPage extends StatelessWidget {
// //   final nameController = TextEditingController();
// //   final emailController = TextEditingController();
// //   final passwordController = TextEditingController();
// //
// //   void handleRegister(BuildContext context) {
// //     final name = nameController.text.trim();
// //     final email = emailController.text.trim();
// //     final password = passwordController.text.trim();
// //
// //     if (name.isEmpty || email.isEmpty || password.isEmpty) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('Please fill in all fields')),
// //       );
// //     } else {
// //       // 🔁 Simulate successful registration (no backend)
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('Registration successful!')),
// //       );
// //       Navigator.pushNamed(context, '/success'); // or '/login'
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.orange.shade50,
// //       appBar: AppBar(
// //         elevation: 0,
// //         backgroundColor: Color(0xFFFF6F00),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           children: [
// //             Container(
// //               height: 150,
// //               width: 500,
// //               color: Color(0xFFFF6F00),
// //               child: Image.asset('assets/images/logo.jpg'),
// //             ),
// //             Container(
// //               width: double.infinity,
// //               height: 150,
// //               decoration: BoxDecoration(
// //                 color: Color(0xFFFF6F00),
// //                 borderRadius: BorderRadius.only(
// //                   bottomLeft: Radius.circular(50),
// //                   bottomRight: Radius.circular(50),
// //                 ),
// //               ),
// //               child: Column(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   SizedBox(height: 60),
// //                   Text(
// //                     "Create Account",
// //                     style: TextStyle(
// //                       fontSize: 30,
// //                       color: Colors.white,
// //                       fontWeight: FontWeight.bold,
// //                       letterSpacing: 1.2,
// //                     ),
// //                   ),
// //                   SizedBox(height: 10),
// //                   Text(
// //                     "Join the Shram Setu family",
// //                     style: TextStyle(
// //                       fontSize: 20,
// //                       color: Colors.white70,
// //                     ),
// //                   )
// //                 ],
// //               ),
// //             ),
// //             SizedBox(height: 40),
// //             Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 24.0),
// //               child: Column(
// //                 children: [
// //                   TextField(
// //                     controller: nameController,
// //                     decoration: InputDecoration(
// //                       labelText: 'Name',
// //                       prefixIcon: Icon(Icons.person, color: Colors.indigo),
// //                       border: OutlineInputBorder(
// //                         borderRadius: BorderRadius.circular(12),
// //                       ),
// //                       filled: true,
// //                       fillColor: Colors.white,
// //                     ),
// //                   ),
// //                   SizedBox(height: 16),
// //                   TextField(
// //                     controller: emailController,
// //                     decoration: InputDecoration(
// //                       labelText: 'Email',
// //                       prefixIcon: Icon(Icons.email, color: Colors.indigo),
// //                       border: OutlineInputBorder(
// //                         borderRadius: BorderRadius.circular(12),
// //                       ),
// //                       filled: true,
// //                       fillColor: Colors.white,
// //                     ),
// //                     keyboardType: TextInputType.emailAddress,
// //                   ),
// //                   SizedBox(height: 16),
// //                   TextField(
// //                     controller: passwordController,
// //                     obscureText: true,
// //                     obscuringCharacter: "*",
// //                     decoration: InputDecoration(
// //                       labelText: 'Password',
// //                       prefixIcon: Icon(Icons.lock, color: Colors.red),
// //                       suffixIcon: Icon(Icons.remove_red_eye),
// //                       border: OutlineInputBorder(
// //                         borderRadius: BorderRadius.circular(12),
// //                       ),
// //                       filled: true,
// //                       fillColor: Colors.white,
// //                     ),
// //                   ),
// //                   SizedBox(height: 30),
// //                   SizedBox(
// //                     width: double.infinity,
// //                     child: ElevatedButton(
// //                       onPressed: () {
// //                         handleRegister(context);
// //                       },
// //                       child: Text("Register"),
// //                       style: ElevatedButton.styleFrom(
// //                         backgroundColor: Colors.deepOrange,
// //                         padding: EdgeInsets.symmetric(vertical: 18),
// //                         textStyle: TextStyle(
// //                             fontSize: 20, fontWeight: FontWeight.bold),
// //                         shape: RoundedRectangleBorder(
// //                           borderRadius: BorderRadius.circular(30),
// //                         ),
// //                         elevation: 8,
// //                         shadowColor: Colors.orangeAccent,
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(height: 12),
// //                   TextButton(
// //                     onPressed: () {
// //                       Navigator.pushNamed(context, '/login');
// //                     },
// //                     child: Text(
// //                       "Already have an account? Login",
// //                       style: TextStyle(color: Colors.blueGrey, fontSize: 16),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
