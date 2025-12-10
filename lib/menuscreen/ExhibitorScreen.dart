import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExhibitorScreen extends StatelessWidget {
  const ExhibitorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final exhibitors = [
      {
        "name": "Tech Innovators Pvt Ltd",
        "booth": "B12",
        "category": "AI & Robotics",
      },
      {
        "name": "Green Energy Solutions",
        "booth": "C7",
        "category": "Renewable Energy",
      },
      {
        "name": "Future Mobility Co.",
        "booth": "A3",
        "category": "Automobile Tech",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Exhibitors",
            style: GoogleFonts.poppins(color: Colors.white)),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: exhibitors.length,
        itemBuilder: (context, index) {
          final e = exhibitors[index];
          return Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(e["name"]!,
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                _row(Icons.storefront, "Booth: ${e["booth"]}"),
                _row(Icons.category, e["category"]!),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _row(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.white70),
          const SizedBox(width: 8),
          Text(text,
              style: GoogleFonts.poppins(color: Colors.white70, fontSize: 14)),
        ],
      ),
    );
  }
}
