# Project Architecture

Feature-first Flutter layout with no service layer, no domain layer, and no shared utility dumping grounds. The session is a small pure Dart model; everything else is widgets.

## Folder layout

```
lib/
  main.dart                 # entrypoint; runApp(const GenuineGossipApp())
  app/
    genuine_gossip_app.dart # MaterialApp + theme + initial route
  ui/
    app_theme.dart          # light Material 3 ThemeData
  features/
    questions/              # Question + DeckDefinition models, catalog, filters
      question.dart
      deck_definition.dart
      deck_catalog.dart
      question_catalog.dart
    deck_selection/         # deck list screen
      deck_list_screen.dart
      deck_card.dart
    session/                # pure Dart session model + session screen
      question_session.dart
      session_screen.dart
      question_card.dart
test/
  features/
    questions/              # deck/catalog/filter tests
    session/                # QuestionSession logic tests
  widget/
    app_smoke_test.dart
    session_flow_test.dart
```

## Rules

- **Local UI/session state** belongs in the owning widget via `StatefulWidget` + `setState`. Do not introduce shared state primitives.
- **Pure Dart for session logic.** `QuestionSession` is immutable; mutation is modeled by returning a new instance from `next()` / `restart()`.
- **No service layer.** There is no async data source. Catalogs are hardcoded `const` values in Dart.
- **No global app state.** Pass the selected `DeckDefinition` into the session screen via constructor.
- **Small widgets.** Prefer composition over giant `build()` methods. Extract a widget when reused or when a `build()` becomes hard to scan.
- **Feature-scoped widgets.** A widget used by exactly one feature lives inside that feature folder. Promote to `lib/ui/` only on real reuse across features.
- **No new top-level folders.** Do not add `lib/core/`, `lib/utils/`, `lib/helpers/`, `lib/common/`, `lib/services/`, or `lib/managers/`. If a piece of code does not fit `app/`, `ui/`, or a `features/<name>/` folder, the design is wrong, not the layout.
- **No new packages.** `pubspec.yaml` lists `flutter`, `flutter_test`, and `flutter_lints`. Adding anything else requires an explicit instruction.
- **Material 3, fixed light theme.** Theming flows from `lib/ui/app_theme.dart`. Do not hardcode colors or text styles in widgets when a theme token is available.
- **Plain `Navigator`** for transitions between deck list and session. No named routes, no router package.

## When in doubt

Choose the smaller change:

- local state before shared state,
- direct widget before reusable widget,
- inline value before constant before helper,
- one good test before many shallow tests.
