# `.agents/`

Agent-readable instruction bundle for this repository. The root `AGENTS.md` is the entrypoint; this directory holds the deeper rules it references.

## Layout

```
.agents/
  README.md          # this file
  project/           # app-specific rules ("project law")
    scope.md
    architecture.md
    testing.md
    review-checklist.md
  skills/
    flutter/         # reusable Flutter/Dart implementation standards
      SKILL.md       # entrypoint; load this whenever editing Flutter/Dart code
      references/    # deeper topical references; load on demand
        dart-rules.md
        state-management.md
        widgets-and-ui.md
        testing.md
        anti-patterns.md
```

## How agents should use this

1. Always read the root `AGENTS.md` first.
2. Read `.agents/project/scope.md` and `.agents/project/architecture.md` before any edit.
3. Read `.agents/skills/flutter/SKILL.md` before any Flutter/Dart edit.
4. Pull individual `references/*.md` files only when the task touches that topic.
5. Long source documents and historical research live under `docs/research/`, not here. Do not treat research as active rules.

## How humans should use this

- Edit `project/*` when product scope or app-level architecture changes.
- Edit `skills/flutter/*` when general Flutter/Dart conventions for this repo change.
- Keep both terse. Reference `docs/research/*` for the long-form rationale.
- Do not duplicate the same content across multiple files. One canonical location per rule.
