import 'package:flutter_test/flutter_test.dart';
import 'package:music_app/presentation/widgets/appbar_search_button.dart';  // Import for AppbarSearchButton
import 'package:flutter/material.dart';  // Import for TextField

class SearchPage {
  final WidgetTester tester;

  SearchPage(this.tester);

  // Define elements
  final searchButton = find.byType(AppbarSearchButton);
  final searchField = find.byType(TextField);

  // Actions
  Future<void> enterSearchQuery(String query) async {
    await tester.tap(searchButton);  // Open the search bar if needed
    await tester.pumpAndSettle();
    await tester.enterText(searchField, query);
    await tester.pumpAndSettle();
    await tester.tap(searchButton);  // Assuming the same button is used to submit the search
    await tester.pumpAndSettle();
  }

  Future<void> selectArtist(String artistName) async {
    await tester.tap(find.text(artistName));
    await tester.pumpAndSettle();
  }
}