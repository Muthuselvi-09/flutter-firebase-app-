import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'place_detail_screen.dart';

class RajapalayamPlacesScreen extends StatefulWidget {
  const RajapalayamPlacesScreen({super.key});

  @override
  State<RajapalayamPlacesScreen> createState() => _RajapalayamPlacesScreenState();
}

class _RajapalayamPlacesScreenState extends State<RajapalayamPlacesScreen> {
  String searchText = "";

  final List<Map<String, String>> places = [
    {
      "title": "Ayyanar Falls",
      "subtitle": "Beautiful waterfall surrounded by forest.",
      "image": "https://i.ibb.co/9n9G2fZ/ayyanar-falls.jpg",
      "details": "Ayyanar Falls is a popular tourist spot with trekking and fresh streams.",
      "lat": "9.4139",
      "lng": "77.5689"
    },
    {
      "title": "Sanjeevi Hills",
      "subtitle": "Best trekking & sunset point.",
      "image": "https://i.ibb.co/8YV5Lds/sanjeevi-hills.jpg",
      "details": "Sanjeevi Hills is perfect for sunrise, sunset and peaceful walks.",
      "lat": "9.4550",
      "lng": "77.5500"
    },
    {
      "title": "Rajapalayam Dam",
      "subtitle": "Silent evening spot with cool breeze.",
      "image": "https://i.ibb.co/Vt2VqC8/rajapalayam-dam.jpg",
      "details": "A calm and relaxing place for families with scenic beauty.",
      "lat": "9.4409",
      "lng": "77.5902"
    },
    {
      "title": "Ayyanar Temple",
      "subtitle": "Famous cultural temple.",
      "image": "https://i.ibb.co/4V7q9tD/ayyanar-temple.jpg",
      "details": "A historic temple surrounded by greenery.",
      "lat": "9.4101",
      "lng": "77.5599"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = places
        .where((p) => p["title"]!.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFF6A4FE3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text("Discover Rajapalayam",
            style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              onChanged: (v) => setState(() => searchText = v),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search places...",
                hintStyle: const TextStyle(color: Colors.white70),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Colors.white24,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 20),

            ...filtered.map((place) => GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => PlaceDetailScreen(place: place))),
                  child: placeCard(place),
                )),
          ],
        ),
      ),
    );
  }
}

Widget placeCard(Map<String, String> place) {
  return Container(
    margin: const EdgeInsets.only(bottom: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(18),
      border: Border.all(color: Colors.white30),
      gradient: LinearGradient(
        colors: [
          Colors.white.withOpacity(0.18),
          Colors.white.withOpacity(0.08),
        ],
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
          ),
          child: Image.network(
            place["image"]!,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(place["title"]!,
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700)),
              const SizedBox(height: 6),
              Text(place["subtitle"]!,
                  style: GoogleFonts.poppins(color: Colors.white70, fontSize: 14)),
            ],
          ),
        ),
      ],
    ),
  );
}
