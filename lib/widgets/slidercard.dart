import 'package:flutter/material.dart';

class SliderCardSection extends StatefulWidget {
  const SliderCardSection({super.key});

  @override
  State<SliderCardSection> createState() => _SliderCardSectionState();
}

class _SliderCardSectionState extends State<SliderCardSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          const SizedBox(width: 16),

          // 🔵 BLUE CARD
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CeremonyDetailsScreen()),
              );
            },
            child: Container(
              width: 260,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1F3CFF), Color(0xFF0D1A8D)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Text(
                "You are requested to be seated by the inaugural ceremony...",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),

          const SizedBox(width: 16),

          // 🔴 RED CARD
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TravelGuideScreen()),
              );
            },
            child: Container(
              width: 260,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFE65050), Color(0xFFEE7368)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Text(
                "Travel Smart to TNGSS with redBus...",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),

          const SizedBox(width: 16),
        ],
      ),
    );
  }
}

//
// ----------------------- BLUE CARD SCREEN -----------------------
//

class CeremonyDetailsScreen extends StatefulWidget {
  const CeremonyDetailsScreen({super.key});

  @override
  State<CeremonyDetailsScreen> createState() => _CeremonyDetailsScreenState();
}

class _CeremonyDetailsScreenState extends State<CeremonyDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Remove this (Scaffold can't use gradient)
      // backgroundColor: Colors.blue,

      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 0,
        title: const Text("Inaugural Ceremony Details"),
      ),

      // 👉 Gradient goes inside a Container
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF3A7BD5), // Blue
              Color(0xFF3A6073), // Dark Blue/Purple mix
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: const Center(
          child: Text(
            "Full ceremony details shown here...",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}

//
// ----------------------- RED CARD SCREEN ------------------------
//

class TravelGuideScreen extends StatefulWidget {
  const TravelGuideScreen({super.key});

  @override
  State<TravelGuideScreen> createState() => _TravelGuideScreenState();
}

class _TravelGuideScreenState extends State<TravelGuideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 0,
        title: const Text("Travel Guide"),
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFF6A00), // Orange
              Color(0xFFFF006E), // Pink
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Center(
          child: Text(
            "Travel info + redBus guide displayed here...",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}

