---
name: business-update
description: Updates business strategy, pricing, positioning, audience segments, or marketing campaigns. Use when the user wants to change something in the business or marketing plan that is not tied to a specific feature. For feature-specific changes, use /add-feature instead.
---

# Business & Marketing Update Skill

Handles targeted updates to business strategy and marketing plans — pricing,
positioning, audience segments, competitive landscape, campaigns, financials.
Keeps changes scoped and surfaces conflicts with the core mission before
writing anything.

## Non-Negotiable Constraints

1. **CORE_MISSION.md is read-only** — if a proposed change contradicts a
   mission principle or anti-goal, surface the conflict before proceeding
2. **MASTER_MEMORY.md session log** — only append, never delete or overwrite
3. If the change implies a new product feature → redirect to `/add-feature`
4. If the change implies a new tech or infrastructure decision → redirect to
   `/arch-decision`

## Instructions

### Step 1: Load context

Read these files:

- `operations/business/BUSINESS_PLAN.md`
- `operations/business/MARKETING_PLAN.md`
- `operations/core/CORE_MISSION.md` (read-only — alignment reference)
- `operations/engineering/ROADMAP_PROGRESS.md` (current stage for context)

### Step 2: Identify the scope of change

Ask:

- What area do you want to update? (pricing, audience segments, positioning,
  competitive landscape, channels, campaigns, financial assumptions, KPIs,
  risks)
- Is this a refinement of what's already written, or a strategic pivot?

If the answer sounds feature-specific ("I want to add feature X"),
redirect: "This sounds like a feature change — want me to run `/add-feature`
instead?"

### Step 3: Discuss the change

For each proposed change:

- Quote the current state from the relevant plan section
- State the proposed new state
- Check alignment with CORE_MISSION principles and anti-goals
- Identify any ripple effects in other sections (e.g., pricing change →
  financial assumptions; audience change → channel strategy and campaign plan)

### Step 4: Confirm changes

Present a diff-style summary of all proposed edits:

```
BUSINESS_PLAN.md — [Section name]:
  Current:  [quote]
  Proposed: [new text]

MARKETING_PLAN.md — [Section name]:
  Current:  [quote]
  Proposed: [new text]
```

Ask: "Do you want me to apply these changes?"

Do not write anything before this confirmation.

### Step 5: Update BUSINESS_PLAN.md

Apply confirmed changes to the relevant sections. Preserve all unchanged
sections exactly — do not rewrite, reorder, or reformat unrelated content.

### Step 6: Update MARKETING_PLAN.md

Apply confirmed changes to the relevant sections. Same preservation rule as
Step 5.

### Step 7: Cross-reference check

After applying changes, check whether any of the following also need updating:

- `operations/engineering/ROADMAP_PROGRESS.md` — only if the business change
  affects milestone priorities or active scope (rare)
- `operations/core/MASTER_MEMORY.md` Key Decisions or Current State sections
  — only if this represents a significant strategic shift

If any of these need changes, confirm with the user before touching them.

### Step 8: Update MASTER_MEMORY.md

Append to the session log:

```
- **Date**: YYYY-MM-DD
- **Objective**: Business update — [summary of what changed]
- **Outcome**: completed
- **Key decisions**: [what was changed and why]
- **Next step**: [any follow-up, or "none"]
```

## Examples

**User says:** "I want to change the pricing to [new price]"
→ Full flow. Updates BUSINESS_PLAN pricing and financial assumptions sections.
No MARKETING_PLAN change unless it affects campaign messaging.

**User says:** "Let's refine our [channel] strategy"
→ Full flow. Updates MARKETING_PLAN channel strategy and possibly the campaign
plan. No BUSINESS_PLAN change unless revenue assumptions shift.

**User says:** "I think we should target a broader audience"
→ Full flow. Updates MARKETING_PLAN audience segments; may update BUSINESS_PLAN
TAM/SAM/SOM if the market size changes materially.

**User says:** "I want to add a new feature gate"
→ Redirect: "This is a feature change — want me to run `/add-feature` for the
feature first? I can then run `/business-update` for the pricing strategy
afterward."

## Troubleshooting

**Change contradicts CORE_MISSION**: Quote the specific principle or anti-goal.
Ask if the user wants to (a) adjust the proposal to stay within mission, or
(b) explicitly update CORE_MISSION — which requires user approval per
`boundaries.md`.

**Change has product implications**: Suggest running `/add-feature` for the
product side first, then returning to `/business-update` for the strategy and
marketing side.

**Unsure whether a section in BUSINESS_PLAN needs updating**: Default to not
touching it. Only update sections that are directly and materially affected by
the change discussed.
