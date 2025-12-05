import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanPassScreen extends StatefulWidget {
  const ScanPassScreen({super.key});

  @override
  State<ScanPassScreen> createState() => _ScanPassScreenState();
}

class _ScanPassScreenState extends State<ScanPassScreen> {
  bool showScanFrame = false;

  String scannedValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(  // <<< Overflow fix
        child: Stack(
          children: [
            // Full screen scanner
            Positioned.fill(
              child: MobileScanner(
                onDetect: (capture) {
                  final List<Barcode> barcodes = capture.barcodes;
                  if (barcodes.isNotEmpty) {
                    setState(() {
                      scannedValue = barcodes.first.rawValue ?? "";
                    });
                  }
                },
              ),
            ),

            // Top icons
           Positioned(
  top: 10,
  left: 20,
  right: 20,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [

      /// <<< CLOSE BUTTON → GO BACK
      GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.close,
          color: Colors.white,
          size: 30,
        ),
      ),

      Row(
  children: [
    // FLASH BUTTON
    GestureDetector(
      onTap: () {
        // TODO: flash toggle
        print("FLASH CLICKED");
      },
      child: const Icon(Icons.flash_on, color: Colors.white, size: 30),
    ),
    const SizedBox(width: 16),

    // SCAN MODE BUTTON
GestureDetector(
  onTap: () {
    setState(() {
      showScanFrame = !showScanFrame;   // show / hide scan frame
    });
  },
  child: const Icon(Icons.qr_code_scanner, color: Colors.white, size: 30),
),


    // MORE MENU BUTTON
    GestureDetector(
      onTap: () {
        print("MORE CLICKED");
      },
      child: const Icon(Icons.more_vert, color: Colors.white, size: 30),
    ),
  ],
),
    ]
  )
           ),
           // SCAN FRAME OVERLAY (Only visible when icon pressed)
if (showScanFrame)
  Center(
    child: Container(
      width: 240,
      height: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.9),
          width: 3,
        ),
      ),
      child: Stack(
        children: [
          // Moving laser line
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                margin: const EdgeInsets.only(top: 5),
                height: 3,
                width: 200,
                color: Colors.redAccent,
              ),
            ),
          ),
        ],
      ),
    ),
  ),

    
  


            // Upload from gallery button
            Positioned(
              bottom: 180, // <<< Adjusted (overflow fix)
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        "Upload from gallery",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.image, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom panel
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 150, // <<< Reduced height (Stops overflow)
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
                ),
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Scan any QR code",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "scan any QR to get your information",
                      style: TextStyle(color: Colors.white54, fontSize: 14),
                    ),
                    SizedBox(height: 10),
                    Icon(Icons.qr_code_2, color: Colors.white, size: 44),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
