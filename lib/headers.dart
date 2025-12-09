import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  final Widget child;
  final Color bgColor;

  const AnimatedBackground({
    super.key,
    required this.child,
    required this.bgColor,
  });

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.bgColor,
      child: widget.child,
    );
  }
}





// ------------------------------------------------------
//      🎫  TICKET SCREEN 
// ------------------------------------------------------
class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
         bgColor: Color(0xFFF7E8C8),

        child: Center(
          child: Text(
            "Your Tickets will appear here",
            style: TextStyle(color: Colors.teal, fontSize: 20),
          ),
        ),
      ),
    );
  }
}



// ------------------------------------------------------
//      💬  CHAT SCREEN (Messages UI)
// ------------------------------------------------------
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
         bgColor: Color(0xFFF8C7D0),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back,
                          color: Colors.pinkAccent, size: 26),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      "Messages",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.search, color: Colors.white70),
                      SizedBox(width: 10),
                      Text("Search messages or contact",
                          style:
                              TextStyle(color: Colors.white, fontSize: 15)),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  "No Messages Found in your Inbox",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



// ------------------------------------------------------
//      🔔  NOTIFICATION SCREEN
// ------------------------------------------------------
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
          bgColor: Color(0xFFD8C8F1),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back,
                          color: Colors.purple, size: 26),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      "Notifications",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                const Text(
                  "Recent",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 15),

                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("New connection request",
                          style: TextStyle(
                              color: Colors.lightBlueAccent,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text("Govinda Prapakaran wants to connect with you.",
                          style: TextStyle(color: Colors.white)),
                      SizedBox(height: 6),
                      Text("Sat Sep 13, 12:23 PM",
                          style: TextStyle(color: Colors.white54, fontSize: 12))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// ------------------------------------------------------
//      🍔  MENU SCREEN


class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String name = "Govinda Prapakaran";
  String email = "codingrim06@gmail.com";
  String? profileImage; // later firebase/file path store panna

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        bgColor: const Color(0xFFB8EADF),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// 🔙 Back Button
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back,
                      color: Colors.green, size: 26),
                ),

                const SizedBox(height: 20),

                /// ----------------------------------------------------
                /// ⭐ PROFILE HEADER
                /// ----------------------------------------------------
                Center(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          /// Profile Image
                          CircleAvatar(
                            radius: 48,
                            backgroundColor: Colors.white,
                            backgroundImage: profileImage != null
                                ? AssetImage(profileImage!)
                                : null,
                            child: profileImage == null
                                ? const Icon(Icons.person,
                                    size: 60, color: Colors.black54)
                                : null,
                          ),

                          /// Edit Icon
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: GestureDetector(
                              onTap: () {
                                // in future choose profile image here
                                print("Edit Profile Photo");
                              },
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: const BoxDecoration(
                                  color: Colors.lightBlueAccent,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.edit,
                                    size: 16, color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),

                      const SizedBox(height: 15),

                      /// Name
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 5),

                      /// Email
                      Text(
                        email,
                        style: const TextStyle(
                            fontSize: 14, color: Colors.black54),
                      ),

                      const SizedBox(height: 25),
                    ],
                  ),
                ),

                /// ----------------------------------------------------
                /// MENU CARDS
                /// ----------------------------------------------------
                menuCard([
                  menuItem(Icons.person, "My Profile"),
                  menuItem(Icons.group, "Organisation Profile"),
                  menuItem(Icons.stacked_line_chart, "Context Builder"),
                  menuItem(Icons.confirmation_number, "My Ticket"),
                  menuItem(Icons.layers, "FAQs"),
                ]),

                const SizedBox(height: 20),

                menuCard([
                  menuItem(Icons.mic, "Speakers"),
                  menuItem(Icons.people, "Attendees"),
                  menuItem(Icons.calendar_today, "Schedule Meeting"),
                  menuItem(Icons.meeting_room, "Meetings"),
                  menuItem(Icons.bookmark, "Event Bookmarks"),
                  menuItem(Icons.account_balance, "Exhibitors"),
                ]),

                const SizedBox(height: 20),

                menuCard([
                  menuItem(Icons.description, "Terms and Conditions"),
                  menuItem(Icons.privacy_tip, "Privacy policy"),
                ]),

                const SizedBox(height: 25),

                /// Logout
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 40),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.pink, width: 1.2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      "🚪 Log out",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    "Developed By Minsky",
                    style: TextStyle(color: Colors.white54),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget menuCard(List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(children: children),
    );
  }

  Widget menuItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.black, size: 24),
          const SizedBox(width: 14),
          Text(title,
              style: const TextStyle(color: Colors.black, fontSize: 17)),
        ],
      ),
    );
  }
}
