import 'package:flutter/material.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  String gender = "Male";
  String education = "Undergraduate";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // DARK BACKGROUND
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [

              // Full Name
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: "Full Name",
                  labelStyle: TextStyle(color: Colors.white70),
                  hintText: "Enter your name",
                  hintStyle: TextStyle(color: Colors.white54),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) return "Enter your name";
                  return null;
                },
              ),
              const SizedBox(height: 15),

              // Email
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.white70),
                  hintText: "Enter your email",
                  hintStyle: TextStyle(color: Colors.white54),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) return "Enter email";
                  return null;
                },
              ),
              const SizedBox(height: 15),

              // Mobile Number
              TextFormField(
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: "Mobile Number",
                  labelStyle: TextStyle(color: Colors.white70),
                  hintText: "Enter your mobile number",
                  hintStyle: TextStyle(color: Colors.white54),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) return "Enter your mobile";
                  return null;
                },
              ),
              const SizedBox(height: 15),

              // Date of Birth
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: "Date of Birth",
                  labelStyle: TextStyle(color: Colors.white70),
                  hintText: "DD/MM/YYYY",
                  hintStyle: TextStyle(color: Colors.white54),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) return "Enter DOB";
                  return null;
                },
              ),
              const SizedBox(height: 15),

              // Gender Dropdown
              DropdownButtonFormField(
                dropdownColor: Colors.black,
                decoration: const InputDecoration(
                  labelText: "Gender",
                  labelStyle: TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(color: Colors.white),
                value: gender,
                items: ["Male", "Female", "Other"]
                    .map((g) => DropdownMenuItem(
                          value: g,
                          child: Text(g, style: const TextStyle(color: Colors.white)),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => gender = value!),
              ),
              const SizedBox(height: 15),

              // Education Dropdown
              DropdownButtonFormField(
                dropdownColor: Colors.black,
                decoration: const InputDecoration(
                  labelText: "Education",
                  labelStyle: TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(color: Colors.white),
                value: education,
                items: [
                  "Undergraduate",
                  "Postgraduate",
                  "Diploma",
                  "PhD",
                  "Other"
                ]
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e, style: const TextStyle(color: Colors.white)),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => education = value!),
              ),
              const SizedBox(height: 25),

              // Submit Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Your profile has been submitted successfully!"),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                },
                child: const Text(
                  "Submit",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
