import 'package:flutter/material.dart';

class AddWorkerProfilePage extends StatefulWidget {
  @override
  _WorkerProfilePageState createState() => _WorkerProfilePageState();
}

class _WorkerProfilePageState extends State<AddWorkerProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _professionController = TextEditingController();
  final _feesController = TextEditingController();
  final _locationController = TextEditingController();
  final _experienceController = TextEditingController();

  bool _available = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Worker Profile"),
        centerTitle: true,
        backgroundColor: Color(0xFFFF6F00),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField("Full Name", _nameController),
              _buildTextField("Profession (e.g., Electrician)", _professionController),
              _buildTextField("Fees (in ₹)", _feesController, TextInputType.number),
              _buildTextField("Location", _locationController),
              _buildTextField("Experience (in years)", _experienceController, TextInputType.number),
              const SizedBox(height: 12),
              SwitchListTile(
                title: const Text("Available for work?"),
                value: _available,
                onChanged: (val) => setState(() => _available = val),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFF6F00)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle form submission here (e.g., send data to server)
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Profile submitted successfully!")),
                    );
                  }
                },
                child: const Text("Submit Profile",style: TextStyle(color: Colors.white,fontSize: 20),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      [TextInputType keyboardType = TextInputType.text]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: (value) => value == null || value.isEmpty ? 'Enter $label' : null,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _professionController.dispose();
    _feesController.dispose();
    _locationController.dispose();
    _experienceController.dispose();
    super.dispose();
  }
}
