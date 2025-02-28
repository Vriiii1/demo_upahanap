import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rive/rive.dart'; // Import the Rive package
import 'package:upahanap_ar1/screens/mainscreen.dart';
import 'package:upahanap_ar1/screens/widgets/welcome/welcome.dart';
import 'package:upahanap_ar1/screens/widgets/welcome/features.dart';
import 'package:upahanap_ar1/screens/widgets/welcome/getstarted.dart';
import 'package:upahanap_ar1/screens/widgets/welcome/howitworks.dart';
import 'dart:ui';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  Future<void> _goToMainScreen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'hasSeenOnboarding', true); // ✅ Save onboarding completion

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔹 Rive Background Animation
          Positioned.fill(
            child: Stack(
              children: [
                // 🔹 Rive Background Animation
                RiveAnimation.asset(
                  'assets/3_body_background (1).riv', // Path to your .riv file
                  fit: BoxFit.cover, // Cover the entire screen
                ),

                // 🔹 Blur Effect
                BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 75.0, sigmaY: 75.0), // Adjust blur intensity
                  child: Container(
                    color: Colors
                        .transparent, // Transparent background for the blur effect
                  ),
                ),
              ],
            ),
          ),

          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: const [
              WelcomePage(),
              FeaturesPage(),
              HowItWorksPage(),
              GetStartedPage(),
            ],
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: _currentPage == index ? 20 : 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? Colors.blueAccent
                        : Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                );
              }),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage < 3)
                  TextButton(
                    onPressed: _goToMainScreen,
                    child: const Text(
                      "Skip",
                      style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                    ),
                  ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage == 3) {
                      _goToMainScreen();
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    foregroundColor: Colors.white,
                  ),
                  child: Text(_currentPage == 3 ? "Get Started" : "Next"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
