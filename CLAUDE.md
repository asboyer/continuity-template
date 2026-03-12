# CLAUDE.md — Project Template

## Overview

This is a project operations scaffold for bootstrapping new software projects
with persistent memory, engineering governance, and LLM-assisted development
workflows. It is stack-neutral by default.

## Directory Structure

```
operations/
  core/         — Mission, persistent memory (read every session)
  engineering/  — Standards, architecture, roadmap, decisions, templates
  business/     — Business plan, marketing plan
prompts/
  start/            — First-session bootstrap prompt
  coding_prompts/   — Implementation and refactor session prompts
  business_prompts/ — Strategy, roadmap, and marketing prompts
```

## Key Commands

```bash
make check                    # Run all quality checks (lint + format + test)
make lint                     # Lint only
make test                     # Test only
pre-commit run --all-files    # Run all pre-commit hooks
```

Commands are stack-neutral. Configure via `LINT_CMD`, `FORMAT_CHECK_CMD`, `TEST_CMD`.

## Session Start — Read Order

1. `operations/core/CORE_MISSION.md`
2. `operations/core/MASTER_MEMORY.md`
3. `operations/engineering/ROADMAP_PROGRESS.md`
4. `operations/engineering/CODING_STANDARDS_AND_PR_CHECKLIST.md`
5. `operations/engineering/ARCHITECTURE_OVERVIEW.md`
6. `operations/engineering/DECISIONS_LOG.md`

## Coding Conventions

- Conventional Commits: `feat:`, `fix:`, `refactor:`, `docs:`, `test:`, `chore:`, `ci:`
- One idea per commit; clear scope and intent
- PRs must include: summary, why, what changed, test plan, risks, follow-ups
- Full standards: `operations/engineering/CODING_STANDARDS_AND_PR_CHECKLIST.md`

## Source Precedence

Latest explicit user instruction > roadmap > master memory > older docs.
Core mission is tie-breaker for product-direction tradeoffs.

## Session End — Always

1. Update `operations/core/MASTER_MEMORY.md` (session log entry)
2. Update `operations/engineering/ROADMAP_PROGRESS.md` (status + next)
3. Add a concise Next Session Starter note

## Boundaries

- Do NOT modify `operations/core/CORE_MISSION.md` without explicit user approval
- Do NOT delete or overwrite session log history in `MASTER_MEMORY.md`
- Do NOT commit `.env`, credentials, or secrets
- Do NOT bundle unrelated changes in a single PR
- Do NOT skip lint/test validation before declaring work complete

## Prompt Reference

See `prompts/PROMPT_USAGE_ORDER.md` for the full prompt sequencing guide.
