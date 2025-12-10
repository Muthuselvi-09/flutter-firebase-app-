import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  final List<Map<String, String>> faqs = [
    {
      "question": "How to register for the event?",
      "answer":
          "You can register through the main event app by going to the Registration tab. Fill your details and submit."
    },
    {
      "question": "Can I update my profile later?",
      "answer":
          "Yes, you can update your profile anytime from the Menu > My Profile section."
    },
    {
      "question": "How to download my ticket?",
      "answer":
          "Go to Menu > My Ticket. You can view and download your event ticket."
    },
    {
      "question": "How do I connect with attendees?",
      "answer":
          "Go to Networking or Attendees page and send a connection request."
    },
    {
      "question": "Will I get a participation certificate?",
      "answer":
          "Yes, after event completion, certificates will be available in the Winner Announcement or Certificates section."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("FAQs", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: faqs.length,
        itemBuilder: (_, index) {
          return _faqTile(faqs[index]["question"]!, faqs[index]["answer"]!);
        },
      ),
    );
  }

  Widget _faqTile(String question, String answer) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(14),
      ),
      child: ExpansionTile(
        iconColor: Colors.white,
        collapsedIconColor: Colors.white38,
        title: Text(
          question,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(14),
            child: Text(
              answer,
              style: GoogleFonts.poppins(color: Colors.white70, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
