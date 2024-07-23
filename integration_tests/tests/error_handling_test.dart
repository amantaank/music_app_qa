import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:music_app/main.dart' as app;
import 'package:music_app/pages/home_page.dart';
import 'package:music_app/pages/search_page.dart';
import 'package:music_app/pages/album_page.dart';
import 'package:music_app/data/test_data.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('Verify error message when failing to add album to favorites', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final homePage = HomePage(tester);
      final searchPage = SearchPage(tester);
      final albumPage = AlbumPage(tester);

      // Search for artist
      await homePage.openSearch();
      await searchPage.enterSearchQuery(TestData.searchQuery);

      // Select artist
      await searchPage.selectArtist(TestData.artistName);

      // Select album to addin Favorite
      await albumPage.addAlbumToFavorites(TestData.albumNameError);
      await tester.pump(Duration(seconds: 3));

       // Verify error message is displayed
      final findsOneWidget = find.text('Sorry! we are unable to save your album ${TestData.albumNameError}');
      expect(findsOneWidget, findsOneWidget);

    });
  });
}