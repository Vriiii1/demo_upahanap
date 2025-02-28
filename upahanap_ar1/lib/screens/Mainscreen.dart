import 'package:flutter/material.dart';
import 'package:upahanap_ar1/screens/widgets/nav_bar.dart';
import 'package:upahanap_ar1/screens/home_screen.dart';
import 'package:upahanap_ar1/screens/navigation_bar/profile.dart';
import 'package:upahanap_ar1/screens/navigation_bar/setting.dart';
import 'package:upahanap_ar1/screens/navigation_bar/notifications.dart';
import 'package:upahanap_ar1/landlord_screens/register_apartment.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ProfileScreen(),
    const SettingsScreen(),
    const NotificationsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // ✅ Fix overlap issue
      backgroundColor: Colors.transparent, // ✅ Ensures transparency
      body: _screens[_selectedIndex],

      /// Custom Bottom Navigation Bar
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
