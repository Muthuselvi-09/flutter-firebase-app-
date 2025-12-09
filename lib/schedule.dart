import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int selectedDate = 1;

  final List<Map<String, dynamic>> dates = [
    {"day": "19", "label": "Mon"},
    {"day": "20", "label": "Tue"},
    {"day": "21", "label": "Wed"},
    {"day": "22", "label": "Thu"},
    {"day": "23", "label": "Fri"},
    {"day": "24", "label": "Sat"},
  ];

  final List<Map<String, dynamic>> events = [
    {
      "title": "Football Match",
      "time": "8 PM",
      "date": "Sept 10, 2024",
      "location": "Camp Nou, Barcelona",
      "color": Color(0xFFEFE9E4)
    },
    {
      "title": "Basketball Game",
      "time": "7:30 PM",
      "date": "Sept 12, 2024",
      "location": "Staples Center, Los Angeles",
      "color": Color(0xFFE4EEF8)
    },
    {
      "title": "Tennis Match",
      "time": "2 PM",
      "date": "Sept 15, 2024",
      "location": "Arthur Ashe Stadium, New York",
      "color": Color(0xFFF6E9D5)
    },
    {
      "title": "American Football Game",
      "time": "8 PM",
      "date": "Sept 18, 2024",
      "location": "Gillette Stadium, Foxborough",
      "color": Color(0xFFEED7E9)
    },
    {
      "title": "Baseball Game",
      "time": "4:30 PM",
      "date": "Sept 20, 2024",
      "location": "Yankee Stadium, New York",
      "color": Color(0xFFF7D5D5)
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FC),
       // ------------------ APPBAR (BACK ARROW) ---------------------
  appBar: AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.black),
      onPressed: () => Navigator.pop(context),
    ),
    title: Text(
      "Schedule Meeting",
      style: GoogleFonts.poppins(
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
    ),
    centerTitle: true,
  ),

      // ------------------ BODY ---------------------
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ------------------------------ DATE HEADER ------------------------------
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "20-August-2024",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            // ------------------------------ DATE SELECTOR ----------------------------
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: dates.length,
                itemBuilder: (context, index) {
                  bool isSelected = index == selectedDate;

                  return GestureDetector(
                    onTap: () {
                      setState(() => selectedDate = index);
                    },
                    child: Container(
                      width: 55,
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue : Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            blurRadius: 10,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            dates[index]["day"],
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                          Text(
                            dates[index]["label"],
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: isSelected ? Colors.white70 : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            // ------------------------------ EVENT LIST -------------------------------
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: events.length,
                itemBuilder: (context, index) {
                  var event = events[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 18),
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: event["color"],
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // ---------------- LEFT ----------------
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              event["title"],
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.calendar_today, size: 13),
                                const SizedBox(width: 5),
                                Text(
                                  "Date : ${event["date"]}",
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.location_pin, size: 13),
                                const SizedBox(width: 5),
                                Text(
                                  event["location"],
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "View More",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),

                        // ---------------- RIGHT ----------------
                        Text(
                          event["time"],
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
