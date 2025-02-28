import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rive/rive.dart'; // Import the Rive package
import 'package:upahanap_ar1/screens/mainscreen.dart';
import 'package:upahanap_ar1/screens/widgets/welcome/welcome.dart';
import 'package:upahanap_ar1/screens/widgets/welcome/features.dart';
import 'package:upahanap_ar1/screens/widgets/welcome/getstarted.dart';
import 'package:upahanap_ar1/screens/widgets/welcome/howitworks.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  Future<void> _goToHome() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenOnboarding', true);
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
          // 🔹 Debugging: Add a colored container to check if the widget is visible
          Positioned.fill(
            child: Container(
              color: Colors.red, // Temporary debug color
              child: RiveAnimation.asset(
                'assets/3_body_background (1).riv', // Path to your .riv file
                fit: BoxFit.cover, // Cover the entire screen
              ),
            ),
          ),

          PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: pages.length,
            itemBuilder: (context, index) {
              return pages[index];
            },
          ),
          if (_currentPage == pages.length - 1)
            Positioned(
              bottom: 30,
              left: 50,
              right: 50,
              child: ElevatedButton(
                onPressed: _goToHome,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  "Get Started",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

final List<Widget> pages = [
  const WelcomePage(),
  const FeaturesPage(),
  const HowItWorksPage(),
  const GetStartedPage(),
];
