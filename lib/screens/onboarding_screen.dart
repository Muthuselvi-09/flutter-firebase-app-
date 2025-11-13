import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'animation': 'assets/animations/onboarding.json',
      'title': 'Plan Your Event',
      'desc': 'Easily organize and manage every event detail in one place.',
    },
    {
      'animation': 'assets/animations/onboarding1.json',
      'title': 'Connect & Grow',
      'desc': 'Find people who share your goals and expand your network.',
    },
    {
      'animation': 'assets/animations/onboarding2.json',
      'title': 'Celebrate Success',
      'desc': 'Experience smooth and successful event execution.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: PageView.builder(
        controller: _controller,
        onPageChanged: (index) => setState(() => _currentPage = index),
        itemCount: _pages.length,
        itemBuilder: (_, index) {
          return Stack(
            alignment: Alignment.center,
            children: [
              // 🔷 Full-screen animated background
              Positioned.fill(
                child: Lottie.asset(
                  _pages[index]['animation']!,
                  fit: BoxFit.contain,
                  repeat: true,
                ),
              ),

              // 🔹 Overlay text and button at bottom
              Positioned(
                bottom: size.height * 0.15,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Text(
                      _pages[index]['title']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        _pages[index]['desc']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // 🔸 Dots indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _pages.length,
                        (dotIndex) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 6,
                          width: _currentPage == dotIndex ? 20 : 6,
                          decoration: BoxDecoration(
                            color: _currentPage == dotIndex
                                ? Colors.tealAccent
                                : Colors.grey.shade700,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // 🔸 Next / Get Started Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_currentPage == _pages.length - 1) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const HomeScreen()),
                            );
                          } else {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.tealAccent,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          minimumSize:
                              Size(size.width * 0.8, size.height * 0.06),
                        ),
                        child: Text(
                          _currentPage == _pages.length - 1
                              ? 'Get Started'
                              : 'Next',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
