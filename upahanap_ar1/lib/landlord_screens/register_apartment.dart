import 'package:flutter/material.dart';
import 'package:upahanap_ar1/landlord_screens/apartment_data.dart';

class RegisterApartmentScreen extends StatefulWidget {
  const RegisterApartmentScreen({super.key});

  @override
  _RegisterApartmentScreenState createState() =>
      _RegisterApartmentScreenState();
}

class _RegisterApartmentScreenState extends State<RegisterApartmentScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  String imageUrl = ""; // Placeholder for image URL

  void _registerApartment() {
    final String name = _nameController.text;
    final String location = _locationController.text;
    final double? price = double.tryParse(_priceController.text);

    if (name.isEmpty || location.isEmpty || price == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields correctly.")),
      );
      return;
    }

    setState(() {
      registeredApartments.add(Apartment(
        name: name,
        location: location,
        price: price,
        imageUrl: imageUrl.isNotEmpty ? imageUrl : "assets/images/default.jpg",
      ));
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Apartment Registered Successfully!")),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register Apartment")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Apartment Name"),
            ),
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(labelText: "Location"),
            ),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: "Price (in PHP)"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _registerApartment,
              child: const Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
