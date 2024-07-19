import 'package:flutter_test/flutter_test.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:music_app/presentation/widgets/album_widget.dart';

class AlbumPage {
  final WidgetTester tester;

  AlbumPage(this.tester);

  // Actions
  Future<void> addAlbumToFavorites(String albumName) async {
    await tester.tap(find.descendant(
      of: find.widgetWithText(AlbumsWidget, albumName),
      matching: find.byType(FavoriteButton),
    ));
    await tester.pumpAndSettle();
  }

  Future<void> removeAlbumFromFavorites(String albumName) async {
    await tester.tap(find.descendant(
      of: find.widgetWithText(AlbumsWidget, albumName),
      matching: find.byType(FavoriteButton),
    ));
    await tester.pumpAndSettle();
  }
}