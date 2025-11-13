import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildCard({
    required String title,
    required String subtitle,
    required Color color,
    required Widget child,
  }) {
    return FadeTransition(
      opacity: _animationController,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.08),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                )),
            const SizedBox(height: 4),
            Text(subtitle,
                style: GoogleFonts.poppins(
                  color: Colors.white70,
                  fontSize: 13,
                )),
            const SizedBox(height: 12),
            child
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
            )
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.home, color: Colors.tealAccent.shade100),
            // ignore: deprecated_member_use
            Icon(Icons.people_alt_outlined, color: Colors.white.withOpacity(0.9)),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xFF64FFDA), Color(0xFF1E88E5)],
                ),
              ),
              child: const Icon(Icons.add, color: Colors.black),
            ),
            // ignore: deprecated_member_use
            Icon(Icons.event, color: Colors.white.withOpacity(0.9)),
            // ignore: deprecated_member_use
            Icon(Icons.calendar_today, color: Colors.white.withOpacity(0.9)),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Top Header Section (Logo + Title + Icons)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/codingrimlogo.jpeg', // 👈 summit logo image
                        height: 36,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 8),
                       Flexible(
            child: Text(
                        "Govindhaprabhakaran",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                       ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.confirmation_num_outlined,
                          // ignore: deprecated_member_use
                          color: Colors.white.withOpacity(0.9)),
                      const SizedBox(width: 10),
                      Icon(Icons.chat_bubble_outline,
                          // ignore: deprecated_member_use
                          color: Colors.white.withOpacity(0.9)),
                      const SizedBox(width: 10),
                      Icon(Icons.notifications_none,
                          // ignore: deprecated_member_use
                          color: Colors.white.withOpacity(0.9)),
                      const SizedBox(width: 10),
                      const Icon(Icons.menu, color: Colors.white),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // 🔸 Networking Card
              _buildCard(
                title: "Networking",
                subtitle:
                    "Your perfect match is waiting. Find your delegate connections.",
                color: const Color(0xFFFFA726),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("8 Matches Found",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                        const SizedBox(height: 8),
                        Row(
                          children: List.generate(
                            4,
                            (index) => Padding(
                              padding: const EdgeInsets.only(right: 6),
                              child: CircleAvatar(
                                radius: 16,
                                backgroundImage: AssetImage(
                                    'assets/images/person${index + 1}.jpg'),
                              ),
                            ),
                          )..add(
                              CircleAvatar(
                                radius: 16,
                                // ignore: deprecated_member_use
                                backgroundColor: Colors.white.withOpacity(0.2),
                                child: const Text("+5",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12)),
                              ),
                            ),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            // ignore: deprecated_member_use
                            backgroundColor: Colors.white.withOpacity(0.15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          child: const Text("View Matches",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: CircularProgressIndicator(
                            value: 0.99,
                            color: const Color(0xFF64FFDA),
                            backgroundColor: Colors.white24,
                            strokeWidth: 6,
                          ),
                        ),
                        const Text("99%",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                      ],
                    ),
                  ],
                ),
              ),

              // 🔹 Connections
              Row(
                children: [
                  Expanded(
                    child: _buildCard(
                      title: "My Connections",
                      subtitle: "128 connections",
                      color: Colors.tealAccent,
                      child: const SizedBox(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildCard(
                      title: "Pending",
                      subtitle: "5 requests",
                      color: Colors.blueAccent,
                      child: const SizedBox(),
                    ),
                  ),
                ],
              ),

              // 🔵 People Attending
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF64B5F6), Color(0xFF00BCD4)],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("250 People Attending",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        // ignore: deprecated_member_use
                        backgroundColor: Colors.white.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text("View All",
                          style: TextStyle(color: Colors.white)),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // 🧑‍💼 Top Profiles
              Text("Top AI Matching Profiles",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 16),

              // 🧑‍💼 Profile Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(16),
                  // ignore: deprecated_member_use
                  border: Border.all(color: Colors.tealAccent.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Thrisha Kannan",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                          Text("Founder, Scaleupz Pvt Ltd",
                              style: GoogleFonts.poppins(
                                  color: Colors.white70, fontSize: 13)),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              _tag("Startup", Colors.tealAccent),
                              const SizedBox(width: 8),
                              _tag("Tech", Colors.blueAccent),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        const Text("87%",
                            style: TextStyle(
                                color: Colors.tealAccent,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        const Text("AI Match",
                            style: TextStyle(
                                color: Colors.white70, fontSize: 12)),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(0.1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: const Text("Connect",
                              style: TextStyle(color: Colors.white)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: TextStyle(color: color, fontSize: 12)),
    );
  }
}
