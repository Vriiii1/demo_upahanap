import 'package:flutter/material.dart';
import 'package:upahanap_ar1/themes/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              theme.colorScheme.surface,
              theme.colorScheme.surface,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            _buildProfileHeader(context),
            const SizedBox(height: 30),
            _buildCategory(context, "Personal Information", [
              {"title": "Name", "value": "Tenant", "icon": Icons.person},
              {
                "title": "Email",
                "value": "Tenant@gmail.com",
                "icon": Icons.email
              },
              {
                "title": "Phone",
                "value": "+63 912 345 6789",
                "icon": Icons.phone
              },
            ]),
            _buildCategory(context, "Preferences", [
              {
                "title": "Saved Apartments",
                "value": "",
                "icon": Icons.favorite
              },
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Center(
          child: CircleAvatar(
            radius: 60,
            backgroundColor: theme.cardColor,
            child: ClipOval(
              child: Image.asset(
                'assets/images/logo1.png',
                fit: BoxFit.cover,
                width: 120,
                height: 120,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text("Tenant", style: theme.textTheme.titleLarge),
        const SizedBox(height: 5),
        Text("Tenant@gmail.com", style: theme.textTheme.bodyMedium),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          child: const Text("Edit Profile", style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }

  Widget _buildCategory(
      BuildContext context, String category, List<Map<String, dynamic>> items) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(category, style: theme.textTheme.titleLarge),
        const SizedBox(height: 10),
        Column(
          children:
              items.map((item) => _buildProfileTile(context, item)).toList(),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildProfileTile(BuildContext context, Map<String, dynamic> item) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.dividerColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: theme.colorScheme.primary,
          child: Icon(item["icon"], color: theme.colorScheme.onPrimary),
        ),
        title: Text(item["title"], style: theme.textTheme.bodyLarge),
        subtitle: item["value"].isNotEmpty
            ? Text(item["value"], style: theme.textTheme.bodyMedium)
            : null,
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }
}
