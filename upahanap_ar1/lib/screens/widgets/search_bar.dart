import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:upahanap_ar1/screens/search_results.dart'; // Import the SearchResults widget

class AnimatedSearchBar extends StatefulWidget {
  const AnimatedSearchBar({super.key});

  @override
  _AnimatedSearchBarState createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
  bool _isSearchActive = false;
  final TextEditingController _searchController = TextEditingController();

  void _onSearchSubmitted() {
    if (_searchController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchResults(
              searchQuery: _searchController.text), // Use SearchResults
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: _isSearchActive ? 320 : 250,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isSearchActive = !_isSearchActive;
                  if (!_isSearchActive) _searchController.clear();
                });
              },
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: Icon(
                  _isSearchActive ? LucideIcons.x : LucideIcons.search,
                  key: ValueKey(_isSearchActive),
                ),
              ),
            ),
          ),
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
              ),
              onSubmitted: (_) => _onSearchSubmitted(),
            ),
          ),
        ],
      ),
    );
  }
}
