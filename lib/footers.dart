import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


// ---------------- SCREENS ------------------

class HomeMainScreen extends StatelessWidget {
  const HomeMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("🏠 HOME SCREEN", style: TextStyle(color: Colors.white, fontSize: 25)),
    );
  }
}

// ---------------- NETWORK SCREEN ------------------



class NetworkScreen extends StatefulWidget {
  const NetworkScreen({super.key});

  @override
  State<NetworkScreen> createState() => _NetworkScreenState();
}

class _NetworkScreenState extends State<NetworkScreen> {

  double profileScore = 0.15; // 15% score example
  int connections = 1;
  int requests = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back,
                          color: Colors.white, size: 26),
                    ),
                    const SizedBox(width: 12),
            
            
            

            // ---------- TITLE ----------
            const Text(
              "Networking",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // ---------- AI MATCHMAKING CARD ----------
            matchmakingCard(),

            const SizedBox(height: 25),

            // ---------- PEOPLE ATTENDING ----------
            attendingCard(),

            const SizedBox(height: 25),

            // ---------- CONNECTIONS + REQUESTS ----------
            connectionRequestRow(),
          ],
        ),
      ),
    );
  }

  // ----------------- MATCHMAKING WIDGET -----------------
 Widget matchmakingCard() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: const LinearGradient(
        colors: [Color(0xFFCC6E2B), Color(0xFFB94B50)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        // ---------- LEFT SIDE ----------
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              const Text(
                "AI Matchmaking",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Your perfect match is waiting for you!!!",
                style: TextStyle(color: Colors.white70),
              ),

              const SizedBox(height: 12),

              Row(
                children: const [
                  CircleAvatar(radius: 16, backgroundColor: Colors.white),
                  SizedBox(width: 6),
                  CircleAvatar(radius: 16, backgroundColor: Colors.white),
                  SizedBox(width: 6),
                  CircleAvatar(radius: 16, backgroundColor: Colors.white),
                  SizedBox(width: 6),
                  CircleAvatar(radius: 16, backgroundColor: Colors.white),
                  SizedBox(width: 6),
                  Text("+5", style: TextStyle(color: Colors.white)),
                ],
              ),

              const SizedBox(height: 14),

              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  "Complete Profile",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 10),

        // ---------- SCORE CIRCLE ----------
        SizedBox(
          width: 70,
          height: 70,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value: profileScore,
                strokeWidth: 6,
                backgroundColor: Colors.white24,
                valueColor: const AlwaysStoppedAnimation(Colors.greenAccent),
              ),
              Text(
                "${(profileScore * 100).toInt()}%",
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}


  // ----------------- PEOPLE ATTENDING WIDGET -----------------
  Widget attendingCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          colors: [Color(0xFF348FF8), Color(0xFF3BB0E0)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "51,541 People Attending",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          Row(
            children: const [
              CircleAvatar(radius: 18, backgroundColor: Colors.white),
              SizedBox(width: 5),
              CircleAvatar(radius: 18, backgroundColor: Colors.white),
              SizedBox(width: 5),
              CircleAvatar(radius: 18, backgroundColor: Colors.white),
              SizedBox(width: 5),
              CircleAvatar(radius: 18, backgroundColor: Colors.white),
              SizedBox(width: 5),
              CircleAvatar(radius: 18, backgroundColor: Colors.white),
              SizedBox(width: 10),
              Text("99+", style: TextStyle(color: Colors.white)),
              Spacer(),
              Text("View All",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }

  // ----------------- CONNECTION + REQUEST ROW -----------------
  Widget connectionRequestRow() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 90,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("My Connections",
                    style: TextStyle(color: Colors.white)),
                const SizedBox(height: 10),
                Text("$connections connections",
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),

        const SizedBox(width: 16),

        Expanded(
          child: Container(
            height: 90,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Requests",
                    style: TextStyle(color: Colors.white)),
                const SizedBox(height: 10),
                Text("$requests requests",
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}



// ---------------- EVENT SCREEN ------------------

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 151, 151),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back, size: 28, color: Colors.black),
                ),
                const SizedBox(width: 15),
                const Expanded(
                  child: Text(
                    "Events",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 🔎 SEARCH BAR + MENU ICON
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.05),
                        )
                      ],
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey),
                        SizedBox(width: 10),
                        Text(
                          "Search Events...",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.05),
                      )
                    ],
                  ),
                  child: const Icon(Icons.menu_rounded, color: Colors.deepOrange),
                )
              ],
            ),

            const SizedBox(height: 25),

            // 🔥 SLIDER BANNER
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  bannerCard(
                    img: "https://images.unsplash.com/photo-1511376777868-611b54f68947",
                    title: "Live Carnage • BMTH Rock",
                    subtitle: "Am Ring Experience 2025",
                  ),
                  bannerCard(
                    img: "https://images.unsplash.com/photo-1518972559570-7cc1309f3229",
                    title: "DJ Night Festival",
                    subtitle: "Electronic & EDM Night",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // 🎵 EVENT CATEGORY TITLE
            rowTitle("Event Category"),

            const SizedBox(height: 14),

            // CATEGORY LIST
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                categoryIcon(Icons.music_note, "Music"),
                categoryIcon(Icons.thunderstorm, "Rock"),
                categoryIcon(Icons.play_circle_fill, "Live"),
                categoryIcon(Icons.celebration, "Festivals"),
              ],
            ),

            const SizedBox(height: 30),

            // 📍 EVENT NEARBY TITLE
            rowTitle("Event Nearby"),

            const SizedBox(height: 12),

            // EVENT NEARBY CARDS
            eventNearby(),
            const SizedBox(height: 20),
            eventNearby(),

            const SizedBox(height: 30),

            // ⭐ POPULAR EVENTS TITLE
            rowTitle("Popular Events"),

            const SizedBox(height: 15),

            // POPULAR EVENT CARDS
            eventPopular(),
            const SizedBox(height: 20),
            eventPopular(),
          ],
        ),
      ),
    );
  }

  // ----------------- COMPONENTS -----------------

  Widget bannerCard({required String img, required String title, required String subtitle}) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("🔥 Popular", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.white70, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget categoryIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                blurRadius: 8,
                color: Colors.black.withOpacity(0.05),
              )
            ],
          ),
          child: Icon(icon, color: Colors.deepOrange),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget eventNearby() {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 10,
            color: Colors.black.withOpacity(0.05),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 130,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.horizontal(left: Radius.circular(18)),
              image: const DecorationImage(
                image: NetworkImage("https://images.unsplash.com/photo-1497032628192-86f99bcd76bc"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Bring Me The Horizon Live Tour",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text("May 3, 2025 at 9:00 PM",
                      style: TextStyle(fontSize: 12, color: Colors.deepOrange)),
                  SizedBox(height: 5),
                  Text("Olympiastadion, Berlin",
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget eventPopular() {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 10,
            color: Colors.black.withOpacity(0.05),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 140,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.horizontal(left: Radius.circular(18)),
              image: const DecorationImage(
                image: NetworkImage("https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("🔥 Popular", style: TextStyle(color: Colors.deepOrange)),
                  SizedBox(height: 5),
                  Text("Echoes of Chacs • Bring Me",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  SizedBox(height: 6),
                  Text("May 5, 2025 at 11:00 PM",
                      style: TextStyle(fontSize: 12, color: Colors.deepOrange)),
                  SizedBox(height: 6),
                  Text("Accor Arena, Paris",
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget rowTitle(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const Text("See More >",
            style: TextStyle(color: Colors.deepOrange, fontSize: 12)),
      ],
    );
  }
}

//------------------------------------------------CALENDAR SCREEN ------------------//
class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4C1D78),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Calendar", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage("assets/user.jpg"), // Replace
            ),
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
        
              // ----- CALENDAR BOX -----
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.15),
                      Colors.white.withOpacity(0.05),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                padding: const EdgeInsets.all(15),
                child: TableCalendar(
                  firstDay: DateTime.utc(2020),
                  lastDay: DateTime.utc(2030),
                  focusedDay: focusedDay,
                  selectedDayPredicate: (day) => isSameDay(selectedDay, day),
        
                  onDaySelected: (selected, focused) {
                    setState(() {
                      selectedDay = selected;
                      focusedDay = focused;
                    });
                  },
        
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
                    leftChevronIcon:
                        Icon(Icons.chevron_left, color: Colors.white),
                    rightChevronIcon:
                        Icon(Icons.chevron_right, color: Colors.white),
                  ),
        
                  calendarStyle: CalendarStyle(
                    defaultTextStyle: const TextStyle(color: Colors.white),
                    weekendTextStyle: const TextStyle(color: Colors.white),
                    todayDecoration: BoxDecoration(
                      color: Colors.purple.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      border: Border.all(color: Colors.purpleAccent, width: 2),
                      shape: BoxShape.circle,
                    ),
                  ),
                  daysOfWeekStyle: const DaysOfWeekStyle(
                    weekdayStyle: TextStyle(color: Colors.white70),
                    weekendStyle: TextStyle(color: Colors.white70),
                  ),
                ),
              ),
        
              const SizedBox(height: 20),
        
              // ----- EVENT LIST BOX -----
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.15),
                      Colors.white.withOpacity(0.05),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    // Day label
                    Text(
                      "MON",
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
        
                    SizedBox(height: 10),
        
                    // Events
                    EventTile(time: "4:00 pm", title: "Set up @ the Goat"),
                    EventTile(time: "6:00 pm", title: "Opener"),
                    EventTile(time: "6:30 pm", title: "On stage by 7"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// -------- EVENT TILE WIDGET --------
class EventTile extends StatelessWidget {
  final String time;
  final String title;

  const EventTile({super.key, required this.time, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          SizedBox(
              width: 70,
              child: Text(time,
                  style: const TextStyle(color: Colors.white, fontSize: 14))),
          Expanded(
            child: Text(title,
                style: const TextStyle(color: Colors.white, fontSize: 14)),
          ),
        ],
      ),
    );
  }
}


class QrScreen extends StatelessWidget {
  const QrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("🔳 QR SCREEN", style: TextStyle(color: Colors.white, fontSize: 25)),
    );
  }
}

// --------------- FOOTER CONTROLLER ----------------

class FooterController extends StatelessWidget {
  final Widget appBar;
  final Widget drawer;

  const FooterController({
    super.key,
    required this.appBar,
    required this.drawer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: appBar,
      ),

      drawer: drawer,

      // 🔥 Always show Home UI (index illai)
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A5AE0), Color(0xFFE15ABD)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const HomeMainScreen(),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: footerCenterButton(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const QrScreen()),
          );
        },
      ),

      bottomNavigationBar: footerNavigationBar(context),
    );
  }
}

// -------------------- QR BUTTON --------------------

Widget footerCenterButton({required Function() onTap}) {
  return GestureDetector(
    onTap: onTap,
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

// -------------------- FOOTER NAV BAR --------------------

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
          
          // HOME
          footerNavItem(
            Icons.home_outlined,
            "Home",
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HomeMainScreen()),
              );
            },
          ),

          // NETWORK
          footerNavItem(
            Icons.people_outline,
            "Network",
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const NetworkScreen()),
              );
            },
          ),

          const SizedBox(width: 70),

          // EVENT
          footerNavItem(
            Icons.mic_none,
            "Event",
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const EventScreen()),
              );
            },
          ),

          // CALENDAR
          footerNavItem(
            Icons.calendar_today_outlined,
            "Calendar",
            () {
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

// -------------------- NAV ITEM --------------------

Widget footerNavItem(IconData icon, String label, Function() onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 26, color: Colors.white70),
        const SizedBox(height: 2),
        Text(label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}