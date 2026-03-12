# Coding Prompt: Refactor and Project Setup

```text
You are refactoring this codebase for maintainability and long-term scale.

Rules:
- Use a dedicated branch.
- Commit incrementally with conventional commits.
- One major change per commit (structure, module extraction, tests, lint setup, docs).
- Never ship one massive commit.

Standards source of truth:
- operations/engineering/CODING_STANDARDS_AND_PR_CHECKLIST.md

Required work:
1) identify duplicated logic and extract reusable modules
2) improve modularization and single responsibility boundaries
3) add/maintain tests for refactored areas
4) enforce formatting/linting expectations
5) keep behavior parity (no regressions)

Validation after each major step:
- run lint
- run tests
- confirm functionality
- do not proceed if checks fail

Documentation updates required:
- operations/engineering/ARCHITECTURE_OVERVIEW.md
- operations/engineering/DECISIONS_LOG.md
- operations/core/MASTER_MEMORY.md
- operations/engineering/ROADMAP_PROGRESS.md

Final output:
- list of refactors completed
- validation evidence
- remaining technical debt
- next refactor step
```
