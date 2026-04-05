# CLAUDE.md — [Project Name]

## Stack

[One line: framework · database · deployment. TypeScript/Python/etc.]

## Commands

```bash
make check               # lint + format + test (full quality gate)
make init-check          # verify operations files are initialized
pre-commit run --all-files
```

Commands are stack-neutral. Configure via `LINT_CMD`, `FORMAT_CHECK_CMD`, `TEST_CMD`.

## Source Precedence

Latest user instruction > roadmap > master memory > older docs.
Core mission is tie-breaker for product tradeoffs.

## Rules & Conventions

Detailed rules live in `.claude/rules/`:

- `session.md` — read order, session start/end schema
- `git.md` — commit conventions, PR checklist
- `boundaries.md` — hard limits (mission, memory, secrets)
- `code-style.md` — language and framework conventions

Operations context: `operations/` (mission, memory, roadmap, decisions).
Session commands: `/bootstrap` · `/start-session` · `/close-session`.
