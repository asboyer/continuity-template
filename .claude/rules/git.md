---
description: Git commit conventions, branching rules, and PR standards.
---

# Git Rules

## Commit Conventions

Use Conventional Commits. One idea per commit.

```
feat:     new user-facing feature
fix:      bug fix
refactor: restructure without behavior change
test:     add or update tests
docs:     documentation only
chore:    tooling, deps, config
ci:       CI/CD changes
```

## Branching

- `master` (or `main`) — always deployable
- `feat/<name>` — new features
- `fix/<name>` — bug fixes
- `chore/<name>` — tooling, config, deps

Prefer worktrees for feature branches: `claude --worktree feat/<name>`.

## PR Standards

Every PR must include:

- **Summary**: one-sentence description of what changed
- **Why**: motivation or issue reference
- **What changed**: list of files/components affected
- **Test plan**: how to verify
- **Risks**: anything that could break or regress
- **Follow-ups**: known gaps or deferred work

Use `operations/engineering/PR_TEMPLATE.md` as the template.

## Validation Before Merging

```bash
make check   # must pass clean
```

Never skip this. Never use `--no-verify`.
