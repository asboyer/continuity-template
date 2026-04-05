Close this session by committing work and updating the continuity files.

## 0. Commit Changes

Commit all changes made this session following the project's commit conventions. If the work warrants a PR, create one with a detailed description. If issues were uncovered, file them.

## 1. Session Log — `operations/core/MASTER_MEMORY.md`

Append a new session log entry with:

- **Date**: today's date (YYYY-MM-DD)
- **Objective**: what was pursued this session
- **Outcome**: completed / partial / blocked
- **Key decisions**: any choices made or locked (write "none" if none)
- **Next step**: the first concrete action for the next session

Do NOT delete or modify any existing log entries.

## 2. Status Update — `operations/engineering/ROADMAP_PROGRESS.md`

Update:

- What shipped this session
- What remains in the current milestone
- Any new risks or blockers
- Next session starter note (copy from the session log next step)

## 3. Rules Sync

Run the `rules-updater` agent to capture any patterns, constraints, or failure modes discovered this session and write them back to `.claude/rules/` or `.claude/skills/`. If nothing new was learned, it will say so — that is fine.

## Output

Confirm:

- Session log entry written (date + outcome)
- Roadmap status updated
- Rules updated (or "no changes")
- Next session starter note

Keep it brief.
