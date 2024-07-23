import 'package:flutter_test/flutter_test.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:music_app/presentation/widgets/album_widget.dart';
import 'package:flutter/material.dart';

class AlbumPage {
  final WidgetTester tester;

  AlbumPage(this.tester);
  //Define elements
  final Finder albumTitle = find.text('Album');
  final Finder tracksTitle = find.text('Believe Tracks:');
  final Finder firstTrack = find.text('1-All Around the World');
  final Finder albumDetailsPage = find.byType(Scaffold);

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

  Future<void> selectAlbum(String albumName) async {
    await tester.tap(find.text(albumName));
    await tester.pumpAndSettle();
  }

  Future<void> verifyAlbumDetails(String albumName, String artistName) async {
    expect(albumDetailsPage, findsOneWidget);
    expect(find.text(albumName), findsOneWidget);
    expect(find.text(artistName), findsOneWidget);
    expect(tracksTitle, findsOneWidget);
    expect(firstTrack, findsOneWidget);
  }
}