// Import necessary packages for testing
import 'package:flutter_test/flutter_test.dart';

// Define the NavigationHelper class to encapsulate navigation actions
class NavigationHelper {
  final WidgetTester tester;

  // Constructor to initialize the tester
  NavigationHelper(this.tester);
  
  // Define an action to navigate back
  Future<void> goBack() async {
    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();
  }
}