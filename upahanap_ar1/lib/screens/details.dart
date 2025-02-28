import 'package:flutter/material.dart';

/// Detail Page 1 - Welcome
class WelcomeDetailPage extends StatelessWidget {
  const WelcomeDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildDetailPage(
      context,
      title: "More About UpaHanap",
      content:
          "UpaHanap helps users find apartments easily with a seamless experience.",
    );
  }
}

/// Detail Page 2 - Features
class FeaturesDetailPage extends StatelessWidget {
  const FeaturesDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildDetailPage(
      context,
      title: "In-Depth Features",
      content:
          "We provide verified listings, real-time updates, and secure transactions.",
    );
  }
}

/// Detail Page 3 - How It Works
class HowItWorksDetailPage extends StatelessWidget {
  const HowItWorksDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildDetailPage(
      context,
      title: "How It Works",
      content:
          "1. Search apartments\n2. Compare options\n3. Secure a lease\n4. Manage your space",
    );
  }
}

/// Detail Page 4 - Getting Started
class GetStartedDetailPage extends StatelessWidget {
  const GetStartedDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildDetailPage(
      context,
      title: "Start Now",
      content: "Sign up to find the perfect home with UpaHanap.",
    );
  }
}

/// 🔥 Reusable UI for Detail Pages
Widget _buildDetailPage(BuildContext context,
    {required String title, required String content}) {
  return Scaffold(
    appBar: AppBar(
      title: Text(title),
      centerTitle: true,
      backgroundColor: Colors.black54,
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            content,
            style: const TextStyle(fontSize: 16, color: Colors.white70),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            ),
            child: const Text("Go Back"),
          ),
        ],
      ),
    ),
  );
}
