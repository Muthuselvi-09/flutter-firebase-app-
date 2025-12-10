
import 'package:event_management2/menuscreen/%20FAQScreen.dart';
import 'package:event_management2/menuscreen/organisationprofilescreen.dart';
import 'package:flutter/material.dart';

import 'package:event_management2/widgets/animated_background.dart';
import 'package:event_management2/AI%20services/gemini_service.dart';
import 'package:event_management2/notification/notification_item.dart';
import 'package:event_management2/menuscreen/myprofilescreen.dart';
import 'package:event_management2/speaker screen/speakers.dart';
import 'package:event_management2/schedule.dart';
import 'package:event_management2/menuscreen/ContextBuilderScreen.dart';

import 'package:event_management2/menuscreen/AttendeesScreen.dart';
import 'package:event_management2/menuscreen/MeetingsScreen.dart';
import 'package:event_management2/menuscreen/BookmarkScreen.dart';
import 'package:event_management2/menuscreen/ExhibitorScreen.dart';
import 'package:event_management2/menuscreen/TermsScreen.dart';
import 'package:event_management2/menuscreen/PrivacyScreen.dart';



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

  // adjust this import based on your folder

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  List<Map<String, String>> tickets = [
    {
      "event": "Music Festival 2025",
      "date": "12 Jan 2025",
      "venue": "Rajapalayam Grounds",
      "ticketId": "TCK12345"
    },
    {
      "event": "Coding Workshop",
      "date": "25 Feb 2025",
      "venue": "Tech Park Hall",
      "ticketId": "TCK98765"
    },
    {
      "event": "Food Carnival",
      "date": "5 Mar 2025",
      "venue": "City Center",
      "ticketId": "TCK76543"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        bgColor: const Color(0xFFF7E8C8),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back,
                          color: Colors.pinkAccent, size: 26),
                    ),
                    const SizedBox(width: 12),

                const SizedBox(height: 10),
                Text(
                  "My Tickets",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown.shade700),
                ),

                const SizedBox(height: 20),

                Expanded(
                  child: tickets.isEmpty
                      ? Center(
                          child: Text(
                            "No Tickets Found",
                            style: TextStyle(
                                color: Colors.teal.shade700, fontSize: 20),
                          ),
                        )
                      : ListView.builder(
                          itemCount: tickets.length,
                          itemBuilder: (context, index) {
                            var t = tickets[index];
                            return ticketCard(t);
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget ticketCard(Map<String, String> ticket) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.75),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.brown.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ticket["event"]!,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.brown.shade800),
          ),
          const SizedBox(height: 6),
          Text("📅  ${ticket["date"]}",
              style: const TextStyle(fontSize: 16, color: Colors.black87)),
          Text("📍  ${ticket["venue"]}",
              style: const TextStyle(fontSize: 16, color: Colors.black87)),
          const SizedBox(height: 10),
          Text("🎟 Ticket ID: ${ticket["ticketId"]}",
              style: TextStyle(fontSize: 14, color: Colors.grey.shade700)),
        ],
      ),
    );
  }
}




// ------------------------------------------------------
//      💬  CHAT SCREEN (Messages UI)
// ------------------------------------------------------

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> messages = []; // user + ai messages
  bool isLoading = false;

  Future<void> sendMessage() async {
    String question = _controller.text.trim();
    if (question.isEmpty) return;

    setState(() {
      messages.add({"role": "user", "text": question});
      isLoading = true;
    });

    _controller.clear();

   String aiResponse = await GeminiService.getAIResponse(question);

    setState(() {
      messages.add({"role": "ai", "text": aiResponse});
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        bgColor: const Color(0xFFF8C7D0),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
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
                      "AI Chat",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Expanded(
                  child: messages.isEmpty
                      ? const Center(
                          child: Text("Start chatting with AI!",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black87)),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.only(bottom: 80),
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            final m = messages[index];
                            bool isUser = m["role"] == "user";

                            return Align(
                              alignment: isUser
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 6),
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: isUser
                                      ? Colors.pinkAccent
                                      : Colors.white,
                                  borderRadius:
                                      BorderRadius.circular(12),
                                ),
                                child: Text(
                                  m["text"]!,
                                  style: TextStyle(
                                      color: isUser
                                          ? Colors.white
                                          : Colors.black87,
                                      fontSize: 15),
                                ),
                              ),
                            );
                          },
                        ),
                ),

                if (isLoading)
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("AI typing...",
                        style: TextStyle(color: Colors.black54)),
                  ),

                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextField(
                          controller: _controller,
                          decoration: const InputDecoration(
                              hintText: "Type a message",
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: sendMessage,
                      child: const CircleAvatar(
                        backgroundColor: Colors.pinkAccent,
                        child: Icon(Icons.send, color: Colors.white),
                      ),
                    )
                  ],
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
class NotificationScreen extends StatefulWidget {
  final List<NotificationItem> notifications;

  const NotificationScreen({super.key, required this.notifications});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void didUpdateWidget(covariant NotificationScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        bgColor: const Color(0xFFD8C8F1),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // AppBar
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back, color: Colors.purple, size: 26),
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

                // Dynamic notification list
                Expanded(
                  child: widget.notifications.isEmpty
                      ? const Center(
                          child: Text(
                            "No notifications yet",
                            style: TextStyle(color: Colors.white54),
                          ),
                        )
                      : ListView.builder(
                          controller: scrollController,
                          itemCount: widget.notifications.length,
                          itemBuilder: (context, index) {
                            final item = widget.notifications[index];
                            return Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade900,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item.title,
                                      style: const TextStyle(
                                          color: Colors.lightBlueAccent,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 4),
                                  Text(item.message,
                                      style: const TextStyle(color: Colors.white)),
                                  const SizedBox(height: 6),
                                  Text(
                                    "${item.time.day}/${item.time.month}/${item.time.year} ${item.time.hour}:${item.time.minute.toString().padLeft(2,'0')}",
                                    style: const TextStyle(
                                        color: Colors.white54, fontSize: 12),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
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
  void _openMenuPage(String title) {
  switch (title) {
    case "My Profile":
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => const MyProfileScreen()));
      break;

    case "Organisation Profile":
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => const OrganisationProfileScreen()));
      break;

    case "Context Builder":
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => const ContextBuilderScreen()));
      break;

    case "My Ticket":
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => const  TicketScreen()));
      break;

    case "FAQs":
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => const FAQScreen()));
      break;

    case "Speakers":
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => const SpeakersScreen()));
      break;

    case "Attendees":
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => const AttendeesScreen()));
      break;

    case "Schedule Meeting":
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => const ScheduleScreen()));
      break;

    case "Meetings":
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => const MeetingsScreen()));
      break;

    case "Event Bookmarks":
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => const BookmarkScreen()));
      break;

    case "Exhibitors":
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => const ExhibitorScreen()));
      break;

    case "Terms and Conditions":
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => const TermsScreen()));
      break;

    case "Privacy policy":
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => const PrivacyScreen()));
      break;
  }
}


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
  return InkWell(
    onTap: () {
      _openMenuPage(title);
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: Colors.black, size: 24),
          const SizedBox(width: 14),
          Text(title,
              style: const TextStyle(color: Colors.black, fontSize: 17)),
        ],
      ),
    ),
  );
}
}
