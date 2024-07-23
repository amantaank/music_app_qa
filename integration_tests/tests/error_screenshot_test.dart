import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:music_app/main.dart' as app;
import '../pages/home_page.dart';
import '../pages/search_page.dart';
import '../pages/album_page.dart';
import '../data/test_data.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized() as IntegrationTestWidgetsFlutterBinding;

  group('end-to-end test', () {
    testWidgets('Verify Album details for an Artist', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final homePage = HomePage(tester);
      final searchPage = SearchPage(tester);
      final albumPage = AlbumPage(tester);

      await homePage.openSearch();
      await tester.pumpAndSettle();

      // Search for artist
      await searchPage.enterSearchQuery(TestData.searchQuery);
      await tester.pumpAndSettle();

      // Select artist
      await searchPage.selectArtist(TestData.artistName);
      await tester.pumpAndSettle();

      // Try to find and select album
      final albumFinder = find.text(TestData.albumName);
      if (albumFinder.evaluate().isEmpty) {
        // Album not found, take a screenshot
        final screenshotPath = 'test/screenshots/album_not_found_screenshot.png';

        // Ensure the screenshots directory exists
        final screenshotDir = Directory('test/screenshots');
        if (!screenshotDir.existsSync()) {
          screenshotDir.createSync(recursive: true);
        }

        await binding.takeScreenshot(screenshotPath);
        print('Screenshot captured: $screenshotPath');

        // Fail the test if the album is not found
        fail('Album "${TestData.albumName}" not found for artist "${TestData.artistName}". Screenshot saved at $screenshotPath.');
      } else {
        // Select album and verify details
        await albumPage.selectAlbum(TestData.albumName);
        await tester.pump(Duration(seconds: 3));
        await albumPage.verifyAlbumDetails(TestData.albumName, TestData.artistName);
      }
    });
  });
}
