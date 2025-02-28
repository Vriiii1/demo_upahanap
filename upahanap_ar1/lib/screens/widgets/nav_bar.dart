import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // ✅ Fully removes background color
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: BottomNavigationBar(
            backgroundColor: Colors.black, // ✅ Fully transparent navbar
            elevation: 0, // ✅ Removes any shadow effect
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.white),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Colors.white),
                label: "Profile",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings, color: Colors.white),
                label: "Settings",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications, color: Colors.white),
                label: "Notifications",
              ),
            ],
            currentIndex: selectedIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withOpacity(0.5),
            onTap: onItemTapped,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }
}
