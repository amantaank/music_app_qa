// Import necessary packages for testing and UI components
import 'package:flutter_test/flutter_test.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:music_app/presentation/widgets/album_widget.dart';
import 'package:flutter/material.dart';

// Define the AlbumPage class to encapsulate interactions with the album page
class AlbumPage {
  final WidgetTester tester;
  // Constructor to initialize the tester
  AlbumPage(this.tester);

  // Define elements on the album page for easy access
  final Finder albumTitle = find.text('Album');
  final Finder tracksTitle = find.text('Believe Tracks:');
  final Finder firstTrack = find.text('1-All Around the World');
  final Finder albumDetailsPage = find.byType(Scaffold);

  // Define actions to interact with the album page
  // Add an album to favorites
  Future<void> addAlbumToFavorites(String albumName) async {
    await tester.tap(find.descendant(
      of: find.widgetWithText(AlbumsWidget, albumName),
      matching: find.byType(FavoriteButton),
    ));
    await tester.pumpAndSettle();
  }
  // Remove an album from favorites
  Future<void> removeAlbumFromFavorites(String albumName) async {
    await tester.tap(find.descendant(
      of: find.widgetWithText(AlbumsWidget, albumName),
      matching: find.byType(FavoriteButton),
    ));
    await tester.pumpAndSettle();
  }
  // Select an album to view its details
  Future<void> selectAlbum(String albumName) async {
    await tester.tap(find.text(albumName));
    await tester.pumpAndSettle();
  }
  
   // Verify the details of the selected album
  Future<void> verifyAlbumDetails(String albumName, String artistName) async {
    expect(albumDetailsPage, findsOneWidget);
    expect(find.text(albumName), findsOneWidget);
    expect(find.text(artistName), findsOneWidget);
    expect(tracksTitle, findsOneWidget);
    expect(firstTrack, findsOneWidget);
  }
}