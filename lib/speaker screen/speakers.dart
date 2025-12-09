import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'speaker_details.dart';

class SpeakersScreen extends StatelessWidget {
  const SpeakersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> speakers = [
      {
        "name": "A T M Iqbal Chowdhury",
        "title": "CEO, Umbrella PMC",
        "desc":
            "A T M Iqbal Chowdhury is an experienced leader bringing strong expertise...",
        "image": "assets/images/sir.png",
        "tag": "International",
        "multiple": false,
      },
      {
        "name": "Abdul Hakim",
        "title": "Founder, Startup Hub",
        "desc":
            "Abdul Hakim is a leading entrepreneur contributing to innovation...",
        "image": "assets/images/abi.png",
        "tag": "Main Event",
        "multiple": true,
      },
      // You can add 3 more speakers here!
    ];

    return Scaffold(
      backgroundColor: const Color(0xff0B0E19),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "All Speakers",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: speakers.length,
        itemBuilder: (context, index) {
          final sp = speakers[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SpeakerDetailsScreen(
                    name: sp["name"],
                    title: sp["title"],
                    description: sp["desc"],
                    image: sp["image"],
                    tag: sp["tag"],
                    isMultipleEvent: sp["multiple"],
                    countryFlag: sp["countryFlag"],
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 18),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xff151A28),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      sp["image"],
                      height: 70,
                      width: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sp["name"],
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          sp["title"],
                          style: GoogleFonts.poppins(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            sp["tag"],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
