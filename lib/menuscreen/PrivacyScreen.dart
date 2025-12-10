import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:
            Text("Privacy Policy", style: GoogleFonts.poppins(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Text(
            """
Your privacy is important to us.

• We collect only essential user information for event participation.  
• Your data will not be sold or shared with unauthorized parties.  
• All personal information is stored securely.  
• You can request deletion of your data at any time.  
• Location and camera access is used only when required by event features.

By using this app, you consent to our privacy practices.
""",
            style: GoogleFonts.poppins(color: Colors.white70, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
