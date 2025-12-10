import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrganisationProfileScreen extends StatefulWidget {
  const OrganisationProfileScreen({super.key});

  @override
  State<OrganisationProfileScreen> createState() =>
      _OrganisationProfileScreenState();
}

class _OrganisationProfileScreenState extends State<OrganisationProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  String? orgName;
  String? industry;
  String? address;
  String? website;
  String? employeeCount;

  List<String> industryList = [
    "Technology",
    "Education",
    "Finance",
    "Healthcare",
    "Manufacturing",
    "Real Estate",
    "Others"
  ];

  List<String> empCountList = [
    "1-10",
    "11-50",
    "51-200",
    "201-500",
    "500+"
  ];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Organisation Profile Submitted Successfully! 🎉"),
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
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Organisation Profile",
            style: TextStyle(color: Colors.white)),
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

              _title("Organization Name"),
              _textField(
                hint: "Enter organization name",
                onSaved: (v) => orgName = v,
              ),

              _title("Industry Type"),
              _dropdown(
                value: industry,
                items: industryList,
                hint: "Select Industry",
                onChanged: (v) {
                  setState(() => industry = v);
                },
              ),

              _title("Address"),
              _textField(
                hint: "Enter address",
                onSaved: (v) => address = v,
              ),

              _title("Website (Optional)"),
              _textField(
                hint: "https://example.com",
                onSaved: (v) => website = v,
              ),

              _title("Number of Employees"),
              _dropdown(
                value: employeeCount,
                items: empCountList,
                hint: "Select Count",
                onChanged: (v) {
                  setState(() => employeeCount = v);
                },
              ),

              const SizedBox(height: 30),

              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Text(
                    "Submit",
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }

  // ---------- WIDGET HELPERS ----------

  Widget _title(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6, top: 14),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _textField({
    required String hint,
    required void Function(String?) onSaved,
  }) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Colors.white12,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
      validator: (value) =>
          value == null || value.isEmpty ? "This field is required" : null,
      onSaved: onSaved,
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
      child: DropdownButtonFormField<String>(
        value: value,
        dropdownColor: Colors.black,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        hint: Text(hint, style: const TextStyle(color: Colors.white54)),
        icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
        items: items
            .map((e) =>
                DropdownMenuItem(value: e, child: Text(e, style: const TextStyle(color: Colors.white))))
            .toList(),
        onChanged: onChanged,
        validator: (v) => v == null ? "Please select an option" : null,
      ),
    );
  }
}
