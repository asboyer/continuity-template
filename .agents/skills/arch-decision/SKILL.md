---
name: arch-decision
description: Records an architecture or technology decision. Use when the user wants to change the tech stack, add a new tool or service, evaluate a technical tradeoff, or make any architectural choice that should be documented.
---

# Architecture Decision Skill

Guides a structured discussion of a technical or architectural choice, then
records the decision and updates all downstream docs in one pass.

## Non-Negotiable Constraints

1. **CORE_MISSION.md is read-only** — never modify without explicit user approval
2. **Locked decisions in DECISIONS_LOG.md are read-only** — never overwrite; only
   append new decisions or mark old ones Superseded with explicit user approval
3. **MASTER_MEMORY.md session log** — only append, never delete or overwrite history
4. If a proposed decision contradicts a locked decision, surface the conflict
   before proceeding

## Instructions

### Step 1: Load current state

Read these files:

- `operations/engineering/ARCHITECTURE_OVERVIEW.md`
- `operations/engineering/DECISIONS_LOG.md`
- `operations/engineering/ENGINEERING_STANDARDS.md`
- `operations/core/CORE_MISSION.md` (read-only — alignment reference)

Present a brief summary: current stack, any locked decisions relevant to the
topic, and any open decisions that this might resolve.

### Step 2: Understand the decision

Ask the user:

- What decision needs to be made or changed?
- What problem or opportunity is driving it?
- What alternatives have already been considered?

If it matches an open decision from `DECISIONS_LOG.md`, note that explicitly.

### Step 3: Analyze tradeoffs

For each alternative (including the user's preferred option), evaluate:

- Alignment with CORE_MISSION principles and product goals
- Does it conflict with any locked decision?
- Positive and negative consequences (complexity, cost, maintainability, scalability)

Present a structured comparison. Do not advocate for an option yet — let the
user weigh the tradeoffs.

### Step 4: Confirm the decision

Present a one-sentence summary of the recommended or preferred option. Ask:

> "Do you want to lock this as: [decision summary]? This will be recorded
> as a permanent decision."

Do not proceed to Step 5 without explicit confirmation.

### Step 5: Write the decision file

Read `operations/engineering/DECISION_TEMPLATE.md` for the template structure.
Find the next sequential number by listing `operations/engineering/decisions/`.

Create `operations/engineering/decisions/NNN_<snake_case_title>.md` using the
template. Set Status to `Accepted`.

### Step 6: Update DECISIONS_LOG.md

Append a new row to the locked decisions table:

| Date | Decision | Rationale | Alternatives | Owner | Record |
| ---- | -------- | --------- | ------------ | ----- | ------ |

If this resolves an open decision, add a note to the Open Decisions section
marking it resolved with a reference to the new decision file.

### Step 7: Update ARCHITECTURE_OVERVIEW.md

If the decision changes the tech stack, component list, data flow, or
architectural constraints, update the relevant sections. Preserve unchanged
sections exactly.

### Step 8: Update downstream files

Check whether any `.claude/skills/` or `.claude/rules/` files reference the
affected area. If so, update them to reflect the new decision. (Per session
rules: skill files that encode stale constraints must be updated in the same
session.)

### Step 9: Update MASTER_MEMORY.md

Append to the session log:

```
- **Date**: YYYY-MM-DD
- **Objective**: Record arch decision: [title]
- **Outcome**: completed
- **Key decisions**: [one-line summary of what was locked]
- **Next step**: [any follow-up action]
```

### Step 10: Suggest follow-ups

- If the decision implies feature work → suggest `/add-feature`
- If the decision changes roadmap priorities → suggest checking
  `ROADMAP_PROGRESS.md`
- If any `.claude/rules/` constraints changed → note that related skill files
  may also need updating

## Examples

**User says:** "I want to evaluate switching from [service A] to [service B]"
→ Full flow, Steps 1–10

**User says:** "Should we use [approach X] or [approach Y] for the API?"
→ Steps 1–4 (discussion only); then Steps 5–10 once the user confirms a choice

**User says:** "Let's resolve the open decision about [topic]"
→ Note: if this is a product/feature decision rather than architecture, suggest
`/add-feature` or `/business-update` instead.

## Troubleshooting

**Decision contradicts a locked decision**: Quote the locked decision verbatim.
Ask if the user wants to supersede it. If yes, update the old decision file
Status to `Superseded` and add a "Superseded by" line pointing to the new file.

**Decision affects the data model**: Also update any relevant `.claude/rules/`
files and check if any skill files reference the affected area.

**Not sure which file number to use**: List
`operations/engineering/decisions/` and use the next integer after the highest
existing file.
