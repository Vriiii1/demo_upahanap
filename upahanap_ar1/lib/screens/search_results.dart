import 'package:flutter/material.dart';
import 'package:upahanap_ar1/models/Apartment.dart'
    hide Apartment; // Import the Apartment class
import 'package:upahanap_ar1/landlord_screens/apartment_data.dart'; // Import the apartment data

class SearchResults extends StatelessWidget {
  final String searchQuery; // Add a parameter for the search query

  const SearchResults({Key? key, required this.searchQuery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Filter apartments based on the search query
    final List<Apartment> results = searchApartments(searchQuery);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Results'),
      ),
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          final apartment = results[index];
          return ListTile(
            leading: Image.asset(
              apartment.imageUrl, // Display the apartment image
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(apartment.name),
            subtitle: Text(apartment.location),
            trailing: Text('\$${apartment.price.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}
