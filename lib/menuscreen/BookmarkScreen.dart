import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> bookmarks = [
      {
        "title": "AI Conference 2025",
        "time": "10:00 AM",
        "venue": "Hall A",
      },
      {
        "title": "Startup Pitch Event",
        "time": "2:00 PM",
        "venue": "Main Stage",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Event Bookmarks",
            style: GoogleFonts.poppins(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: bookmarks.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final b = bookmarks[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(b["title"]!,
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 16, color: Colors.white70),
                    const SizedBox(width: 8),
                    Text(b["time"]!,
                        style: GoogleFonts.poppins(color: Colors.white70)),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.location_on,
                        size: 16, color: Colors.white70),
                    const SizedBox(width: 8),
                    Text(b["venue"]!,
                        style: GoogleFonts.poppins(color: Colors.white70)),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
