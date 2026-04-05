---
name: add-feature
description: Adds a concrete feature idea to the roadmap. Use when the user has a specific feature they want to scope, prioritize, and track — not just explore. Updates ROADMAP_PROGRESS and optionally BUSINESS_PLAN and MARKETING_PLAN.
---

# Add Feature Skill

Takes a concrete feature idea, scopes it against the mission and current
roadmap, then updates all relevant operations docs in one pass.

## Non-Negotiable Constraints

1. **CORE_MISSION.md is read-only** — alignment check only, never modify
2. **Locked decisions in DECISIONS_LOG.md are read-only** — if the feature
   implies a new tech choice, surface it and suggest `/arch-decision` first
3. **MASTER_MEMORY.md session log** — only append, never delete or overwrite
4. If the feature contradicts a CORE_MISSION product principle or anti-goal,
   surface the conflict before updating any docs

## Instructions

### Step 1: Load context

Read these files:

- `operations/engineering/ROADMAP_PROGRESS.md` (milestones, shipped, remaining)
- `operations/business/BUSINESS_PLAN.md` (product, differentiation, business
  model, KPIs)
- `operations/business/MARKETING_PLAN.md` (audience segments, campaigns,
  channels)
- `operations/core/CORE_MISSION.md` (read-only — alignment reference)
- `operations/engineering/DECISIONS_LOG.md` (check for related open decisions)

### Step 2: Define the feature

Ask the user:

- What is the feature in one sentence?
- Who is it for? (which user segment from MARKETING_PLAN, if defined)
- What problem does it solve or value does it add?
- What milestone does it belong in?

### Step 3: Alignment check

Verify against CORE_MISSION before scoping:

- Does it align with the stated product principles?
- Does it conflict with any anti-goal?

If there is a conflict, present it verbatim and ask how to proceed before
continuing.

### Step 4: Scope and prioritize

Discuss:

- What is the minimum viable version of this feature?
- What milestone does it belong in? Flag whether adding it to the active
  milestone risks scope creep (exceeding planned feature count or complexity).
- Does it require new infrastructure, a new platform integration, or a stack
  decision not yet locked? If yes → suggest `/arch-decision` first, then
  return here.
- Complexity estimate: small (hours) / medium (1–2 sessions) / large (multiple
  sessions)

### Step 5: Update ROADMAP_PROGRESS.md

Add the feature to the appropriate milestone section:

- **Current active milestone**: add to the Objectives list with scope
  description
- **Future milestone**: add to the Future Milestones section; create a new
  subsection if the milestone doesn't exist yet
- Update the "Remaining Work" list if the feature is in the active milestone

Preserve all existing content. Only add — do not reorganize or rewrite.

### Step 6: Update BUSINESS_PLAN.md (if applicable)

Only update sections that are genuinely affected:

- New product differentiator → update the differentiation section
- Changed product description → update the Product section
- New revenue implication → update the Business Model section
- Affects north star or supporting KPIs → update the KPIs section

If none of these apply, skip this step entirely.

### Step 7: Update MARKETING_PLAN.md (if applicable)

Only update if there is a genuine marketing implication:

- Shareable/viral potential → add to campaigns or create a new campaign concept
- Targets a specific audience segment → note it under that segment's description
- Affects the acquisition or retention funnel → update the Funnel section

If none of these apply, skip this step entirely.

### Step 8: Update MASTER_MEMORY.md

Append to the session log:

```
- **Date**: YYYY-MM-DD
- **Objective**: Add feature: [feature name]
- **Outcome**: completed
- **Key decisions**: [milestone placement, any scope constraints]
- **Next step**: [e.g., implement in next milestone, or resolve arch decision first]
```

### Step 9: Check for downstream effects

Ask before closing:

- Does this feature's complexity warrant its own skill file?
- Does it extend an existing feature covered by a skill? If so, update that
  skill file.
- Does it require a new tech decision? Suggest `/arch-decision`.

## Examples

**User says:** "I want to add [a new feature]"
→ Full flow, Steps 1–9

**User says:** "Let's add a [social/viral mechanic]"
→ Full flow. Updates ROADMAP (future milestone), MARKETING_PLAN campaign
section if there is a social or acquisition angle.

**User says:** "Add [a feature that conflicts with an anti-goal]"
→ Step 3 flags the anti-goal verbatim. Discuss milestone deferral or reframe
before updating any docs.

## Troubleshooting

**Feature would push active milestone past planned scope**: Surface the risk
from ROADMAP_PROGRESS. Ask the user to either defer this to a later milestone
or confirm which existing item to swap out.

**Feature needs tech not in current stack**: Pause. Suggest running
`/arch-decision` first. Resume `/add-feature` after the decision is locked
and recorded.

**Feature partially overlaps an existing planned item**: Quote the existing
item from ROADMAP_PROGRESS. Discuss whether this extends it, replaces it, or
is truly additive before updating the roadmap.
