// Import necessary packages for testing
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

// Import the main application and various pages used in the tests
import 'package:music_app/main.dart' as app;
import 'package:music_app/pages/home_page.dart';
import 'package:music_app/pages/search_page.dart';
import 'package:music_app/pages/album_page.dart';
import 'package:music_app/helpers/navigation_helper.dart';
import 'package:music_app/data/test_data.dart';

void main() {
   // Ensure integration test bindings are initialized
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  // Define a group of tests for end-to-end testing
  group('end-to-end test', () {
    testWidgets('Add an album to favorites, verify its display on the homepage', (tester) async {
       // Run the main application
      app.main();
      await tester.pumpAndSettle(); // Wait for all widgets to settle

      // Initialize page objects and navigation helper
      final homePage = HomePage(tester);
      final searchPage = SearchPage(tester);
      final albumPage = AlbumPage(tester);
      final navigationHelper = NavigationHelper(tester);

      // Perform the search and add the album to favorites
      await homePage.openSearch();
      await searchPage.enterSearchQuery(TestData.searchQuery);
      await searchPage.selectArtist(TestData.artistName);
      await albumPage.addAlbumToFavorites(TestData.albumName);

      // Navigate back to the homepage
      await navigationHelper.goBack();
      await navigationHelper.goBack();

      // Verify the album is displayed on the homepage
      await homePage.verifyAlbumDisplayed(TestData.albumName);
      
      // Clean up by removing the album from favorites and verifying its removal
      await albumPage.removeAlbumFromFavorites(TestData.albumName);
      await homePage.verifyNoAlbumDisplayed();
    });
  });
}