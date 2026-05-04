# Project Scope

This is a minimal **offline Flutter questions app** for iOS and Android. Two screens, hardcoded content, no network, no persistence.

Scope decisions here override anything in `docs/research/*`. If a research document suggests a feature that is not listed as Allowed below, it is Forbidden by default.

## Allowed (in MVP v0)

- Flutter mobile app for iOS and Android.
- Hardcoded dummy questions in Dart source code (`lib/features/questions/question_catalog.dart`).
- Six predefined decks (Shuffle Everything, Warm & Light, Deep Talk, Playful Energy, Relationship Check-in, Intimate) defined in Dart.
- Deck selection screen.
- Session screen showing one question at a time.
- Tap Next to advance.
- Each session shuffles its deck once at start; no question repeats within a session.
- Finished state with Restart and Choose another deck actions.
- Local in-memory state only.
- Pure Dart `QuestionSession` model holding the shuffled order and current index.
- Fixed light Material 3 theme.
- Plain `Navigator` for navigation between the two screens.
- Unit tests for deck filtering and session logic.
- Widget tests for app smoke + session flow.

## Forbidden unless explicitly requested

- Backend, API, server, cloud function.
- Database, key-value store, secure storage, file I/O.
- Local persistence (`shared_preferences`, `hive`, `sqflite`, `drift`, etc.).
- JSON or other asset content loading. Catalog stays hardcoded in Dart.
- Auth, accounts, profiles, sign-in gates.
- Analytics, telemetry, crash reporting SDKs.
- Push notifications, deep links.
- Remote config, remote content updates, feature flags.
- Favorites, history, saved answers, "seen" tracking across sessions.
- Settings screen, dark-mode toggle, theme switcher.
- State-management packages (Provider, Riverpod, Bloc, GetX, MobX, etc.).
- Routing packages (`go_router`, `auto_route`, etc.).
- Code generation (`build_runner`, `json_serializable`, `freezed`, etc.).
- Service locators (`get_it`, etc.).
- Generic top-level `core/`, `utils/`, `helpers/`, `common/`, `services/`, or `managers/` folders.
- New dependencies of any kind that are not already in `pubspec.yaml`.

## How to handle scope creep

If a task or suggestion implies a Forbidden item, do **not** silently implement it. Either:

1. Complete only the Allowed portion, or
2. Stop and surface that the request is out of MVP scope.

Scope expansion requires an explicit instruction from the user.
