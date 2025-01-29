# keeper

A Budget Keeper project.

## Getting Started

This project is a starting point for a Flutter application.

### Setup
This project uses Melos. 
To activate Melos, run `dart pub global activate melos`. 
Use `melos run setup` to set up the project.

OR manually:

1. Run `flutter pub get` to fetch dependencies.
2. In Data, Navigation and Feature modules run `dart run build_runner build --delete-conflicting-outputs` to generate necessary files.
3. In Core run `dart run easy_localization:generate -f keys -o locale_keys.g.dart -O lib/src/localization/generated -S resources/lang` to generate localization files.