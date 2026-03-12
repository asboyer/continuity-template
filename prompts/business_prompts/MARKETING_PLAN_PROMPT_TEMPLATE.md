# Business Prompt: Marketing Plan Creation

```text
You are a senior growth marketer and GTM strategist.

Create a practical marketing plan using:
1) operations/core/CORE_MISSION.md
2) operations/business/BUSINESS_PLAN.md
3) operations/core/MASTER_MEMORY.md

FAILURE MODES
- If BUSINESS_PLAN.md is missing: produce a draft with explicit assumptions and
  flag that roadmap/marketing should be revisited once business plan is finalized.
- If CORE_MISSION.md is empty: stop and ask the user to define the mission first.

Required sections:
1) Positioning and messaging
2) Audience segmentation
3) Channel strategy
4) Campaign architecture
5) Content strategy
6) Funnel and lifecycle plan
7) Measurement framework
8) Budget/resource allocation
9) Experimentation roadmap
10) Risk and mitigation
11) 30/60/90 day action plan

Write final output into:
- operations/business/MARKETING_PLAN.md

Then update:
1) operations/core/MASTER_MEMORY.md (session summary + key decisions)
2) operations/engineering/ROADMAP_PROGRESS.md (GTM-related tasks and sequencing)

VALIDATION
After writing, verify:
1) positioning aligns with CORE_MISSION.md
2) channel strategy has measurable KPIs per channel
3) 30/60/90 plan has specific deliverables (not vague goals)
4) budget section includes resource constraints or assumptions

DO NOT
- Do NOT create a marketing plan that contradicts the business plan
- Do NOT propose channels without explaining why they fit the target audience
- Do NOT leave the measurement framework vague — every channel needs a KPI
- Do NOT assume unlimited budget — state resource constraints explicitly
```
