# Questions

A small offline Flutter app for iOS and Android that shows relationship and conversation prompt cards. Open the app, pick a deck, and tap through one question at a time.

## MVP scope (v0)

- Flutter mobile app for iOS and Android.
- Hardcoded dummy questions (no JSON, no backend).
- Six predefined decks: Shuffle Everything, Warm & Light, Deep Talk, Playful Energy, Relationship Check-in, Intimate.
- Deck selection screen + session screen showing one question at a time.
- Each session shuffles its deck once at start; no question repeats within a session.
- Finished state with restart and choose-another-deck actions.
- Fixed light Material 3 theme.
- Local widget state + a small pure Dart session model (no state management library).

## Explicit non-goals (intentionally not included)

- Backend, database, auth, remote config, remote content updates.
- JSON/asset content loading.
- Favorites, history, saved answers, user profiles, settings screen.
- Push notifications, analytics, crash reporting.
- Dark mode toggle.
- Complex routing or deep links.
- Code generation, service locators, or third-party state libraries.

The catalog is intentionally hardcoded in Dart source code (`lib/features/questions/question_catalog.dart`) using placeholder content suitable for the MVP.

## Project layout

```
lib/
  main.dart
  app/questions_app.dart
  ui/app_theme.dart
  features/
    questions/        # Question + deck models, catalog, filters
    deck_selection/   # Deck list screen + deck card widget
    session/          # Pure Dart session model + session screen + question card
test/
  features/questions/ # Deck catalog and filter tests
  features/session/   # Session logic tests
  widget/             # App smoke + session flow widget tests
```

## Commands

```bash
flutter pub get
dart format .
flutter analyze
flutter test
flutter run
flutter build appbundle
flutter build ipa
```

## App identity

- Display name: `Questions`
- Android `applicationId`: `com.sitek94.questionsapp`
- iOS bundle ID: `com.sitek94.questionsapp`
- Version: `1.0.0+1`
