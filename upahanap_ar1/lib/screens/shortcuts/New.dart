import 'package:flutter/material.dart';
import 'package:upahanap_ar1/screens/shortcut_nav/new.dart'; // Import the NewScreen

class NewButton extends StatelessWidget {
  final ThemeData theme;

  const NewButton({super.key, required this.theme});

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
              // Navigate to the NewScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const NewScreen(), // Replace with your screen
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
              'assets/images/new (1).png', // Replace with your icon path
              width: 50, // Adjust icon size as needed
              height: 50,
            ),
          ),
        ),
        const Positioned(
          bottom: 0,
          child: Text(
            "New",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white, // Increase text size
              // Change text color to white
              // Make text bold
            ),
          ),
        ),
      ],
    );
  }
}
