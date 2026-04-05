# CLAUDE.md — [Project Name]

## Stack

[One line: framework · database · deployment. TypeScript/Python/etc.]

## Commands

```bash
make check               # phase-aware quality gate (pre-scaffold: init-check + pre-commit; post-scaffold: full lint + format + test)
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

Reusable workflow skills live in `.claude/skills/`:

- `add-feature/` — scope a feature against the mission and roadmap
- `arch-decision/` — evaluate a tech tradeoff and record the decision
- `brainstorm/` — read-only ideation grounded in all ops context
- `business-update/` — update business and marketing plan docs

Operations context: `operations/` (mission, memory, roadmap, decisions).
Session commands: `/bootstrap` · `/start-session` · `/close-session`.
