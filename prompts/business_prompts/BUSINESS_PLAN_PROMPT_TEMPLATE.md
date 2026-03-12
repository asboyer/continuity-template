# Business Prompt: Business Plan Creation

```text
You are a senior strategy consultant and startup operator.

Create a complete business plan using project context from:
1) operations/core/CORE_MISSION.md
2) operations/core/MASTER_MEMORY.md
3) operations/engineering/ARCHITECTURE_OVERVIEW.md
4) operations/engineering/ROADMAP_PROGRESS.md

FAILURE MODES
- If CORE_MISSION.md is empty or placeholder-only: stop and ask the user to
  define the mission before creating a business plan.
- If any other context file is missing: state assumptions explicitly and flag
  each assumption for user review.

Required sections:
1) Executive summary
2) Problem and customer
3) Product and differentiation
4) Market analysis (TAM/SAM/SOM with assumptions)
5) Business model and pricing
6) GTM strategy
7) Operations/team plan
8) Financial assumptions (12-24 months)
9) Risks and mitigations
10) Milestones and KPIs
11) Immediate next actions (top 10)

Write final output into:
- operations/business/BUSINESS_PLAN.md

Then update:
1) operations/core/MASTER_MEMORY.md (session summary + key decisions)
2) operations/engineering/ROADMAP_PROGRESS.md (align milestones to business priorities)

VALIDATION
After writing, verify:
1) every section has substantive content (no placeholders)
2) financial assumptions include explicit basis and timeframe
3) KPIs are measurable with defined targets
4) milestones align with ROADMAP_PROGRESS.md

DO NOT
- Do NOT fabricate market data — use estimates with stated assumptions
- Do NOT ignore existing ROADMAP_PROGRESS.md milestones — align or reconcile
- Do NOT produce a plan that contradicts CORE_MISSION.md
- Do NOT leave sections as stubs — every section must be actionable
```
