# AGENTS.md — AI Agent Instructions

## Project

Stack-neutral project operations scaffold with persistent memory and LLM-assisted
development workflows.

## Commands

```bash
make check                    # All quality checks
make lint                     # Lint only
make format-check             # Format check only
make test                     # Tests only
pre-commit run --all-files    # Pre-commit hooks
```

Configure for your stack: `make check LINT_CMD="npm run lint" TEST_CMD="npm test"`

## Project Structure

- `src/` — Application source code (organize by feature/domain)
- `tests/` — Test suite (mirrors src/ structure)
- `docs/` — User-facing and developer documentation
- `scripts/` — Utility and automation scripts
- `operations/core/` — Mission and persistent memory (read every session)
- `operations/engineering/` — Standards, architecture, roadmap, decisions
- `operations/business/` — Business and marketing plans
- `prompts/` — Session prompts organized by type (start, coding, business)

## Code Style

- Conventional Commits (`feat:`, `fix:`, `refactor:`, `docs:`, `test:`, `chore:`)
- One idea per commit with clear scope
- PR descriptions: summary, why, what changed, test plan, risks, follow-ups
- Full standards: `operations/engineering/CODING_STANDARDS_AND_PR_CHECKLIST.md`

## Workflow

1. Read `operations/core/CORE_MISSION.md` and `MASTER_MEMORY.md`
2. Read `operations/engineering/ROADMAP_PROGRESS.md`
3. Implement highest-priority scoped task
4. Validate (lint/tests/manual checks)
5. Update `MASTER_MEMORY.md` and `ROADMAP_PROGRESS.md`
6. End with a Next Session Starter note

## Boundaries

- Never modify `CORE_MISSION.md` without user approval
- Never delete session log history in `MASTER_MEMORY.md`
- Never commit `.env`, credentials, or secrets
- Never skip validation before declaring work complete
- Never bundle unrelated changes in a single commit or PR
