import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:music_app/main.dart' as app;
import '../pages/home_page.dart';
import '../pages/search_page.dart';
import '../pages/album_page.dart';
import '../data/test_data.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('Verify Album details for an Artist', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final homePage = HomePage(tester);
      final searchPage = SearchPage(tester);
      final albumPage = AlbumPage(tester);

      await homePage.openSearch();
      // Search for artist
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