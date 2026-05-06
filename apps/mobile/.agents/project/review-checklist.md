# Project Review Checklist

Run through these before declaring a change done. If any answer is "no" or "unsure", fix it or surface it.

## Scope

- [ ] Change stays inside `.agents/project/scope.md` Allowed list.
- [ ] No Forbidden item was introduced (no backend, persistence, JSON, packages, code generation, etc.).
- [ ] No new top-level `lib/` folder beyond `app/`, `ui/`, `features/`.
- [ ] No new entries in `pubspec.yaml` `dependencies` or `dev_dependencies`.

## Architecture

- [ ] State ownership is obvious; nothing global was introduced.
- [ ] Session logic stayed in `QuestionSession`, not in widgets.
- [ ] Widgets are presentation-focused; no business logic leaked into `build()`.
- [ ] No async work is created inside a `build()` method.
- [ ] Feature-scoped widgets stayed inside their feature; only genuinely shared UI moved to `lib/ui/`.

## Code style

- [ ] Names follow Dart conventions (`lower_snake_case.dart` files, `UpperCamelCase` types, `lowerCamelCase` members).
- [ ] `final` / `const` used by default; explicit types for public APIs.
- [ ] No vague `helper` / `util` / `manager` / `service` names introduced.
- [ ] No broad `catch` without an `on` clause.
- [ ] Theme tokens used instead of hardcoded colors / text styles.

## Tests

- [ ] Behavior changes are covered by unit or widget tests at the right level.
- [ ] Shuffle-dependent tests use a seeded `Random`.
- [ ] No tests added for Forbidden features.

## Validation

- [ ] `dart format .` clean.
- [ ] `flutter analyze` clean.
- [ ] `flutter test` green.

## Communication

- [ ] If scope was unclear, the agent surfaced the ambiguity instead of silently expanding it.
- [ ] PR / commit message describes the change and references the affected feature folder.
