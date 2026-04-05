---
name: brainstorm
description: Facilitates open-ended feature brainstorming. Use when the user wants to explore new ideas, discuss product direction, or think through possibilities without committing to anything yet. No files are modified during the brainstorm.
---

# Feature Brainstorm Skill

Read-only, conversational skill. Loads all product context upfront so
brainstorming is grounded in the mission, roadmap, and business plan. Nothing
is written until the user explicitly chooses to capture an idea.

## Non-Negotiable Constraints

1. **No file modifications during brainstorm** — this skill is read-only until
   Step 5
2. **CORE_MISSION anti-goals are hard stops** — if an idea directly contradicts
   an anti-goal, surface the conflict clearly before exploring further
3. **CORE_MISSION.md is read-only** — it can be referenced but never modified
   by this skill

## Instructions

### Step 1: Load context

Read these files:

- `operations/core/CORE_MISSION.md` (mission, principles, anti-goals)
- `operations/engineering/ROADMAP_PROGRESS.md` (current milestone, shipped,
  remaining)
- `operations/business/BUSINESS_PLAN.md` (product differentiation, target
  users, business model, KPIs)
- `operations/business/MARKETING_PLAN.md` (audience segments, channels,
  campaigns)
- `operations/engineering/DECISIONS_LOG.md` (open decisions that might benefit
  from ideation)

### Step 2: Present the current landscape

Summarize in 3–5 bullets:

- Active milestone and what remains to be built
- Key product differentiators already defined
- Any open decisions where new ideas could help
- Gaps or opportunities visible from the business/marketing plans

Then ask: "What area do you want to brainstorm — or should we do a broad
sweep?"

### Step 3: Facilitate open discussion

For each idea the user raises, explore:

- **Mission alignment**: Does it support the stated product principles?
- **Anti-goal check**: Does it conflict with any anti-goal from CORE_MISSION?
- **Roadmap fit**: Current milestone, next milestone, or future?
- **Engineering complexity**: small / medium / large
- **Marketing/viral potential**: Does it connect to any audience segment or
  channel from MARKETING_PLAN?

Hold evaluation lightly — let ideas breathe before critiquing. Push back only
when an idea directly contradicts an anti-goal or locked decision.

### Step 4: Summarize and prioritize

When the user signals they are done (or after a natural pause), present:

A numbered list of all ideas discussed with for each:

- One-line description
- Mission alignment: strong / moderate / weak
- Estimated complexity: small / medium / large
- Suggested milestone placement

### Step 5: Offer to capture

For each idea the user wants to move forward with:

- "Want me to run `/add-feature` for [idea]?" — adds it to the roadmap
- "This would need a tech decision first — want to run `/arch-decision`?" — if
  the idea requires new infrastructure or a stack choice
- "Want me to log a note in MASTER_MEMORY about this brainstorm?" — appends a
  brief session log entry noting what was discussed and any tentative
  conclusions (no roadmap or plan files are updated; only MASTER_MEMORY)

If the user wants to capture anything in MASTER_MEMORY, append to the session
log:

```
- **Date**: YYYY-MM-DD
- **Objective**: Feature brainstorm — [topic]
- **Outcome**: completed
- **Key decisions**: [tentative conclusions or top ideas]
- **Next step**: [e.g., run /add-feature for X]
```

## Examples

**User says:** "Let's brainstorm what future features could look like"
→ Full flow, Steps 1–5

**User says:** "I have some ideas about [a product area]"
→ Steps 1–3 focused on that area, then 4–5

**User says:** "What would make this more viral?"
→ Steps 1–2 with emphasis on MARKETING_PLAN audience segments and campaigns,
then 3–5

## Troubleshooting

**User wants to commit to an idea mid-brainstorm**: Pause, confirm they want
to switch to `/add-feature`, handle that handoff, then ask if they want to
continue brainstorming remaining ideas.

**Idea contradicts an anti-goal**: State the conflict clearly, quoting the
specific anti-goal from CORE_MISSION. Ask if the user wants to (a) adjust the
idea to stay within mission, or (b) revisit the anti-goal itself — which
requires explicit approval per `boundaries.md`.

**Too many ideas, hard to prioritize**: Group by milestone fit (now / near /
future) and surface the top 2–3 by mission alignment × engineering feasibility.
