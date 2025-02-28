import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upahanap_ar1/themes/theme_provider.dart';
import 'package:upahanap_ar1/screens/shortcuts/Offers.dart';
import 'package:upahanap_ar1/screens/shortcuts/New.dart';
import 'package:upahanap_ar1/screens/shortcuts/topRated.dart';
import 'package:upahanap_ar1/screens/widgets/apartment_card.dart';

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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Apartment> apartments = [
    Apartment(
      name: "Modern Loft",
      location: "New York, NY",
      price: 2200,
      imageUrl: "assets/images/house.jpg", // Change this path
    ),
    Apartment(
      name: "Cozy Studio",
      location: "Los Angeles, CA",
      price: 1800,
      imageUrl: "assets/images/house.jpg", // Change this path
    ),
    Apartment(
      name: "Luxury Penthouse",
      location: "Chicago, IL",
      price: 3500,
      imageUrl: "assets/images/house.jpg", // Change this path
    ),
    Apartment(
      name: "Nickos",
      location: "Nueva Ecija, Talavera",
      price: 3500,
      imageUrl: "assets/images/house.jpg", // Change this path
    ),
  ];

  List<Apartment> filteredApartments = [];
  final TextEditingController _searchController = TextEditingController();
  double panelPosition = 0.35;

  @override
  void initState() {
    super.initState();
    filteredApartments = apartments; // Initialize with all apartments
  }

  void _filterApartments(String query) {
    setState(() {
      filteredApartments = apartments
          .where((apartment) =>
              apartment.name.toLowerCase().contains(query.toLowerCase()) ||
              apartment.location.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // 🔹 Background Image
          Positioned(
            top: -30,
            left: 0,
            right: 0,
            child: Container(
              height: 500,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/house.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // 🔹 Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.scaffoldBackgroundColor.withOpacity(1.0),
                    theme.primaryColor.withOpacity(0.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          Column(
            children: [
              const SizedBox(height: 60),
              Text(
                "Find Your Perfect Home",
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // 🔹 Normal Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Opacity(
                  opacity: 0.6,
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: const Icon(Icons.search), // Add a search icon
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(12), // Rounded corners
                        borderSide: BorderSide(color: theme.dividerColor),
                      ),
                      filled: true,
                      fillColor:
                          theme.cardColor.withOpacity(0.8), // Background color
                    ),
                    onChanged: _filterApartments, // Pass the search function
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 Scrollable Buttons
              SizedBox(
                height: 90,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      OffersButton(theme: theme),
                      const SizedBox(width: 25),
                      NewButton(theme: theme),
                      const SizedBox(width: 25),
                      TopRatedButton(theme: theme),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // 🔹 Sliding Panel for Apartment List
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: screenHeight * panelPosition,
            left: 0,
            right: 0,
            height: screenHeight * (1 - panelPosition),
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                setState(() {
                  panelPosition -= details.primaryDelta! / screenHeight;
                  panelPosition = panelPosition.clamp(0.05, 0.5);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: theme.cardColor.withOpacity(1.0),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
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
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                        color: theme.dividerColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        itemCount: filteredApartments.length,
                        itemBuilder: (context, index) {
                          return ApartmentCard(
                            apartment: filteredApartments[index],
                            theme: theme,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 🔹 Apartment Card UI
class ApartmentCard extends StatelessWidget {
  final Apartment apartment;
  final ThemeData theme;

  const ApartmentCard({
    super.key,
    required this.apartment,
    required this.theme,
  });

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
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: theme.primaryColor,
          child: Icon(Icons.home, color: theme.textTheme.bodyMedium?.color),
        ),
        title: Text(
          apartment.name,
          style:
              theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              apartment.location,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.textTheme.bodyMedium?.color?.withOpacity(0.8),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "\$${apartment.price.toStringAsFixed(2)}/month",
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
