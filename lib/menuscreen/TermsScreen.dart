import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:
            Text("Terms & Conditions", style: GoogleFonts.poppins(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Text(
            """
Welcome to the Event Management App.

By accessing this application, you agree to the following terms:

1. You must provide accurate profile information.
2. Event organizers reserve the right to modify schedules.
3. Content shared by attendees must follow community guidelines.
4. Any misuse of the platform may result in restricted access.
5. The app is not responsible for external links or third-party content.

Please read all guidelines before participating in events.
""",
            style: GoogleFonts.poppins(color: Colors.white70, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
