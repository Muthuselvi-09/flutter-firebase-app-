import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AttendeesScreen extends StatefulWidget {
  const AttendeesScreen({super.key});

  @override
  State<AttendeesScreen> createState() => _AttendeesScreenState();
}

class _AttendeesScreenState extends State<AttendeesScreen> {
  // 👉 Later, replace this with Firebase data
  List<Map<String, dynamic>> attendees = [
    {
      "name": "Ravi Kumar",
      "role": "Software Engineer",
      "image": null
    },
    {
      "name": "Priya Sharma",
      "role": "Product Manager",
      "image": null
    },
    {
      "name": "Abdul Rahman",
      "role": "UI/UX Designer",
      "image": null
    },
    {
      "name": "Krishnan",
      "role": "Developer",
      "image": null
    },
    {
      "name": "Sangeetha",
      "role": "Data Analyst",
      "image": null
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Attendees", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          // TOTAL COUNT
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Total Attendees: ${attendees.length}",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // ATTENDEE LIST
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: attendees.length,
              itemBuilder: (_, index) {
                final person = attendees[index];
                return _attendeeTile(
                  person["name"],
                  person["role"],
                  person["image"],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  // UI Design for Single Attendee
  Widget _attendeeTile(String name, String role, String? image) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(14),
      ),

      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white24,
            backgroundImage: image != null ? AssetImage(image) : null,
            child: image == null
                ? const Icon(Icons.person, color: Colors.white, size: 30)
                : null,
          ),

          const SizedBox(width: 14),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                role,
                style: GoogleFonts.poppins(
                  color: Colors.white70,
                  fontSize: 13,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
