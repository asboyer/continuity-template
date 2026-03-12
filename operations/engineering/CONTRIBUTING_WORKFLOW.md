# Contributing Workflow

## Session Start

1. Read `operations/core/CORE_MISSION.md`
2. Read `operations/core/MASTER_MEMORY.md`
3. Read `operations/engineering/ROADMAP_PROGRESS.md`
4. Read `operations/engineering/ENGINEERING_STANDARDS.md`

## Implementation Flow

1. Summarize active objective
2. Implement scoped changes
3. Validate (lint/tests/manual checks)
4. Update docs
5. Update `MASTER_MEMORY.md` and `ROADMAP_PROGRESS.md`

## Stack-Neutral Command Setup

The template Makefile is language-agnostic. Configure command hooks for your stack:

- `LINT_CMD`
- `FORMAT_CHECK_CMD`
- `TEST_CMD`

Examples:

```bash
make check \
  LINT_CMD="npm run lint" \
  FORMAT_CHECK_CMD="npm run format:check" \
  TEST_CMD="npm test"
```

## Session End Output

- What changed
- Why it changed
- Validation results
- Risks/blockers
- Next Session Starter note
