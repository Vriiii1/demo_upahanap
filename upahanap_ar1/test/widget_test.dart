import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upahanap_ar1/main.dart';
import 'package:upahanap_ar1/screens/Mainscreen.dart';

void main() {
  setUp(() async {
    // ✅ Manually set initial values for SharedPreferences
    SharedPreferences.setMockInitialValues({'hasSeenOnboarding': false});
  });

  testWidgets('App loads WelcomeScreen on first launch',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        const MyApp(hasSeenOnboarding: false)); // ✅ Provide missing argument

    // Verify WelcomeScreen is shown (Look for "Get Started" button or related text)
    expect(find.text("Get Started"), findsOneWidget);
  });

  testWidgets('App loads MainScreen when onboarding is complete',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        const MyApp(hasSeenOnboarding: true)); // ✅ Provide missing argument

    // Verify MainScreen is shown
    expect(find.byType(MainScreen), findsOneWidget);
  });
}
