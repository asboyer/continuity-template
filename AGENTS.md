# AGENTS.md — [Project Name]

## Stack

[One line: framework · database · deployment. TypeScript/Python/etc.]

## Commands

```bash
make check               # lint + format + test
make init-check          # verify operations files
pre-commit run --all-files
```

## Session Start

Read in order:

1. `operations/core/CORE_MISSION.md`
2. `operations/core/MASTER_MEMORY.md`
3. `operations/engineering/ROADMAP_PROGRESS.md`
4. `operations/engineering/DECISIONS_LOG.md`

## Rules & Conventions

Full rules in `.claude/rules/` — session workflow, git conventions, boundaries,
code style. Standards: `operations/engineering/ENGINEERING_STANDARDS.md`.

## Source Precedence

Latest user instruction > roadmap > master memory > older docs.
Core mission is tie-breaker for product tradeoffs.

## Session End

Update `operations/core/MASTER_MEMORY.md` (session log entry) and
`operations/engineering/ROADMAP_PROGRESS.md` (status + next). Add a Next Session
Starter note.
