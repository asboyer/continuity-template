# Business Prompt: Full Roadmap Creation

```text
You are a principal product + engineering program lead.

Create a complete execution roadmap aligned to:
1) operations/core/CORE_MISSION.md
2) operations/business/BUSINESS_PLAN.md
3) operations/engineering/ARCHITECTURE_OVERVIEW.md
4) operations/core/MASTER_MEMORY.md

FAILURE MODES
- If BUSINESS_PLAN.md exists: roadmap must align to it. Flag any conflicts.
- If BUSINESS_PLAN.md does not exist: note assumptions and mark roadmap as
  provisional until business plan is finalized.
- If ARCHITECTURE_OVERVIEW.md is empty: define a preliminary architecture as
  part of the roadmap and flag for dedicated architecture review.

Required sections:
1) Roadmap summary
2) Workstream structure (product/engineering/design/data/GTM/ops)
3) Phase plan with dependencies and exit criteria
4) Milestones and timeline
5) Prioritization framework
6) Resourcing plan
7) KPI plan
8) Risk register
9) Governance and execution rhythm
10) 90-day detailed week-by-week plan
11) Roadmap change policy

Write roadmap outcomes into:
- operations/engineering/ROADMAP_PROGRESS.md

Also append key decisions to:
1) operations/core/MASTER_MEMORY.md
2) operations/engineering/DECISIONS_LOG.md

VALIDATION
After writing, verify:
1) milestones have clear exit criteria
2) dependencies between phases are explicit
3) 90-day plan has weekly deliverables (not monthly vagueness)
4) risk register includes likelihood and mitigation for each item
5) roadmap aligns with BUSINESS_PLAN.md priorities (if it exists)

DO NOT
- Do NOT create milestones without acceptance criteria
- Do NOT plan beyond 90 days at week-level detail — use monthly granularity beyond
- Do NOT ignore existing MASTER_MEMORY.md context and decisions
- Do NOT skip the governance section — execution rhythm prevents drift
- Do NOT set timelines without stating resourcing assumptions
```
