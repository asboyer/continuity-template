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

## Pre-commit Config

- All hook configuration in `.pre-commit-config.yaml` must be nested under the correct `repos` → `hooks` → entry; a stray top-level YAML key (e.g., `args:` outside a hook block) causes a silent parse error that breaks every commit. `# discovered 2026-04-05`
- The `trailing-whitespace` hook catches spaces in shell script strings and heredocs. Strip with `perl -i -pe 's/[ \t]+$//'`; macOS `sed -i ''` with `s/[[:space:]]*$//` does not catch all cases reliably. `# discovered 2026-04-05`

## Push / Sync

- Always `git pull --rebase` before pushing when a PR has merged to the remote since your last pull — a direct push will be rejected with "remote has diverged". `# discovered 2026-04-05`

## CI / GitHub Actions

- Dependabot PRs never receive repository secrets — GitHub withholds them as a security restriction, so any job that requires secrets (e.g., OIDC token exchange, API calls) will always fail on Dependabot PRs. Guard with `if: github.actor != 'dependabot[bot]'`. `# discovered 2026-04-05`
