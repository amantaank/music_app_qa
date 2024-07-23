// Import necessary packages for testing
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

// Import the main application and various pages used in the tests
import 'package:music_app/main.dart' as app;
import 'package:music_app/pages/home_page.dart';
import 'package:music_app/pages/search_page.dart';
import 'package:music_app/pages/album_page.dart';
import 'package:music_app/data/test_data.dart';

void main() {
  // Ensure integration test bindings are initialized
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // Define a group of tests for end-to-end testing
  group('end-to-end test', () {
    // Define a test that verifies album details for an artist
    testWidgets('Verify Album details for an Artist', (tester) async {
      // Run the main application
      app.main();
      await tester.pumpAndSettle(); // Wait for all widgets to settle

      // Initialize page objects
      final homePage = HomePage(tester);
      final searchPage = SearchPage(tester);
      final albumPage = AlbumPage(tester);

      // Perform the search and verify album details
      await homePage.openSearch();
      await searchPage.enterSearchQuery(TestData.searchQuery);

      // Select artist
      await searchPage.selectArtist(TestData.artistName);

      // Select album and verify details
      await albumPage.selectAlbum(TestData.albumName);
      await tester.pump(Duration(seconds: 3));
      await albumPage.verifyAlbumDetails(TestData.albumName, TestData.artistName);

    });
  });
}