---
description: Session start and end workflow — what to read, how to log, when to update docs.
---

# Session Rules

## Session Start — Read Order

Read these files in order before doing anything else:

1. `operations/core/CORE_MISSION.md`
2. `operations/core/MASTER_MEMORY.md`
3. `operations/engineering/ROADMAP_PROGRESS.md`
4. `operations/engineering/ENGINEERING_STANDARDS.md`
5. `operations/engineering/ARCHITECTURE_OVERVIEW.md`
6. `operations/engineering/DECISIONS_LOG.md`

Or use `/start-session` to automate this.

## Session Start — Branching Check

After reading context, before writing any code, ask:

> "Is this session a feature, fix, or non-trivial change?"

- **Yes** → create a branch and confirm it with the user before doing anything else:

    ```bash
    git checkout -b feat/<name>   # or fix/<name>, chore/<name>
    ```

    All work goes on the branch. Session ends with a PR, not a direct push to master.

- **No** (docs-only, ops files, config tweaks, hotfixes) → committing to master is acceptable, but confirm with the user if unsure.

Never start writing code on master and migrate to a branch mid-session.

## Session Log Entry Schema

Every entry in `MASTER_MEMORY.md` must include:

- **Date**: YYYY-MM-DD
- **Objective**: what was pursued this session
- **Outcome**: completed / partial / blocked
- **Key decisions**: any choices made or locked
- **Next step**: the first action for the next session

## Session End — Always

1. Update `operations/core/MASTER_MEMORY.md` with a session log entry
2. Update `operations/engineering/ROADMAP_PROGRESS.md` (status + next)
3. Write a concise Next Session Starter note

Use `/close-session` to automate this.

## Bootstrap Sessions

For any session during the initial bootstrap phase, also review
`operations/engineering/BOOTSTRAP_CHECKLIST.md` before declaring work complete.

## Hook vs. Instruction Enforcement

- `PostToolUse` hooks in `.claude/settings.json` run deterministically on every matching tool call; CLAUDE.md instructions are advisory and may be skipped. Any behavior that must happen 100% of the time (e.g., auto-format, lint on save) belongs in a hook, never in a CLAUDE.md instruction. `# discovered 2026-04-05`
