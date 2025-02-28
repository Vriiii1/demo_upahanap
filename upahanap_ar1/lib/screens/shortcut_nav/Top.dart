import 'package:flutter/material.dart';

class TopScreen extends StatelessWidget {
  const TopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated'), // Title of the screen
        backgroundColor: Colors.blue, // Customize the app bar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Top Rated Apartments',
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
                    title: Text('Luxury Penthouse'),
                    subtitle: Text('Chicago, IL - \$3500/month'),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Modern Loft'),
                    subtitle: Text('New York, NY - \$2200/month'),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Nickos\' Place'),
                    subtitle: Text('Nueva Ecija, Talavera - \$3500/month'),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Cozy Studio'),
                    subtitle: Text('Los Angeles, CA - \$1800/month'),
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
