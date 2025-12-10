import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:typed_data';

/// Only import dart:io if not Web
// ignore: uri_does_not_exist
import 'dart:io' show File;

/// Only import html if Web
// ignore: uri_does_not_exist
import 'dart:html' as html;

class CertificatePreviewScreen extends StatefulWidget {
  const CertificatePreviewScreen({super.key});

  @override
  State<CertificatePreviewScreen> createState() =>
      _CertificatePreviewScreenState();
}

class _CertificatePreviewScreenState extends State<CertificatePreviewScreen> {

  Future<void> downloadCertificate() async {
    try {
      // Load asset as bytes
      final byteData = await rootBundle.load("assets/certificate_sample.png");
      final bytes = byteData.buffer.asUint8List();

      if (kIsWeb) {
        // Web download
        final blob = html.Blob([bytes]);
        final url = html.Url.createObjectUrlFromBlob(blob);
        final anchor = html.AnchorElement(href: url)
          ..setAttribute("download", "Winner_Certificate.png")
          ..click();
        html.Url.revokeObjectUrl(url);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Certificate Downloaded Successfully!"),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        // Mobile download
        final directory = "/storage/emulated/0/Download"; // Android Download folder
        final file = await File("$directory/Winner_Certificate.png")
            .create(recursive: true);
        await file.writeAsBytes(bytes);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Certificate Downloaded Successfully!"),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      print("Download Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Download Failed ❌"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF333333),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.arrow_back, color: Colors.white),
          ),
        ),
        title: Text(
          "Winner Certificate",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              "🏆 CONGRATULATIONS!",
              style: GoogleFonts.poppins(
                color: Colors.amberAccent,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "ABI",
              style: GoogleFonts.poppins(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.w800,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 15),
            CircleAvatar(
              radius: 65,
              backgroundImage: const AssetImage("assets/winner.jpg"),
            ),
            const SizedBox(height: 20),
            Text(
              "Winner – Coding Contest 2025",
              style: GoogleFonts.poppins(
                color: Colors.white70,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "You have shown outstanding performance and creativity.\n"
                "Keep shining and achieving more!",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.white54,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              width: 340,
              height: 240,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: AssetImage("assets/images/certificate.png"),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.4),
                    blurRadius: 20,
                    spreadRadius: 2,
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: downloadCertificate,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.withOpacity(0.4),
                      blurRadius: 12,
                    )
                  ],
                ),
                child: Text(
                  "Download Certificate",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
