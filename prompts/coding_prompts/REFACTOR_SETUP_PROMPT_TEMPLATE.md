# Coding Prompt: Refactor and Project Setup

```text
You are refactoring this codebase for maintainability and long-term scale.

READ FIRST
1) operations/engineering/CODING_STANDARDS_AND_PR_CHECKLIST.md
2) operations/engineering/ARCHITECTURE_OVERVIEW.md
3) operations/core/MASTER_MEMORY.md
4) operations/engineering/ROADMAP_PROGRESS.md

Rules:
- Use a dedicated branch.
- Commit incrementally with conventional commits.
- One major change per commit (structure, module extraction, tests, lint setup, docs).
- Never ship one massive commit.

Standards source of truth:
- operations/engineering/CODING_STANDARDS_AND_PR_CHECKLIST.md

FAILURE MODES
- If no tests exist yet: write tests for current behavior BEFORE refactoring.
- If lint is not configured: set up linting BEFORE refactoring code.
- If a refactor step breaks tests: revert and decompose into smaller steps.

Required work:
1) identify duplicated logic and extract reusable modules
2) improve modularization and single responsibility boundaries
3) add/maintain tests for refactored areas
4) enforce formatting/linting expectations
5) keep behavior parity (no regressions)

Validation after each major step:
1) run lint
2) run tests
3) confirm functionality
4) do not proceed if any check fails

Documentation updates required:
- operations/engineering/ARCHITECTURE_OVERVIEW.md
- operations/engineering/DECISIONS_LOG.md
- operations/core/MASTER_MEMORY.md
- operations/engineering/ROADMAP_PROGRESS.md

Final output:
1) list of refactors completed (with file paths)
2) validation evidence (lint and test results)
3) remaining technical debt (prioritized)
4) next refactor step (specific and actionable)
5) session log entry for MASTER_MEMORY.md

DO NOT
- Do NOT change behavior during a refactor — behavior parity is mandatory
- Do NOT refactor and add features in the same commit
- Do NOT skip writing tests before restructuring untested code
- Do NOT remove code that appears unused without verifying no runtime references
- Do NOT proceed past a failing lint or test step
```
