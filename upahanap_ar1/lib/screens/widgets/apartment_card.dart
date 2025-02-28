import 'package:flutter/material.dart';
import 'package:upahanap_ar1/screens/widgets/apartment_detail_screen.dart';
import 'package:upahanap_ar1/landlord_screens/apartment_data.dart';

class ApartmentCard extends StatelessWidget {
  final Apartment apartment;
  final ThemeData theme;

  const ApartmentCard({
    Key? key,
    required this.apartment,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.dividerColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Apartment Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              apartment.imageUrl, // Ensure this is correct
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          // Apartment Name
          Text(
            apartment.name,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          // Location and Price
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: 16,
                color: Colors.grey[600],
              ),
              const SizedBox(width: 8),
              Text(
                apartment.location,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
              const Spacer(),
              Text(
                "\$${apartment.price.toStringAsFixed(2)}/month",
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
