// Import necessary packages for testing and UI components
import 'package:flutter_test/flutter_test.dart';
import 'package:music_app/presentation/widgets/appbar_search_button.dart';  // Import for AppbarSearchButton
import 'package:flutter/material.dart';  // Import for TextField

// Define the SearchPage class to encapsulate interactions with the search page
class SearchPage {
  final WidgetTester tester;

  // Constructor to initialize the tester
  SearchPage(this.tester);

  // Define elements on the search page for easy access
  final searchButton = find.byType(AppbarSearchButton);
  final searchField = find.byType(TextField);

  // Define actions to interact with the search page
  // Enter a search query into the search field
  Future<void> enterSearchQuery(String query) async {
    await tester.tap(searchButton);  
    await tester.pumpAndSettle();
    await tester.enterText(searchField, query);
    await tester.pumpAndSettle();
    await tester.tap(searchButton);  
    await tester.pumpAndSettle();
  }
  
  // Select an artist from the search results
  Future<void> selectArtist(String artistName) async {
    await tester.tap(find.text(artistName));
    await tester.pumpAndSettle();
  }
}