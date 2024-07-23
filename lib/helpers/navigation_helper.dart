import 'package:flutter_test/flutter_test.dart';

class NavigationHelper {
  final WidgetTester tester;

  NavigationHelper(this.tester);

  Future<void> goBack() async {
    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();
  }
}