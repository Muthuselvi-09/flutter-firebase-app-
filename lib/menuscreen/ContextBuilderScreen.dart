import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContextBuilderScreen extends StatefulWidget {
  const ContextBuilderScreen({super.key});

  @override
  State<ContextBuilderScreen> createState() => _ContextBuilderScreenState();
}

class _ContextBuilderScreenState extends State<ContextBuilderScreen> {
  final _formKey = GlobalKey<FormState>();

  String? contextTitle;
  String? contextDescription;
  String? category;
  String? priority;
  DateTime? targetDate;

  List<String> categories = [
    "Networking",
    "Business Talk",
    "Technology",
    "Workshop",
    "Guest Meeting",
    "Other"
  ];

  List<String> priorities = [
    "High",
    "Medium",
    "Low",
  ];

  void _pickDate() async {
    DateTime? newDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
      initialDate: DateTime.now(),
      builder: (_, child) {
        return Theme(
          data: ThemeData.dark(),
          child: child!,
        );
      },
    );

    if (newDate != null) {
      setState(() {
        targetDate = newDate;
      });
    }
  }

  void _submitContext() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Context Created Successfully 🎉"),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        title: const Text("Context Builder", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              _label("Context Title"),
              _inputField(
                hint: "Enter a title...",
                onSaved: (v) => contextTitle = v,
              ),

              _label("Description"),
              _inputField(
                hint: "Write a short description...",
                maxLines: 4,
                onSaved: (v) => contextDescription = v,
              ),

              _label("Category"),
              _dropdown(
                value: category,
                items: categories,
                hint: "Select Category",
                onChanged: (v) => setState(() => category = v),
              ),

              _label("Priority"),
              _dropdown(
                value: priority,
                items: priorities,
                hint: "Select Priority",
                onChanged: (v) => setState(() => priority = v),
              ),

              _label("Target Date"),
              GestureDetector(
                onTap: _pickDate,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    targetDate == null
                        ? "Pick a date"
                        : "${targetDate!.day}-${targetDate!.month}-${targetDate!.year}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Center(
                child: ElevatedButton(
                  onPressed: _submitContext,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Create Context",
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // ------- UI Helper Widgets --------

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 6),
      child: Text(
        text,
        style: GoogleFonts.poppins(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _inputField({
    required String hint,
    int maxLines = 1,
    required void Function(String?) onSaved,
  }) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      maxLines: maxLines,
      validator: (v) => v == null || v.isEmpty ? "This field is required" : null,
      onSaved: onSaved,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Colors.white12,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _dropdown({
    required String? value,
    required List<String> items,
    required String hint,
    required Function(String?) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(14),
      ),
      child: DropdownButtonFormField(
        value: value,
        dropdownColor: Colors.black87,
        decoration: const InputDecoration(border: InputBorder.none),
        hint: Text(hint, style: const TextStyle(color: Colors.white54)),
        items: items
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e, style: const TextStyle(color: Colors.white)),
                ))
            .toList(),
        onChanged: onChanged,
        validator: (v) => v == null ? "Please select one" : null,
      ),
    );
  }
}
