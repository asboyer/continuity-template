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

- **Never skip** `make check` before declaring work complete
- **Never use** `--no-verify` to bypass pre-commit hooks
- **Never bundle** unrelated changes in a single commit or PR
