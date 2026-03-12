# Engineering Standards

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

Default engineering posture:

- prefer boring, well-understood patterns over novelty,
- favor explicitness over clever abstraction,
- keep code and docs easy for a fresh LLM or developer to continue,
- choose conventions that are idiomatic for the active stack, not forced across stacks.

---

## 2) Naming and Structure Conventions

### Naming

- Follow the dominant naming conventions of the active language/framework
- Keep names descriptive and stable across layers
- Prefer consistency within a module over personal style preferences
- Use lowercase directory names unless the stack has a strong competing convention

Preferred defaults when the stack allows flexibility:

- Variables/functions/modules: `snake_case`
- File names: lowercase with separators that match stack norms
- Public type/class names: `PascalCase`
- Constants: `UPPER_SNAKE_CASE`

### Project structure

- Organize code by feature/domain, not by one giant file
- Avoid monolithic modules
- Keep responsibilities separated
- Keep the top-level layout simple enough that a new contributor can navigate it quickly

---

## 3) Formatting and Linting Rules

- Indentation: 4 spaces (no tabs)
- Use language-appropriate auto-formatters
- Use markdown linting for all docs
- Use the primary linter for the active stack

Preferred defaults:

- 4-space indentation for most source and documentation files
- Tabs only where required by tooling, such as Makefiles
- One formatter and one linter should be the source of truth for each language

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

- Document public interfaces, non-obvious behavior, side effects, and assumptions
- Add comments only where intent is not obvious from the code itself
- Prefer concise module- or function-level documentation over noisy inline commentary

---

## 5) Testing and Functionality Preservation

- Add/maintain unit tests for refactored modules
- Run full test suite after each major refactor step
- Do not proceed if tests fail
- CI must run tests on every PR
- Add integration or end-to-end coverage where unit tests alone do not protect behavior

Rule:

- No major refactor step is complete without passing tests

---

## 6) Branching and Audit Trail

- Default branch: `master`
- Create a dedicated branch for refactor/setup work
- Commit incrementally, never one massive commit
- Commit after each major milestone: structure change, extracted module, tests,
  tooling setup, or documentation update

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
- Include enough context that a reviewer can validate intent without digging through chat history

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

- `prompts/coding_prompts/LLM_HANDOFF_PROMPT_TEMPLATE.md`
- `operations/engineering/CONTRIBUTING_WORKFLOW.md`
- `CLAUDE.md` and `AGENTS.md`
- PR templates/checklists

This ensures standards are enforced from day one, not retrofitted later.
