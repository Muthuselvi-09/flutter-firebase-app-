import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:event_management2/headers.dart';
import 'package:event_management2/footers.dart';
import 'package:event_management2/widgets/slidercard.dart'; 
import 'package:event_management2/profile.dart';
import 'package:event_management2/pass.dart';
import 'package:event_management2/featuredevent.dart';
//import '../widgets/slidercard.dart'; 


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double profileScore = 0.0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
 

floatingActionButton: footerCenterButton(context),
floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


bottomNavigationBar: footerNavigationBar(context),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF6A5AE0),
              Color(0xFFE15ABD),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // ---------- TOP BAR (Logo + Right Icons) ----------
Padding(
  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      // LEFT SIDE LOGO (from your screenshot)
      Image.asset(
        "assets/images/codingrimlogo-.png",   // <-- change your file path here
        height: 38,
      ),

     // RIGHT SIDE ICONS
Row(
  children: [
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const TicketScreen()),
        );
      },
      child:  Icon(
        Icons.confirmation_number_outlined,
        color: Colors.white,
        size: 28,
      ),
    ),

    SizedBox(width: 16),

    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ChatScreen()),
        );
      },
      child:  Icon(
        Icons.chat_bubble_outline,
        color: Colors.white,
        size: 28,
      ),
    ),

    SizedBox(width: 16),

    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const NotificationScreen()),
        );
      },
      child:  Icon(
        Icons.notifications_none,
        color: Colors.white,
        size: 28,
      ),
    ),

    SizedBox(width: 16),

    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const MenuScreen()),
        );
      },
      child: Icon(
        Icons.menu,
        color: Colors.white,
        size: 28,
      ),
    ),
  ],
),

    ],
  ),
),

const SizedBox(height: 20),


                // ---------- 2. USER NAME ----------
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Govindaprabhakaran",
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),

                // ---------- SUBTITLE ----------
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Let's manage some things",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white70,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // ---------- 3. HORIZONTAL SCROLL CARDS ----------
               Column(
          children: [
                    const SizedBox(height: 20),

                  // 🔵 Replace old cards with new slider file
                    SliderCardSection(),

                   const SizedBox(height: 20),
                   ],
         ),


                // ---------- 4. COMPLETE PROFILE ----------
              



                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        // LEFT TEXT
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Complete Your Profile",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                           const SizedBox(height: 6),
SizedBox(
  width: 180,
  child: Text(
    profileScore < 1.0
        ? "Your Profile is incomplete. Please update it for better networking!!"
        : "Thank you for completing your profile!",
    style: GoogleFonts.poppins(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: Colors.white70,
    ),
  ),
),
const SizedBox(height: 12),


                            // COMPLETE BUTTON



                            GestureDetector(
                       onTap: () async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const CompleteProfileScreen()),
  );

  if (result == true) {
    setState(() {
      profileScore = 1.0; // 100%
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Your profile is complete!"),
        backgroundColor: Colors.green,
      ),
    );
  }
},

                              child: Container(
                      
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                gradient: const LinearGradient(
                                  colors: [Color(0xFFFFA726), Color(0xFF64FFDA)],
                                ),
                              ),
                              child: Text(
                                "Complete Profile",
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            ),
                          ],
                        ),

                        // RIGHT PROFILE SCORE
                        Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  height: 70,
                                  width: 70,
                                  child: CircularProgressIndicator(
  value: profileScore, // dynamic value
  strokeWidth: 8,
  backgroundColor: Colors.white24,
  valueColor: const AlwaysStoppedAnimation(Color(0xFF4CAF50)),
),

                                ),
                                Text(
  "${(profileScore * 100).toInt()}", // shows 0 to 100
  style: GoogleFonts.poppins(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  ),
),

                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Profile Score",
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

             // ---------- 5. VIEW MY PASS ----------
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ScanPassScreen()),
      );
    },
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          colors: [Color(0xFF6BC9FF), Color(0xFF4A6BFF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "View My Pass",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Use the QR ticket to enter the venue",
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: Colors.white70,
                ),
              ),
            ],
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              "View",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    ),
  ),
),

const SizedBox(height: 30),

                // ------------------------------------------------------------
                // ----------------------- 6. EVENTS ---------------------------
                // ------------------------------------------------------------
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Events",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                   GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EventScreen(),
      ),
    );
  },
  child: Row(
    children: [
      Text(
        "View All",
        style: GoogleFonts.poppins(
          color: Colors.white70,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      const SizedBox(width: 6),
      const Icon(Icons.arrow_forward, color: Colors.white70, size: 18),
    ],
  ),
),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                SizedBox(
                  height: 240,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      const SizedBox(width: 20),
                      _eventCard(),
                      const SizedBox(width: 15),
                      _eventCard(),
                      const SizedBox(width: 20),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                // ------------------------------------------------------------
                // ------------------ 7. FEATURED EVENTS -----------------------
                // ------------------------------------------------------------
                
         
                
                
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Featured Events",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      const SizedBox(width: 20),
                      _featuredEventCard(),
                      const SizedBox(width: 15),
                      _featuredEventCard(),
                      const SizedBox(width: 20),
                    ],
                  ),
                ),

                const SizedBox(height: 35),
                // ------------------------------------------------------------
// ------------------ 8. SCHEDULE MEETING ---------------------
// ------------------------------------------------------------
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "Schedule Meeting",
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      Row(
        children: [
          Text(
            "View All",
            style: GoogleFonts.poppins(
              color: Colors.white70,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 6),
          const Icon(Icons.arrow_forward, color: Colors.white70, size: 18),
        ],
      )
    ],
  ),
),

const SizedBox(height: 15),

Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Container(
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(22),
      color: Colors.white.withOpacity(0.1),
    ),
    padding: const EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Schedule Meeting",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          "At TNGSS 2025, The right connections don’t happen by chance, you can schedule a meet!",
          style: GoogleFonts.poppins(
            color: Colors.white70,
            fontSize: 13,
          ),
        ),

        const SizedBox(height: 20),

        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              "Schedule a meeting",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    ),
  ),
),

const SizedBox(height: 35),
// ------------------------------------------------------------
// ------------------- NETWORKING ZONE ------------------------
// ------------------------------------------------------------

Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "Networking Zone",
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      Row(
        children: [
          Text(
            "View",
            style: GoogleFonts.poppins(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 5),
          const Icon(Icons.arrow_forward_ios,
              size: 14, color: Colors.white70),
        ],
      )
    ],
  ),
),

const SizedBox(height: 15),

// ------------------ AI MATCHMAKING CARD -------------------

Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Container(
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      gradient: const LinearGradient(
        colors: [
          Color(0xFFCA7B2B),
          Color(0xFF462004),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    padding: const EdgeInsets.all(20),
    child: Row(
      children: [
        // LEFT SIDE
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "AI Matchmaking",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                "Your perfect match is waiting for you !!!",
                style: GoogleFonts.poppins(
                  color: Colors.white70,
                  fontSize: 13,
                ),
              ),

              const SizedBox(height: 15),

              // PROFILE IMAGES + COUNT
              Row(
                children: [
                  // Image 1
                  CircleAvatar(
                    radius: 14,
                    backgroundImage: AssetImage("assets/profile1.png"),
                  ),
                  const SizedBox(width: 4),

                  CircleAvatar(
                    radius: 14,
                    backgroundImage: AssetImage("assets/profile2.png"),
                  ),
                  const SizedBox(width: 4),

                  CircleAvatar(
                    radius: 14,
                    backgroundImage: AssetImage("assets/profile3.png"),
                  ),
                  const SizedBox(width: 6),

                  // +5 Circle
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "+5",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              Text(
                "Complete your Profile for better AI Match Score",
                style: GoogleFonts.poppins(
                  color: Colors.white70,
                  fontSize: 11,
                ),
              ),

              const SizedBox(height: 15),

              // Button
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF00E0FF),
                      Color(0xFF0078FF),
                    ],
                  ),
                ),
                child: Text(
                  "Complete Profile",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),

        // RIGHT SIDE — CIRCULAR SCORE
        Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(
                    value: 0.15,
                    strokeWidth: 7,
                    backgroundColor: Colors.white24,
                    valueColor: const AlwaysStoppedAnimation(Color(0xFF00E676)),
                  ),
                ),
                Text(
                  "15",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              "Profile\nAlignment Score",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.white70,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ],
    ),
  ),
),

const SizedBox(height: 30),
// ------------------------------------------------------------
// ----------------------- SPEAKERS ---------------------------
// ------------------------------------------------------------
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "Speakers",
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      Row(
        children: [
          Text(
            "View All",
            style: GoogleFonts.poppins(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 5),
          const Icon(Icons.arrow_forward, size: 16, color: Colors.white70),
        ],
      ),
    ],
  ),
),

const SizedBox(height: 15),

SizedBox(
  height: 290,
  child: ListView(
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.symmetric(horizontal: 20),  // PERFECT FIX
    children: [
      speakerCard(
        name: "A T M Iqbal Chowdhury",
        title: "CEO, Umbrella PMC",
        description:
            "A T M Iqbal Chowdhury, CEO of Umbrella PMC, brings valuable experience...",
        countryFlag: "assets/bd_flag.png",
        tag: "International",
        isMultipleEvent: false,
        image: "assets/images/sir.png",
      ),

      const SizedBox(width: 15), // Spacing between cards

      speakerCard(
        name: "Abdul Hakim",
        title: "Founder, Startup Hub",
        description:
            "Abdul Hakim is a leading entrepreneur contributing to innovation...",
        countryFlag: "assets/in_flag.png",
        tag: "Main Event",
        isMultipleEvent: true,
        image: "assets/images/abi.png",
      ),
    ],
  ),
),
  
  




// ------------------------------------------------------------
// ------------------ 9. SPONSORS & PARTNERS ------------------
// ------------------------------------------------------------

Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Text(
    "Sponsors & Partners",
    style: GoogleFonts.poppins(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),
),

const SizedBox(height: 15),

SizedBox(
  height: 180,
  child: ListView(
    scrollDirection: Axis.horizontal,
    children: [
      const SizedBox(width: 20),

      // ------------ SPONSORS CARD ------------
      Container(
        width: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [
              Color(0xFFB68D54),
              Color(0xFF3A2A17),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sponsors & Partners",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              "Powering TNGSS with the support of our Sponsors.",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),

            const Spacer(),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                "View Sponsors",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),

      const SizedBox(width: 15),
      

      // ------------ BECOME A SPONSOR CARD ------------
      Container(
        width: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF3B3F91),
              Color(0xFF1F214F),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Become a Sponsor",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              "Join us as a partner and showcase your brand at TNGSS.",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),

            const Spacer(),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                "Sponsor Now",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),

      const SizedBox(width: 20),
    ],
  ),
),

const SizedBox(height: 40),
// FIND EVERYTHING SECTION
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [

    // Title
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        "Find Everything You Need",
        style: TextStyle(
          color: Colors.white,
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    const SizedBox(height: 15),

    // FULL WIDTH ROW
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          infoCard(
            title: "About TNGSS 2025",
            subtitle: "Learn more about the event",
            borderColors: [Colors.blue, Colors.orange],
          ),

          infoCard(
            title: "About StartupTN",
            subtitle: "Learn more",
            borderColors: [Colors.cyan, Colors.orange],
          ),
        ],
      ),
    ),
  ],
),// ------------------------------------------------------------
// ------------------ 11. EXPERIENCE COIMBATORE ---------------
// ------------------------------------------------------------

Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Text(
    "Experience Coimbatore",
    style: GoogleFonts.poppins(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
  ),
),

const SizedBox(height: 15),

Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Container(
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(
        colors: [
          Colors.white.withOpacity(0.15),
          Colors.white.withOpacity(0.05),
        ],
      ),
      border: Border.all(
        color: Colors.white.withOpacity(0.2),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Discover Coimbatore's Hidden Gems",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            "Connect with Coimbatore’s soul through authentic"
            " cultural experiences curated by local artisans.",
            style: GoogleFonts.poppins(
              color: Colors.white70,
              fontSize: 13,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 18),

          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.white70, size: 18),
              const SizedBox(width: 6),
              Text(
                "10+ Experiences",
                style: GoogleFonts.poppins(
                    color: Colors.white70, fontSize: 13),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Text(
            "8 - 11th Oct 2025",
            style: GoogleFonts.poppins(
              color: Colors.white70,
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Oorva",
                style: GoogleFonts.poppins(
                  color: Colors.orangeAccent,
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Hosted by Locals",
                style: GoogleFonts.poppins(
                  color: Colors.orangeAccent.withOpacity(0.8),
                  fontSize: 12,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Container(
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.blueAccent.withOpacity(0.25),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                "Explore Coimbatore",
                style: GoogleFonts.poppins(
                  color: Colors.blueAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          Text(
            "Note: All activities are curated by our partner and TNGSS holds no responsibility",
            style: GoogleFonts.poppins(
              color: Colors.white38,
              fontSize: 10,
            ),
          ),
        ],
      ),
    ),
  ),
),

const SizedBox(height: 35),

// --------------------------------------------------------------------------------------------------------------------
// ----------------------- END OF CONTENT ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------------------------------------




//ithuku mala nama class define panikalam/////................../////////////.........................................
              ],
            ),
          ),
        ),
      ),
    );
  }

  // -------------------------------------------------------------------------
  // FIRST BLUE CARD
  Widget _promoCard1() {
    return Container(
      width: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          colors: [Color(0xFF2C3EFA), Color(0xFF1A1E9A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Text(
        "You are requested to be seated by the inaugural ceremony...",
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }

  // -------------------------------------------------------------------------
  // SECOND RED CARD
  Widget _promoCard2() {
    return Container(
      width: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.redAccent,
      ),
      padding: const EdgeInsets.all(16),
      child: Text(
        "Travel Smart to TNGSS with redBus…",
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }

  // -------------------------------------------------------------------------
  // EVENT CARD
  Widget _eventCard() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.35),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white24, width: 1),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF1A1A1A),
            Color(0xFF000000),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              Icon(Icons.event_seat, color: Colors.white, size: 18),
              const SizedBox(width: 6),
              Text(
                "Delegate Pass",
                style: GoogleFonts.poppins(color: Colors.white70, fontSize: 12),
              ),
              const SizedBox(width: 10),
              Text(
                "Regn. Required",
                style: GoogleFonts.poppins(color: Colors.lightBlueAccent, fontSize: 12),
              ),
              const Spacer(),
              Icon(Icons.bookmark_outline, color: Colors.white, size: 20),
            ],
          ),

          const SizedBox(height: 14),

          Text(
            "Masterclass #04 - From Idea to Startup",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            "C2 - Masterclass Stage, Hall C",
            style: GoogleFonts.poppins(
              color: Colors.white54,
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            "4:00 PM - 5:00 PM   |   09 Oct 2025",
            style: GoogleFonts.poppins(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 12),

          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              _tagChip("MasterClass"),
              _tagChip("Building Startups"),
              _tagChip("Peter Dean"),
            ],
          ),

          const SizedBox(height: 14),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "80 Registered / 80",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Registration Closed",
                style: GoogleFonts.poppins(
                  color: Colors.redAccent,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tagChip(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 11,
        ),
      ),
    );
  }

  // -------------------------------------------------------------------------
  // FEATURED EVENT CARD
  Widget _featuredEventCard() {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white24, width: 1),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF5A33F8),
            Color(0xFF2A1A7A),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.receipt_long, color: Colors.white, size: 16),
              const SizedBox(width: 6),
              Text(
                "Regn. Required",
                style: GoogleFonts.poppins(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Text(
            "Pitch at TNGSS",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            "Big ideas deserve big stage. Showcase your ideas to industry stakeholders.",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),

          const Spacer(),

          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                "View All",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//SPEAKERS CARD////.........
Widget speakerCard({
  required String name,
  required String title,
  required String description,
  required String tag,
  required bool isMultipleEvent,
  required String image, required String countryFlag,
}) {
  return Container(
    width: 260,
    padding: const EdgeInsets.fromLTRB(15, 12, 15, 12),
    decoration: BoxDecoration(
      color: const Color(0xff0f0f0f),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TAG
        Align(
          alignment: Alignment.topRight,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              tag,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        const SizedBox(height: 10),

        // IMAGE + NAME + TITLE
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        // DESCRIPTION
        Text(
          description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white54,
            fontSize: 11,
          ),
        ),

        const Spacer(),  // 🔥🔥🔥 MAGIC LINE: pushes bottom to correct position!!

        // EVENT BUTTON
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade700,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            isMultipleEvent ? "Multiple Event" : "Single Event",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),

        const SizedBox(height: 12),

        // VIEW DETAILS BUTTON
        Container(
          alignment: Alignment.center,
          height: 38,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Text(
            "View Details",
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  );
}
      //Find everything. //
Widget infoCard({
  required String title,
  required String subtitle,
  required List<Color> borderColors,
}) {
  return Container(
    width: 150, // smaller width like first image
    height: 95, // fixed height to match original
    decoration: BoxDecoration(
      color: const Color(0xff0f0f0f),
      borderRadius: BorderRadius.circular(18),
      border: Border.all(
        width: 1, // thin border
        color: Colors.transparent,
      ),
    ),
    child: Container(
      padding: const EdgeInsets.all(1.5), // thin gradient stroke
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          colors: borderColors,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff0f0f0f),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13, // smaller like first image
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
Widget buildinfoCard({
  
  required String title,
  required String subtitle,
  required List<Color> borderColors,
  required IconData icon,             // 👈 NEW
  VoidCallback? onTap,                // 👈 NEW
}) {
  return InkWell(
    onTap: onTap,
    splashColor: Colors.white24,
    borderRadius: BorderRadius.circular(18),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 150,
      height: 95,
      decoration: BoxDecoration(
        color: const Color(0xff0f0f0f),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          width: 1,
          color: Colors.transparent,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(1.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: LinearGradient(
            colors: borderColors,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xff0f0f0f),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 26,
              ),
              const SizedBox(height: 8),

              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 3),

              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
//--------------------FOOTER-----------------------------------------------------------------------------//
// ⬇⬇ Floating QR Button
Widget footerCenterButton(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const MenuScreen()),
      );
    },
    child: Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade800,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: const Icon(Icons.qr_code_2, color: Colors.white, size: 36),
    ),
  );
}


// ⬇⬇ Bottom Navigation Bar
Widget footerNavigationBar(BuildContext context) {
  return BottomAppBar(
    elevation: 10,
    color: Colors.black,
    shape: const CircularNotchedRectangle(),
    notchMargin: 8,
    child: Container(
      height: 75,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black.withOpacity(0.9),
            Colors.black.withOpacity(0.7),
          ],
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          
          // 🏠 Home
          footerNavItem(
            Icons.home_outlined,
            "Home",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
              );
            },
          ),

          // 👥 Network
          footerNavItem(
            Icons.people_outline,
            "Network",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const NetworkScreen()),
              );
            },
          ),

          const SizedBox(width: 70),

          // 🎤 Event
          footerNavItem(
            Icons.mic_none,
            "Event",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const EventScreen()),
              );
            },
          ),

          // 📅 Calendar
          footerNavItem(
            Icons.calendar_today_outlined,
            "Calendar",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CalendarScreen()),
              );
            },
          ),
        ],
      ),
    ),
  );
}


// ⬇⬇ Single Item Widget
Widget footerNavItem(IconData icon, String label, {VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 26, color: Colors.white70),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}