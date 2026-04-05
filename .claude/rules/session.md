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
