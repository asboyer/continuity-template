# Coding Standards and PR Checklist

Use this file as the default engineering contract for all contributors (human or
LLM) from project inception.

---

## 1) Core Intent

We optimize for:

- readability,
- maintainability,
- modular architecture,
- safe refactoring,
- high-signal pull requests.

---

## 2) Naming and Structure Conventions

### Naming

- Variables: `snake_case`
- Functions: `snake_case`
- Python modules/files: lowercase `snake_case`
- Prefer underscores (`_`) over dashes (`-`) in file names
- Directory names: lowercase only

### Project structure

- Organize code by feature/domain, not by one giant file
- Avoid monolithic modules
- Keep responsibilities separated

---

## 3) Formatting and Linting Rules

- Indentation: 4 spaces (no tabs)
- Use language-appropriate auto-formatters
- Use markdown linting for all docs
- Use Python linting for Python code

Enforcement policy:

- Lint/format checks should run in pre-commit hooks
- Lint/format checks should run in CI/CD
- Failing lint/format checks block merge

---

## 4) Refactoring Standards

Refactor continuously with small, safe steps.

Required behaviors:

- Single responsibility per function/module
- Prefer one function type/kind per file where practical
- Decompose large functions into focused units
- Remove code smells as they are found
- Keep behavior stable while refactoring

Documentation inside code:

- Add function docstrings/comments at function start
- Document inputs, outputs, side effects, and assumptions

---

## 5) Testing and Functionality Preservation

- Add/maintain unit tests for refactored modules
- Run full test suite after each major refactor step
- Do not proceed if tests fail
- CI must run tests on every PR

Rule:

- No major refactor step is complete without passing tests

---

## 6) Branching and Audit Trail

- Create a dedicated branch for refactor/setup work
- Commit incrementally, never one massive commit
- Commit after each major milestone:
  - folder restructure
  - each extracted module
  - tests added/updated
  - lint/formatter setup
  - docs updates

---

## 7) Commit Conventions

Use Conventional Commits:

- `feat: ...`
- `fix: ...`
- `refactor: ...`
- `docs: ...`
- `test: ...`
- `chore: ...`
- `ci: ...`

Commit quality rules:

- One idea per commit
- Clear scope and intent
- Message explains what changed and why

---

## 8) Pull Request Standards

PRs must include high-quality descriptions.

Required sections:

1. Summary
2. Why this change
3. What changed (by file/module)
4. Test plan and results
5. Risks and rollback notes
6. Follow-ups (if any)

PR quality rules:

- Keep PRs focused and reviewable
- Do not bundle unrelated work
- Ensure CI is green before review

---

## 9) LLM Execution Checklist (Before Opening PR)

Every LLM/human contributor must verify:

1. Naming and structure follow this file
2. Formatter/linter checks pass
3. Tests pass
4. Docs are updated for behavior changes
5. Commits are conventional and logically scoped
6. PR description includes all required sections

---

## 10) Inception Rule

These standards should be referenced from:

- `operations/engineering/LLM_HANDOFF_PROMPT_TEMPLATE.md`
- `operations/engineering/CONTRIBUTING_WORKFLOW.md` (or equivalent)
- PR templates/checklists

This ensures standards are enforced from day one, not retrofitted later.
