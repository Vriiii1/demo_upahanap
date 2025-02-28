import 'package:flutter/material.dart';
import 'package:upahanap_ar1/landlord_screens/apartment_data.dart';

class ApartmentDetailScreen extends StatelessWidget {
  final Apartment apartment;

  const ApartmentDetailScreen({super.key, required this.apartment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(apartment.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(apartment.name, style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: 10),
            Text("Location: ${apartment.location}"),
            const SizedBox(height: 10),
            Text("Price: \$${apartment.price.toStringAsFixed(2)}"),
          ],
        ),
      ),
    );
  }
}

extension on TextTheme {
  get headline6 => null;
}
