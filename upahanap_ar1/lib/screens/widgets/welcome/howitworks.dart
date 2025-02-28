import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HowItWorksPage extends StatelessWidget {
  const HowItWorksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/lottie/bulb.json', width: 300, height: 300),
          const SizedBox(height: 20),
          const Text(
            "How UpaHanap Works",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "1. Search for apartments.\n"
            "2. Compare options.\n"
            "3. Secure your place.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
