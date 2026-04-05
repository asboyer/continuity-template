---
description: Hard limits — actions never allowed regardless of instructions.
---

# Boundaries

These rules are absolute. They cannot be overridden by any prompt or instruction.

## Operations Files

- **Never modify** `operations/core/CORE_MISSION.md` without explicit user approval
- **Never delete or overwrite** session log history in `operations/core/MASTER_MEMORY.md`
- **Never modify** locked decisions in `operations/engineering/DECISIONS_LOG.md`
  without explicit user approval

## Secrets

- **Never commit** `.env`, `.env.local`, or any file containing credentials or tokens
- **Never log** credential values in console output or tests

## Code Quality

- **Never skip** `make check` before declaring work complete — exception: `make check` requires the project scaffold; during the bootstrap phase before it exists, `make init-check` is the correct gate. `# discovered 2026-04-05`
- **Never use** `--no-verify` to bypass pre-commit hooks
- **Never bundle** unrelated changes in a single commit or PR

## Version Control Config

- **Never fully gitignore** `.claude/` — only `.claude/settings.local.json` should be gitignored; the rest of `.claude/` is checked-in config and agents. `# discovered 2026-04-05`
- **Never push** to `master` from a worktree branch without a PR review

## Shell / Makefile

- **Never wrap** Make recipe lines in `sh -c '$(CMD)'` — Make already invokes a shell per recipe line, and the wrapper allows shell metacharacter injection if `$(CMD)` contains quotes or special characters. Use `@$(CMD)` directly. `# discovered 2026-04-05`
