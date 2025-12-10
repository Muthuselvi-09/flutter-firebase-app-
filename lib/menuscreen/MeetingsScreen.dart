import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MeetingsScreen extends StatelessWidget {
  const MeetingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy meeting data (you can replace with API values)
    final List<Map<String, dynamic>> meetings = [
      {
        "title": "Business Networking Meetup",
        "time": "10:30 AM",
        "date": "12 Dec 2025",
        "floor": "Hall A - Floor 1",
        "speaker": "Mr. John Mathew",
        "topic": "Digital Transformation",
        "status": "Upcoming",
      },
      {
        "title": "AI & Future Tech Talk",
        "time": "02:00 PM",
        "date": "12 Dec 2025",
        "floor": "Conference Room 3, Floor 2",
        "speaker": "Dr. Priya Raman",
        "topic": "AI in Modern Business",
        "status": "Live",
      },
      {
        "title": "Startup Pitch Session",
        "time": "04:00 PM",
        "date": "11 Dec 2025",
        "floor": "Main Stage - Ground Floor",
        "speaker": "Panel Jury",
        "topic": "Startup Funding",
        "status": "Completed",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Meetings",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: meetings.length,
        itemBuilder: (context, index) {
          final m = meetings[index];
          return _meetingCard(
            title: m["title"],
            time: m["time"],
            date: m["date"],
            floor: m["floor"],
            speaker: m["speaker"],
            topic: m["topic"],
            status: m["status"],
          );
        },
      ),
    );
  }

  // -----------------------------------------------------------
  // 🔵 MEETING CARD WIDGET
  Widget _meetingCard({
    required String title,
    required String time,
    required String date,
    required String floor,
    required String speaker,
    required String topic,
    required String status,
  }) {
    Color statusColor =
        status == "Live" ? Colors.greenAccent :
        status == "Upcoming" ? Colors.orangeAccent :
        Colors.grey;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                status,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          const SizedBox(height: 6),

          // Title
          Text(
            title,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 10),

          _infoRow(Icons.access_time, "$time • $date"),
          _infoRow(Icons.location_on, floor),
          _infoRow(Icons.person, speaker),
          _infoRow(Icons.topic, topic),

        ],
      ),
    );
  }

  // -----------------------------------------------------------
  // 🔸 Small Row Widget
  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.white70, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
