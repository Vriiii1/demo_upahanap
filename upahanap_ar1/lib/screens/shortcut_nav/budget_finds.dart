import 'package:flutter/material.dart';

class BudgetFindsScreen extends StatelessWidget {
  const BudgetFindsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Budget Finds'), // Title of the screen
        backgroundColor: Colors.blue, // Customize the app bar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Affordable Apartments',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Cozy Studio'),
                    subtitle: Text('Los Angeles, CA - \$1800/month'),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Small Apartment'),
                    subtitle: Text('New York, NY - \$1500/month'),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Budget Loft'),
                    subtitle: Text('Chicago, IL - \$1200/month'),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Nickos\' Budget Place'),
                    subtitle: Text('Nueva Ecija, Talavera - \$1000/month'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
