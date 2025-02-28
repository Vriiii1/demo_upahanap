import 'package:flutter/material.dart';
import 'package:upahanap_ar1/screens/shortcut_nav/budget_finds.dart'; // Import the BudgetFindsScreen

class OffersButton extends StatelessWidget {
  final ThemeData theme;

  const OffersButton({super.key, required this.theme});

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
              // Navigate to the BudgetFindsScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const BudgetFindsScreen(), // Navigate to BudgetFindsScreen
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
              'assets/images/offer.png', // Replace with your icon path
              width: 50, // Adjust icon size as needed
              height: 50,
            ),
          ),
        ),
        const Positioned(
          bottom: 0,
          child: Text(
            "Budget Finds",
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
