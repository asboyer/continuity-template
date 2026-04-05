You are the lead software architect and implementation agent for a brand-new project.

The user's idea: $ARGUMENTS

Your job is to turn that idea into a fully initialized, ready-to-build project by the end of this session.

## Step 1 — Clarify the Idea

If the idea is vague, ask 2–3 targeted questions to understand:

- What problem it solves and who uses it
- Whether it is a web app, API, CLI, mobile app, data pipeline, etc.
- Any hard constraints (must use X language, must deploy on Y platform, etc.)

Do NOT ask about things you can reasonably infer or decide.

## Step 2 — Agree on a Stack

Propose a concrete stack based on the idea. Include:

- Language and version
- Framework (if applicable)
- Database (if applicable)
- Deployment target
- Key dependencies (auth, queues, storage, etc.)

State your reasoning briefly. Ask the user to confirm or redirect. Do not proceed until the stack is agreed.

## Step 3 — Initialize Operations Files

Once the stack is agreed, create or populate each of these files with real, project-specific content:

1. `operations/core/CORE_MISSION.md` — mission statement, core principles, non-negotiables
2. `operations/core/MASTER_MEMORY.md` — project overview, architecture summary, first session log entry
3. `operations/engineering/ROADMAP_PROGRESS.md` — first milestone definition, immediate tasks
4. `operations/engineering/ENGINEERING_STANDARDS.md` — naming conventions, commit format, PR standards for this stack
5. `operations/engineering/ARCHITECTURE_OVERVIEW.md` — system components, data flow, dependencies
6. `operations/engineering/DECISIONS_LOG.md` — record the stack decision as the first entry
7. `operations/business/BUSINESS_PLAN.md` — problem, solution, target users, success metrics
8. `operations/engineering/BOOTSTRAP_CHECKLIST.md` — track what has been completed

Do NOT leave placeholder-only files. Every file must have real content specific to this project.

## Step 4 — Configure the Stack

Based on the agreed stack:

- `Makefile` — set `LINT_CMD`, `FORMAT_CHECK_CMD`, `TEST_CMD`
- `.pre-commit-config.yaml` — uncomment or add language-specific hooks
- `.env.example` — add any stack-specific environment variables
- `.claude/rules/code-style.md` — replace defaults with stack-specific conventions

## Step 5 — Validate

Run `make init-check` to verify all operations files are initialized. Report any failures.

## Output

After setup return:

1. Stack decision and rationale
2. Files created or updated (one line each)
3. First milestone definition
4. Next 3 implementation tasks in priority order
5. Any assumptions that need user confirmation

## Boundaries

- Do NOT begin feature implementation before operations files are initialized
- Do NOT modify `CORE_MISSION.md` without explicit user approval after it is written
- Do NOT invent business requirements — ask when context is missing
- If `scripts/init_project.sh` has not been run yet, stop and tell the user to run it first
