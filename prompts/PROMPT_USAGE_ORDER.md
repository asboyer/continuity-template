# Prompt Usage Order (Project Template)

Use prompts from this folder in the following order.

## 1) Start (first session only)

1. `prompts/start/CORE_PROJECT_BOOTSTRAP_PROMPT.md`

This initializes and/or validates the `operations/` knowledge system.

## 2) Coding sessions (every implementation session)

1. `prompts/coding_prompts/LLM_HANDOFF_PROMPT_TEMPLATE.md`
2. Optional: `prompts/coding_prompts/REFACTOR_SETUP_PROMPT_TEMPLATE.md`

These prompts require reading and updating:

- `operations/core/CORE_MISSION.md`
- `operations/core/MASTER_MEMORY.md`
- `operations/engineering/ROADMAP_PROGRESS.md`
- `operations/engineering/CODING_STANDARDS_AND_PR_CHECKLIST.md`
- `operations/engineering/ARCHITECTURE_OVERVIEW.md`
- `operations/engineering/DECISIONS_LOG.md`

## 3) Business/strategy sessions (periodic)

1. `prompts/business_prompts/BUSINESS_PLAN_PROMPT_TEMPLATE.md`
2. `prompts/business_prompts/ROADMAP_PLAN_PROMPT_TEMPLATE.md`
3. `prompts/business_prompts/MARKETING_PLAN_PROMPT_TEMPLATE.md`

Write outputs into:

- `operations/business/BUSINESS_PLAN.md`
- `operations/engineering/ROADMAP_PROGRESS.md` (milestone alignment)
- `operations/business/MARKETING_PLAN.md`
- `operations/core/MASTER_MEMORY.md` (decision + summary log)

## 4) Decision Rule

- If `operations/business/BUSINESS_PLAN.md` exists, roadmap priorities must align to it.
- If no business plan exists yet, continue implementation from
  `operations/engineering/ROADMAP_PROGRESS.md`.

## 5) Session Close Rule (always)

Every session must end by updating:

- `operations/core/MASTER_MEMORY.md`
- `operations/engineering/ROADMAP_PROGRESS.md`

and adding a concise "Next Session Starter" note.
