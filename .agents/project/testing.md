# Project Testing

The test suite is intentionally small. It exists to lock in MVP behavior, not to chase coverage.

## What to test

- **Unit tests** (`test/features/...`)
  - `QuestionSession` lifecycle: start, advance, finish, restart.
  - Deck filtering / catalog selection logic.
  - Deterministic shuffle behavior using a seeded `Random`.
- **Widget tests** (`test/widget/...`)
  - App smoke test: app boots and shows the deck list.
  - Session flow: select deck → see first question → tap Next → reach finished state → restart or choose another deck.

## What not to test

- Theme values, colors, text styles.
- Trivial getters / passthroughs.
- Implementation details of widget internals.
- Anything explicitly Forbidden in `.agents/project/scope.md` (do not write tests for features that do not exist).

## Conventions

- Use seeded `Random(seed)` whenever shuffle order matters in a test. Never assert on real random output.
- Pump and tap with `flutter_test`'s `WidgetTester`. No external test packages.
- Prefer `findsOneWidget` / `findsNWidgets` with semantic finders (`find.text`, `find.byType`) over key-based finders unless a key is the cleanest way.
- Keep each test focused on one observable behavior. Multiple `expect`s are fine; multiple scenarios in one test are not.

## Validation

Run before considering a change done:

```bash
dart format .
flutter analyze
flutter test
```

Treat `flutter analyze` warnings as failures unless explicitly justified.
