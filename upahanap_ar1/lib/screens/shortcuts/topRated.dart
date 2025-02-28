import 'package:flutter/material.dart';
import 'package:upahanap_ar1/screens/shortcut_nav/Top.dart'; // Import the TopScreen

class TopRatedButton extends StatelessWidget {
  final ThemeData theme;

  const TopRatedButton({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 100, // Set the desired width
          height: 100, // Set the desired height
          child: ElevatedButton(
            onPressed: () {
              // Navigate to the TopScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const TopScreen(), // Navigate to TopScreen
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(12), // Rounded square effect
              ),
            ),
            child: Image.asset(
              'assets/images/ratings.png', // Replace with your icon path
              width: 50, // Adjust icon size as needed
              height: 50,
            ),
          ),
        ),
        const Positioned(
          bottom: 0,
          child: Text(
            "Top Rated",
            style: TextStyle(
              fontSize: 14, // Increase text size
              color: Colors.white, // Change text color to white
              // Make text bold
            ),
          ),
        ),
      ],
    );
  }
}
