import 'package:flutter_test/flutter_test.dart';
import 'package:music_app/presentation/widgets/appbar_search_button.dart';
import 'package:music_app/presentation/widgets/album_widget.dart';

class HomePage {
  final WidgetTester tester;

  HomePage(this.tester);

  // Define elements
  final searchButton = find.byType(AppbarSearchButton);
  final noAlbumsText = find.text("No Albums added yet");

  // Actions
  Future<void> openSearch() async {
    await tester.tap(searchButton);
    await tester.pumpAndSettle();
  }

  Future<void> verifyAlbumDisplayed(String albumName) async {
    expect(find.descendant(
      of: find.byType(AlbumsWidget),
      matching: find.text(albumName),
    ), findsOneWidget);
  }

  Future<void> verifyNoAlbumDisplayed() async {
    expect(noAlbumsText, findsOneWidget);
  }
}