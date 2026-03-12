# Coding Prompt: Session Health Check

```text
You are auditing this project's operations documents for completeness, freshness,
and internal consistency. This is a maintenance task, not an implementation task.

READ (in order)
1) operations/core/CORE_MISSION.md
2) operations/core/MASTER_MEMORY.md
3) operations/engineering/ROADMAP_PROGRESS.md
4) operations/engineering/CODING_STANDARDS_AND_PR_CHECKLIST.md
5) operations/engineering/ARCHITECTURE_OVERVIEW.md
6) operations/engineering/DECISIONS_LOG.md
7) operations/business/BUSINESS_PLAN.md (if present)
8) operations/business/MARKETING_PLAN.md (if present)

CHECK EACH FILE FOR
1) Placeholder-only content (angle-bracket placeholders with no real content)
2) Staleness (session log not updated in 3+ sessions, roadmap status outdated)
3) Internal contradictions (roadmap doesn't match master memory, architecture
   doesn't match codebase)
4) Missing sections (required sections from templates left blank)

CROSS-FILE CONSISTENCY CHECKS
1) MASTER_MEMORY.md "Current State" matches ROADMAP_PROGRESS.md status
2) MASTER_MEMORY.md "Architecture & Tech Stack" matches ARCHITECTURE_OVERVIEW.md
3) ROADMAP_PROGRESS.md milestones align with BUSINESS_PLAN.md (if present)
4) DECISIONS_LOG.md entries referenced in MASTER_MEMORY.md exist
5) Session log in MASTER_MEMORY.md has an entry for every session that made changes

OUTPUT
1) Health status: Healthy | Needs Attention | Critical
2) For each file: status (OK / stale / incomplete / inconsistent) + specific issue
3) Cross-file inconsistencies found
4) Recommended fixes (ordered by priority)
5) Proposed session log entry summarizing this health check

DO NOT
- Do NOT modify any file during a health check — report only
- Do NOT skip files because they look fine at a glance — read fully
- Do NOT ignore staleness — outdated docs cause session drift
```
