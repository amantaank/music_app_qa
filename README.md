# music_app
All the integration tests are under this folder integration_tests/tests

I have created three "page-object" flies under lib/pages/
 -album_page.dart
 -home_page.dart
 -search_page.dart
 
I have created a data file here at lib/data/test_data.dart

A simple Music Flutter App.
- Domain-Driven Design
- Dependcy injection
- Auto-generated (Servcies, Models)
- Unit Testing
- Widgets Testing
- Hive(noSql Database)
# Flutter Version
3.3.10

## App demo

![](app.gif)

## Dependancies
-cupertino_icons: ^1.0.5
-flutter_svg: ^1.1.6
-flutter_bloc: ^8.1.1
-equatable: ^2.0.5
-injectable: ^1.5.3
-retrofit: ^3.3.1
-json_annotation: ^4.7.0
-intl: ^0.17.0
-pull_to_refresh: ^2.0.0
-hive: ^2.2.3

dev_dependencies:
  -integration_test:
    sdk: flutter
  -testreport: ^1.0.0
  -flutter_test:
    sdk: flutter
  -flutter_driver:
    sdk: flutter  
