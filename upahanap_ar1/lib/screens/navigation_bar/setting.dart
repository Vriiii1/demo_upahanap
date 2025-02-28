import 'package:flutter/material.dart';
import 'package:upahanap_ar1/themes/app_theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false; // Toggle for dark mode switch

  // Categorized Settings List
  Map<String, List<Map<String, dynamic>>> settings = {
    "Account": [
      {"title": "Privacy", "icon": Icons.lock},
      {"title": "Security", "icon": Icons.security},
    ],
    "General": [
      {"title": "Help & Support", "icon": Icons.help},
      {"title": "About", "icon": Icons.info},
    ],
    "Actions": [
      {"title": "Logout", "icon": Icons.logout, "color": Colors.redAccent},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: AppTheme.lightTheme.appBarTheme.backgroundColor,
        foregroundColor: AppTheme.lightTheme.appBarTheme.foregroundColor,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: settings.entries.map((category) {
          return _buildCategory(category.key, category.value);
        }).toList(),
      ),
    );
  }

  // Widget for settings category
  Widget _buildCategory(String category, List<Map<String, dynamic>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category,
          style: AppTheme.lightTheme.textTheme.titleLarge,
        ),
        const SizedBox(height: 10),
        Column(
          children: items.map((setting) {
            return _buildSettingTile(setting);
          }).toList(),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  // Widget for each setting option
  Widget _buildSettingTile(Map<String, dynamic> setting) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppTheme.lightTheme.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.lightTheme.dividerColor),
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
          backgroundColor: setting.containsKey("color")
              ? setting["color"]
              : AppTheme.lightTheme.colorScheme.primary,
          child: Icon(
            setting["icon"],
            color: AppTheme.lightTheme.colorScheme.onPrimary,
          ),
        ),
        title: Text(
          setting["title"],
          style: AppTheme.lightTheme.textTheme.bodyMedium,
        ),
        trailing: setting["title"] == "Dark Mode"
            ? Switch(
                value: isDarkMode,
                activeColor: AppTheme.lightTheme.colorScheme.primary,
                onChanged: (value) {
                  setState(() {
                    isDarkMode = value;
                  });
                },
              )
            : const Icon(Icons.arrow_forward_ios,
                size: 16, color: Colors.black54),
        onTap: () {
          if (setting["title"] == "Logout") {
            // Implement logout logic
          }
        },
      ),
    );
  }
}
