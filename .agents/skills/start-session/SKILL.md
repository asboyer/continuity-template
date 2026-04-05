---
name: start-session
description: Starts a new work session. Loads all project context, verifies actual repo state, and produces a session brief before any implementation begins. Run this at the start of every coding session.
---

# Start Session

You are starting a new work session. Follow these steps exactly.

## Step 1 — Load context (read in order)

1. `operations/core/CORE_MISSION.md`
2. `operations/core/MASTER_MEMORY.md`
3. `operations/engineering/ROADMAP_PROGRESS.md`
4. `operations/engineering/ENGINEERING_STANDARDS.md`
5. `operations/engineering/ARCHITECTURE_OVERVIEW.md`
6. `operations/engineering/DECISIONS_LOG.md`

## Step 2 — Verify actual repo state

Do not trust the docs alone. Run these checks and note the results:

- `make check` — does it pass? What phase (pre-scaffold or full toolchain)?
- What does `git log --oneline -5` show? (confirms last real work done)
- Read `operations/engineering/BOOTSTRAP_CHECKLIST.md` — are there unchecked
  items that are actually done based on what you just verified?

If you find stale checklist items or inconsistencies between docs and actual
state, flag them explicitly before summarizing.

## Step 3 — Output the session brief

Report exactly:

**Project:** [one-sentence summary of what this is]

**Milestone:** [ID and name] — [status: complete / partial / blocked]

**Last session** (from session log): [date] — [one sentence on what was done]

**Verified repo state:** [what make check returned, last commit]

**Inconsistencies found:** [anything the docs claim that contradicts actual state, or "none"]

**First action this session:** [single concrete task — a command to run, a file to create, a decision to make]

**Blockers:** [anything that must be resolved before that first action, or "none"]

---

Then ask: "Ready to start, or do you want to adjust the focus?"

Do not begin any implementation until the user confirms.
