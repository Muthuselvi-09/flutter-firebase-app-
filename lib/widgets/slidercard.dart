import 'dart:async';
import 'package:flutter/material.dart';
import 'package:event_management2/Certificate Preview Screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SliderCardSection extends StatefulWidget {
  const SliderCardSection({super.key});

  @override
  State<SliderCardSection> createState() => _SliderCardSectionState();
}

class _SliderCardSectionState extends State<SliderCardSection> {
  final PageController _pageController = PageController(viewportFraction: 0.75);
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    // Auto-slide timer
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: PageView(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        children: [
          _blueCard(),
          _redCard(),
          _winnerCard(),
        ],
      ),
    );
  }

  // ------------------------ BLUE CARD ------------------------
  Widget _blueCard() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const CeremonyDetailsScreen()),
        );
      },
      child: Container(
        width: 200,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: const LinearGradient(
            colors: [Color(0xFF2C3EFA), Color(0xFF1A1E9A)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Text(
          "You are requested to be seated by the inaugural ceremony...",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }

  // ------------------------ RED CARD ------------------------
  Widget _redCard() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const TravelGuideScreen()),
        );
      },
      child: Container(
        width: 200,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: const LinearGradient(
            colors: [Color(0xFFE65050), Color(0xFFEE7368)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Text(
          "Travel Smart to TNGSS with redBus…",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }

  // ------------------------ WINNER CARD ------------------------
  Widget _winnerCard() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const CertificatePreviewScreen()),
        );
      },
      child: Container(
        width: 200,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          image: const DecorationImage(
            image: AssetImage("assets/images/card3banner.png"),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
      ),
        
      );
    
  }
}

// ------------------------ BLUE CARD SCREEN ------------------------
class CeremonyDetailsScreen extends StatefulWidget {
  const CeremonyDetailsScreen({super.key});

  @override
  State<CeremonyDetailsScreen> createState() => _CeremonyDetailsScreenState();
}

class _CeremonyDetailsScreenState extends State<CeremonyDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 0,
        title: const Text("Inaugural Ceremony Details"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3A7BD5), Color(0xFF3A6073)],
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

// ------------------------ RED CARD SCREEN ------------------------
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
            colors: [Color(0xFFFF6A00), Color(0xFFFF006E)],
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
