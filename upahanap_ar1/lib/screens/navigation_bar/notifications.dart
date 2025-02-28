import 'package:flutter/material.dart';
import 'package:upahanap_ar1/themes/app_theme.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  Map<String, List<Map<String, String>>> notifications = {
    "Mails": [
      {
        "title": "New Email",
        "body": "You have a new message from HR.",
        "time": "2m ago"
      },
      {
        "title": "Newsletter",
        "body": "This month's updates are here!",
        "time": "1h ago"
      },
    ],
    "Updates": [
      {
        "title": "App Update",
        "body": "Version 2.0 is available!",
        "time": "10m ago"
      },
      {
        "title": "Feature Release",
        "body": "New features have been added.",
        "time": "2h ago"
      },
    ],
    "Reminders": [
      {
        "title": "Meeting Reminder",
        "body": "Your meeting starts at 3 PM.",
        "time": "3h ago"
      },
      {
        "title": "Task Deadline",
        "body": "Submit your report by 5 PM.",
        "time": "4h ago"
      },
    ],
    "Alerts": [
      {
        "title": "Security Alert",
        "body": "Unusual login detected.",
        "time": "5h ago"
      },
      {
        "title": "System Maintenance",
        "body": "Scheduled downtime at midnight.",
        "time": "6h ago"
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        centerTitle: true,
        backgroundColor: theme.appBarTheme.backgroundColor,
        elevation: 0,
      ),
      body: Container(
        color: theme.colorScheme.surface,
        child: notifications.isEmpty
            ? Center(
                child: Text(
                  "No new notifications",
                  style: theme.textTheme.bodyMedium,
                ),
              )
            : ListView(
                padding: const EdgeInsets.all(20),
                children: notifications.entries.map((category) {
                  return _buildCategory(category.key, category.value, theme);
                }).toList(),
              ),
      ),
    );
  }

  Widget _buildCategory(
      String category, List<Map<String, String>> items, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category,
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 10),
        Column(
          children: items.map((notification) {
            return Dismissible(
              key: Key(notification["title"]!),
              direction: DismissDirection.endToStart,
              background: Container(
                padding: const EdgeInsets.only(right: 20),
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              onDismissed: (direction) {
                setState(() {
                  notifications[category]!.remove(notification);
                  if (notifications[category]!.isEmpty) {
                    notifications.remove(category);
                  }
                });
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: theme.dividerColor),
                  boxShadow: [
                    BoxShadow(
                      color: theme.shadowColor.withOpacity(0.2),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: _getNotificationColor(category),
                    child: Icon(
                      _getNotificationIcon(category),
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    notification["title"]!,
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    notification["body"]!,
                    style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withOpacity(0.7)),
                  ),
                  trailing: Text(
                    notification["time"]!,
                    style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withOpacity(0.6)),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  IconData _getNotificationIcon(String category) {
    switch (category) {
      case "Mails":
        return Icons.email;
      case "Updates":
        return Icons.system_update;
      case "Reminders":
        return Icons.notifications_active;
      case "Alerts":
        return Icons.warning;
      default:
        return Icons.notifications;
    }
  }

  Color _getNotificationColor(String category) {
    switch (category) {
      case "Mails":
        return Colors.blue;
      case "Updates":
        return Colors.orange;
      case "Reminders":
        return Colors.purple;
      case "Alerts":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
