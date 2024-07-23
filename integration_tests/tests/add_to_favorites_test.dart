import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:music_app/main.dart' as app;
import 'package:music_app/pages/home_page.dart';
import 'package:music_app/pages/search_page.dart';
import 'package:music_app/pages/album_page.dart';
import 'package:music_app/helpers/navigation_helper.dart';
import 'package:music_app/data/test_data.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('Add an album to favorites, verify its display on the homepage', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final homePage = HomePage(tester);
      final searchPage = SearchPage(tester);
      final albumPage = AlbumPage(tester);
      final navigationHelper = NavigationHelper(tester);

      await homePage.openSearch();
      await searchPage.enterSearchQuery(TestData.searchQuery);
      await searchPage.selectArtist(TestData.artistName);
      await albumPage.addAlbumToFavorites(TestData.albumName);

      await navigationHelper.goBack();
      await navigationHelper.goBack();

      await homePage.verifyAlbumDisplayed(TestData.albumName);

      await albumPage.removeAlbumFromFavorites(TestData.albumName);
      await homePage.verifyNoAlbumDisplayed();
    });
  });
}