# Music App

### Integration Tests
All integration tests are located under the `integration_tests/tests` folder.

### Page Objects
I have created three "page-object" files under `lib/pages/`:
- `album_page.dart`
- `home_page.dart`
- `search_page.dart`

### Data File
A data file is located here: `lib/data/test_data.dart`

## Flutter Version
3.3.10

## App Demo

![App Demo](app.gif)

## Dependencies

```yaml
dependencies:
  cupertino_icons: ^1.0.5
  flutter_svg: ^1.1.6
  flutter_bloc: ^8.1.1
  equatable: ^2.0.5
  injectable: ^1.5.3
  retrofit: ^3.3.1
  json_annotation: ^4.7.0
  intl: ^0.17.0
  pull_to_refresh: ^2.0.0
  hive: ^2.2.3

dev_dependencies:
  integration_test:
    sdk: flutter
  testreport: ^1.0.0
  flutter_test:
    sdk: flutter
  flutter_driver:
    sdk: flutter  
