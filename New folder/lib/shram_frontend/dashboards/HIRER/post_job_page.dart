import 'package:flutter/material.dart';

class PostJobPage extends StatefulWidget {
  @override
  _PostJobPageState createState() => _PostJobPageState();
}

class _PostJobPageState extends State<PostJobPage> {
  final _formKey = GlobalKey<FormState>();
  String jobTitle = '';
  String location = '';
  String wages = '';
  String duration = '';
  String jobDescription = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post a Job"),
        backgroundColor: Color(0xFFFF6F00),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField("Job Title", Icons.work, (value) => jobTitle = value!),
              SizedBox(height: 12),
              _buildTextField("Location", Icons.location_on, (value) => location = value!),
              SizedBox(height: 12),
              _buildTextField("Wages (e.g. ₹600/day)", Icons.money, (value) => wages = value!),
              SizedBox(height: 12),
              _buildTextField("Duration (e.g. 2 days)", Icons.timer, (value) => duration = value!),
              SizedBox(height: 12),
              _buildTextField("Job Description", Icons.description, (value) => jobDescription = value!,
                  maxLines: 4),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // You can handle posting logic here or navigate
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Job posted successfully!")),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFF6F00),
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text(
                    "Post Job",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon, FormFieldSetter<String> onSaved,
      {int maxLines = 1}) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (value) => value == null || value.isEmpty ? "Please enter $label" : null,
      onSaved: onSaved,
    );
  }
}
