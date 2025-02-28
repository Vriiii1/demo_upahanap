import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upahanap_ar1/screens/mainscreen.dart';
import 'package:upahanap_ar1/screens/onboarding_pages.dart';
import 'package:upahanap_ar1/themes/theme_provider.dart';
import 'package:upahanap_ar1/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final bool hasSeenOnboarding = await checkOnboardingStatus();
  runApp(MyApp(hasSeenOnboarding: hasSeenOnboarding));
}

// ✅ Check if user has completed onboarding
Future<bool> checkOnboardingStatus() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('hasSeenOnboarding') ?? false;
}

class MyApp extends StatelessWidget {
  final bool hasSeenOnboarding;

  const MyApp({super.key, required this.hasSeenOnboarding});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.themeMode, // ✅ Dynamic theme
            home: hasSeenOnboarding
                ? const MainScreen()
                : const OnboardingScreen(),
          );
        },
      ),
    );
  }
}
