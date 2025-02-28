import 'package:flutter/material.dart';

class Apartment {
  final String name;
  final String location;
  final double price;
  final String imageUrl;

  Apartment({
    required this.name,
    required this.location,
    required this.price,
    required this.imageUrl,
  });
}

// List of registered apartments
List<Apartment> registeredApartments = [
  Apartment(
    name: "Modern Loft",
    location: "New York, NY",
    price: 2200,
    imageUrl: "assets/images/house.jpg",
  ),
  Apartment(
    name: "Cozy Studio",
    location: "Los Angeles, CA",
    price: 1800,
    imageUrl: "assets/images/house.jpg",
  ),
  Apartment(
    name: "Luxury Penthouse",
    location: "Chicago, IL",
    price: 3500,
    imageUrl: "assets/images/house.jpg",
  ),
  Apartment(
    name: "Nickos' Place",
    location: "Nueva Ecija, Talavera",
    price: 3500,
    imageUrl: "assets/images/house.jpg",
  ),
];

// Function to filter apartments based on search query
List<Apartment> searchApartments(String query) {
  return registeredApartments
      .where((apartment) =>
          apartment.name.toLowerCase().contains(query.toLowerCase()) ||
          apartment.location.toLowerCase().contains(query.toLowerCase()))
      .toList();
}
