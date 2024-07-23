// Import necessary packages for testing and widgets used in the homepage
import 'package:flutter_test/flutter_test.dart';
import 'package:music_app/presentation/widgets/appbar_search_button.dart';
import 'package:music_app/presentation/widgets/album_widget.dart';

// Define the HomePage class to encapsulate interactions with the home page
class HomePage {
  final WidgetTester tester;

  // Constructor to initialize the tester
  HomePage(this.tester);

  // Define elements on the home page for easy access
  final searchButton = find.byType(AppbarSearchButton);
  final noAlbumsText = find.text("No Albums added yet");

  // Define actions to interact with the home page
  // Open the search page by tapping the search button
  Future<void> openSearch() async {
    await tester.tap(searchButton);
    await tester.pumpAndSettle();
  }

  // Verify that a specific album is displayed on the home page
  Future<void> verifyAlbumDisplayed(String albumName) async {
    expect(find.descendant(
      of: find.byType(AlbumsWidget),
      matching: find.text(albumName),
    ), findsOneWidget);
  }
  // Verify that no album is displayed on the home page
  Future<void> verifyNoAlbumDisplayed() async {
    expect(noAlbumsText, findsOneWidget);
  }
}