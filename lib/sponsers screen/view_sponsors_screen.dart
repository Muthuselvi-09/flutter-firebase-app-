import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewSponsorsScreen extends StatelessWidget {
  const ViewSponsorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B0E19),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "Our Sponsors",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "Powering TNGSS with their support",
              style: GoogleFonts.poppins(
                color: Colors.white70,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                children: [

                  sponsorTile("Google", "assets/sponsors/google.png"),
                  sponsorTile("Tata Consultancy", "assets/sponsors/tata.png"),
                  sponsorTile("Microsoft", "assets/sponsors/microsoft.png"),
                  sponsorTile("Zoho Corporation", "assets/sponsors/zoho.png"),
                  sponsorTile("HCL Technologies", "assets/sponsors/hcl.png"),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget sponsorTile(String name, String logo) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xff151A28),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(logo),
          ),

          const SizedBox(width: 18),

          Text(
            name,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
