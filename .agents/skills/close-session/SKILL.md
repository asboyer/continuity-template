---
name: close-session
description: Closes a work session. Commits changes, updates MASTER_MEMORY and ROADMAP_PROGRESS, runs a consistency check, and triggers the rules-updater. Run this at the end of every coding session.
---

# Close Session

You are closing a work session. Follow these steps exactly and in order.

## Step 0 — Establish ground truth

Before updating any docs, verify what is actually true:

- Run `make check` and note whether it passes
- List every file you changed this session
- Summarize in one sentence what was completed, what is partial, and what is blocked

Do not skip this step. Every status doc update depends on it being accurate.

## Step 1 — Commit all changes

Commit everything changed this session using conventional commit conventions.
Group into logical commits — one idea per commit.

If the work warrants a PR (feature, non-trivial fix), create one with a full
description per `operations/engineering/PR_TEMPLATE.md`.

If issues were uncovered, file them as GitHub issues.

## Step 2 — Update MASTER_MEMORY.md

Append a new row to the Session Log table in `operations/core/MASTER_MEMORY.md`:

| Date | Objective | Outcome | Key Decisions | Next Step |

- **Date**: today's YYYY-MM-DD
- **Objective**: what was pursued (1 sentence)
- **Outcome**: completed / partial / blocked — be specific
- **Key Decisions**: anything locked or decided, or "none"
- **Next Step**: the single first action for the next session (must match Step 4)

Also update the **Current State** and **Next Steps** sections to reflect reality
as of right now — not copy-pasted from the previous session.

## Step 3 — Update ROADMAP_PROGRESS.md

In `operations/engineering/ROADMAP_PROGRESS.md`:

1. Move anything completed this session into the **Shipped** list
2. Remove completed items from **Remaining** — only list things that are genuinely
   still to do
3. Update **Validation** to reflect current check results
4. Rewrite the **Next Session Note** from scratch — do not edit the old one in
   place. It must:
    - Accurately describe what is done vs remaining
    - Name the single first action for next session
    - List numbered steps in the correct order

## Step 4 — Consistency check

Before finishing, verify these three things say the same thing:

- `MASTER_MEMORY.md` → Next Steps item 1
- `ROADMAP_PROGRESS.md` → Next Session Note first action
- `ROADMAP_PROGRESS.md` → Remaining list

If they conflict, fix them now.

## Step 5 — Run rules-updater

Run the `rules-updater` skill. It will scan this session for new patterns,
constraints, or failure modes and write them to the appropriate `.claude/rules/`
or `.claude/skills/` file. If nothing new was learned, it will say so.

Commit any rule changes it produces.

## Step 6 — Report

Confirm:

- Commits made (list them)
- MASTER_MEMORY session log entry written (date + one-line outcome)
- ROADMAP_PROGRESS next session note updated
- Consistency check: passed or what was fixed
- Rules updated (or "nothing new")
