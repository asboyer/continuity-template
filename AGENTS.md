# AGENTS.md — [Project Name]

This file provides minimal context for non-Claude agents (Cursor, Copilot, etc.).
For full rules and conventions, see `CLAUDE.md` and `.claude/rules/`.

## Stack

[One line: framework · database · deployment. TypeScript/Python/etc.]

## Commands

```bash
make check               # lint + format + test (includes ops file validation)
make init-check          # verify operations files only
pre-commit run --all-files
```

## Session Start

Read order is defined in `.claude/rules/session.md`. Use `/start-session` to
automate it.

## Rules & Conventions

All rules live in `.claude/rules/`:

- `session.md` — session workflow, read order, log schema
- `git.md` — commit conventions, PR checklist
- `boundaries.md` — hard limits (mission, memory, secrets)
- `code-style.md` — language/framework conventions

Operations context: `operations/` (mission, memory, roadmap, decisions).

## Source Precedence

Latest user instruction > roadmap > master memory > older docs.
Core mission is tie-breaker for product tradeoffs.
