# Project Operations Template

A stack-neutral operations scaffold for bootstrapping new software projects with
persistent memory, engineering governance, and LLM-assisted development
workflows.

This template is designed to make agentic coding as efficient as possible. It
gives every session — human or AI — full project context from the first line,
enforces standards automatically, and ensures nothing is lost between sessions.

---

## About

Written by **asboyer**.

Most project templates solve the wrong problem. They give you a folder
structure and a linter config, then leave you on your own. That works fine
when a human is holding the full picture in their head — but the moment you
bring an AI coding agent into the loop, it falls apart. The agent has no
memory of what happened last session. It doesn't know your conventions unless
you tell it every time. It doesn't know what milestone you're working toward,
what decisions were already made, or what the product even is. So it guesses,
and the guesses drift, and you spend more time correcting the AI than you save
by using it.

This template exists because the problem isn't scaffolding — it's continuity.

What makes it different:

- **Persistent memory across sessions.** `MASTER_MEMORY.md` is a shared brain
  that every session reads at the start and updates at the end. Nothing is lost.
- **Structured handoff, not hope.** Every session closes with a specific next
  session starter note. The next agent — human or AI — picks up exactly where
  the last one left off.
- **Standards that enforce themselves.** Coding conventions, commit formats, and
  PR requirements aren't suggestions in a wiki. They're loaded into the AI
  tool automatically via `CLAUDE.md` and `AGENTS.md`, enforced by pre-commit
  hooks, and verified in CI.
- **A prompt system, not a single prompt.** Bootstrap, implementation, refactor,
  health check, business planning, roadmap — each session type has a purpose-
  built prompt with failure modes, validation rules, and explicit boundaries.
- **Stack-neutral by design.** No language assumptions. The bootstrap prompt
  asks what you're building with and configures the tooling for you. Python,
  Node, Go, Rust, whatever — the governance layer is the same.
- **Built for how AI tools actually work.** `CLAUDE.md` and `AGENTS.md` are
  auto-loaded by Claude Code, Cursor, and GitHub Copilot. The session read
  order, source precedence rules, and boundary constraints are picked up
  automatically. You don't paste prompts — you just start working.

The goal is simple: copy this template, run the bootstrap, and have a project
where every session — first or fiftieth — starts with full context and ends
with a clean handoff.

---

## Quick Start

```bash
# 1. Clone the template
git clone https://github.com/asboyer/template.git my_project && cd my_project

# 2. Initialize the cloned repository as your own project
scripts/init_project.sh --project-name "My Project"

# 3. Run the bootstrap prompt to populate all operations files
#    Open your AI tool and use:
#    prompts/start/CORE_PROJECT_BOOTSTRAP_PROMPT.md

# 4. Verify initialization and quality checks
make init-check
make check
```

The initializer script:

- removes template git history and reinitializes the repo,
- creates a single initialization commit when git identity is configured,
- renames `.github/workflows/ci.yml.template` to `.github/workflows/ci.yml`,
- moves the template README to `docs/TEMPLATE_SETUP_INSTRUCTIONS.md`,
- creates a new project-facing `README.md`,
- installs `pre-commit` when possible, then activates the hooks.

> **AI tools with auto-loading (Claude Code, Cursor, GitHub Copilot):**
> `CLAUDE.md` and `AGENTS.md` load project context automatically. After
> bootstrap, you do not need to paste prompts manually — just start working.
> The AI tool reads your conventions, read order, and boundaries on its own.

---

## What This Template Contains

### `operations/` — The Project Brain

This is where all project knowledge lives. Every session starts by reading
these files and ends by updating them.

| File | Purpose | When to Update |
|------|---------|----------------|
| `core/CORE_MISSION.md` | What the product does, why it exists, non-negotiable principles. This is the tie-breaker for all product decisions. | Rarely — only when the mission fundamentally changes. |
| `core/MASTER_MEMORY.md` | The shared brain across all sessions. Contains project overview, architecture, current state, known issues, and a session log. | Every session — append a session log entry and update current state. |
| `engineering/ROADMAP_PROGRESS.md` | The active milestone, what's shipped, what remains, and what's next. This is the execution handoff between sessions. | Every session — update status, remaining work, and next session note. |
| `engineering/ENGINEERING_STANDARDS.md` | Naming conventions, commit format, PR requirements, and the LLM execution checklist. This is the engineering contract. | When standards evolve. Reference from day one. |
| `engineering/ARCHITECTURE_OVERVIEW.md` | System components, data flow, external dependencies, interfaces, and observability approach. | When architecture changes. |
| `engineering/DECISIONS_LOG.md` | Table of major decisions with rationale and links to detailed records. | When a significant decision is made. |
| `engineering/CONTRIBUTING_WORKFLOW.md` | Step-by-step workflow for any contributor: what to read, how to implement, how to close a session. | When workflow changes. |
| `engineering/BOOTSTRAP_CHECKLIST.md` | Required setup checklist for turning this template into a real project. | During initial setup and bootstrap audits. |
| `engineering/NEXT_SESSION_TEMPLATE.md` | Template for the "next session starter" note that closes every session. | Reference only — fill in a copy at end of each session. |
| `engineering/DECISION_TEMPLATE.md` | Template for individual decision records. See `decisions/001_use_operations_scaffold.md` for a filled example. | Reference only — copy for each new decision. |
| `engineering/ENV_SETUP_TEMPLATE.md` | Local development setup instructions: prerequisites, install steps, env vars, run commands. | When setup steps change. |
| `engineering/PR_TEMPLATE.md` | Pull request description template with required sections. | Reference only — use when opening PRs. |
| `engineering/CHANGELOG_TEMPLATE.md` | Changelog format for releases. | Reference only — copy for each release. |
| `engineering/INCIDENT_TEMPLATE.md` | Post-incident report template with timeline, root cause, and action items. | Reference only — copy for each incident. |
| `engineering/decisions/` | Directory of individual decision records. | Add a new file for each major decision. |
| `business/BUSINESS_PLAN.md` | Business plan: problem, market, model, financials, KPIs. | When business strategy changes. |
| `business/MARKETING_PLAN.md` | Marketing plan: positioning, channels, campaigns, measurement. | When GTM strategy changes. |

### `prompts/` — The Session Playbook

Prompts are instructions you give to an AI tool (or follow yourself) at the
start of different session types. They define what to read, what to do, and
what to output.

| Prompt | When to Use | What It Does |
|--------|-------------|--------------|
| `start/CORE_PROJECT_BOOTSTRAP_PROMPT.md` | First session only | Initializes all operations files, asks for your mission and tech stack, sets up the first milestone. |
| `coding_prompts/LLM_HANDOFF_PROMPT_TEMPLATE.md` | Every implementation session | Reads project context, implements the highest-priority task, validates, updates docs, and writes a next session starter. |
| `coding_prompts/REFACTOR_SETUP_PROMPT_TEMPLATE.md` | When cleaning up code | Guides safe, incremental refactoring with behavior parity and test-first requirements. |
| `coding_prompts/SESSION_HEALTH_CHECK_PROMPT.md` | Every few sessions | Audits operations docs for staleness, placeholder rot, and cross-file inconsistencies. Read-only — reports issues without modifying files. |
| `business_prompts/BUSINESS_PLAN_PROMPT_TEMPLATE.md` | When creating/updating business strategy | Generates a complete business plan from project context. |
| `business_prompts/ROADMAP_PLAN_PROMPT_TEMPLATE.md` | When planning milestones | Creates an execution roadmap aligned to the business plan. |
| `business_prompts/MARKETING_PLAN_PROMPT_TEMPLATE.md` | When planning GTM | Creates a marketing plan aligned to the business plan and mission. |

**Prompt order matters.** See `prompts/PROMPT_USAGE_ORDER.md` for the full
sequencing guide, decision rules, and session close requirements.

Bootstrap is not complete until
`operations/engineering/BOOTSTRAP_CHECKLIST.md` has been reviewed.

### Root Files

| File | Purpose |
|------|---------|
| `CLAUDE.md` | Auto-loaded by Claude Code. Contains read order, key commands, conventions, session rules, and boundaries. |
| `AGENTS.md` | Auto-loaded by Cursor, GitHub Copilot, and tools supporting the AGENTS.md standard. Same content as CLAUDE.md in a cross-tool format. |
| `Makefile` | Stack-neutral build targets: `lint`, `format-check`, `test`, `check`, `init-check`. Configure via `LINT_CMD`, `FORMAT_CHECK_CMD`, `TEST_CMD`. |
| `.pre-commit-config.yaml` | Pre-commit hooks for whitespace, YAML/JSON validation, merge conflict detection, private keys, and large files. Add language-specific hooks for your stack. |
| `.github/workflows/ci.yml.template` | CI workflow template. Rename to `.github/workflows/ci.yml` when you instantiate a real project from this template. |
| `.github/dependabot.yml` | Keeps GitHub Actions versions up to date automatically. |
| `.github/ISSUE_TEMPLATE/` | Structured templates for bug reports, feature requests, and tech debt. |
| `.env.example` | Example environment variables. Copy to `.env` and fill in real values. Never commit `.env`. |
| `.editorconfig` | Editor-agnostic formatting: 4-space indent, UTF-8, LF line endings, tabs for Makefile. |
| `.markdownlint-cli2.yaml` | Markdown lint config tuned for template files (allows long lines, inline HTML, multiple headings). |
| `SECURITY.md` | Security policy template with vulnerability reporting instructions. |
| `.gitignore` | Ignores common environment files, caches, build outputs, editor state, logs, and stack-specific local artifacts. |

---

## Initializer

Run `scripts/init_project.sh --project-name "Your Project"` immediately after
cloning this repository for a new project.

The script is intentionally opinionated:

- It deletes the inherited `.git/` directory and creates a fresh repository.
- It keeps the default branch as `master` unless you override it.
- It activates the CI workflow by renaming the template workflow file.
- It moves this template README to `docs/TEMPLATE_SETUP_INSTRUCTIONS.md`.
- It writes a project README stub so the new repository has its own top-level
  documentation.
- It installs `pre-commit` when possible, then activates the hooks.

If you need a different branch name or want to skip the first commit, run:

```bash
scripts/init_project.sh \
  --project-name "Your Project" \
  --default-branch main \
  --skip-commit
```

The generated project README is based on
`docs/PROJECT_README_TEMPLATE.md`.

---

## How Sessions Work

### Starting a Session

1. The AI tool (or you) reads the files listed in the **session start read
   order** (defined in `CLAUDE.md` and every coding prompt):
   - `operations/core/CORE_MISSION.md`
   - `operations/core/MASTER_MEMORY.md`
   - `operations/engineering/ROADMAP_PROGRESS.md`
   - `operations/engineering/ENGINEERING_STANDARDS.md`
   - `operations/engineering/ARCHITECTURE_OVERVIEW.md`
   - `operations/engineering/DECISIONS_LOG.md`

2. The active milestone and immediate objective are identified from
   `ROADMAP_PROGRESS.md`.

3. Work begins on the highest-priority scoped task.

### During a Session

- Implement, then validate (lint + tests + manual checks).
- If a significant decision is made, create a decision record and log it.
- Follow the coding standards for naming, commits, and PR structure.

### Closing a Session

Every session must end with:

1. A **session log entry** in `MASTER_MEMORY.md` containing:
   - Date (YYYY-MM-DD)
   - Objective pursued
   - Outcome (completed / partial / blocked)
   - Key decisions made
   - Next step

2. An updated **status** in `ROADMAP_PROGRESS.md` (what shipped, what
   remains, risks).

3. A **Next Session Starter** note — a specific, actionable first task for
   whoever picks up next.

### Source Precedence

When documents conflict:
- Latest explicit user instruction > roadmap > master memory > older docs.
- Core mission is the tie-breaker for product-direction tradeoffs.

---

## Configuring for Your Stack

The template ships with no language assumptions. During bootstrap, the AI tool
will ask what stack you are using and configure:

- **Makefile** — sets `LINT_CMD`, `FORMAT_CHECK_CMD`, `TEST_CMD` for your
  toolchain.
- **`.pre-commit-config.yaml`** — uncomments or adds hooks for your language
  (examples for ruff/Python and eslint/JS are included as comments).
- **`.env.example`** — adds any stack-specific environment variables.
- **`.github/workflows/ci.yml`** — after you rename the template file, set any
  repository-specific environment or command defaults needed by CI.

You can also configure manually:

```bash
# Example: Node.js project
make check \
  LINT_CMD="npm run lint" \
  FORMAT_CHECK_CMD="npm run format:check" \
  TEST_CMD="npm test"
```

To make the configuration permanent, edit the defaults at the top of the
`Makefile`.

---

## Maintenance

- **Run `scripts/init_project.sh`** when turning this template into a real
  repository. It activates the CI workflow, resets git history, and creates
  the project-facing README for you.
- **Review `operations/engineering/BOOTSTRAP_CHECKLIST.md`** before
  declaring the project ready for feature work.
- **Run `make init-check`** after bootstrap to verify all operations files
  are initialized with real content.
- **Run the health check prompt** (`prompts/coding_prompts/SESSION_HEALTH_CHECK_PROMPT.md`)
  every few sessions to catch stale docs and cross-file drift.
- **Dependabot** keeps GitHub Actions versions current automatically.
- **Pre-commit hooks** run on every commit locally. CI mirrors the same
  checks to catch anything bypassed with `--no-verify`.

---

## File Map

```
.
├── CLAUDE.md                          # AI context (Claude Code)
├── AGENTS.md                          # AI context (cross-tool standard)
├── SECURITY.md                        # Vulnerability reporting policy
├── Makefile                           # Stack-neutral build targets
├── .pre-commit-config.yaml            # Pre-commit hook config
├── .editorconfig                      # Editor formatting rules
├── .markdownlint-cli2.yaml            # Markdown lint config
├── .env.example                       # Example environment variables
├── .gitignore                         # Git ignore rules
├── .github/
│   ├── workflows/ci.yml.template      # CI pipeline (rename to ci.yml after bootstrap)
│   ├── dependabot.yml                 # Dependency updates
│   └── ISSUE_TEMPLATE/                # Bug, feature, tech debt templates
├── src/                               # Application source code
├── tests/                             # Test suite
├── docs/                              # User/developer documentation
├── scripts/                           # Utility and automation scripts
├── operations/
│   ├── core/
│   │   ├── CORE_MISSION.md            # Mission and principles
│   │   └── MASTER_MEMORY.md           # Persistent project memory
│   ├── engineering/
│   │   ├── ROADMAP_PROGRESS.md        # Active milestone and status
│   │   ├── ENGINEERING_STANDARDS.md
│   │   ├── ARCHITECTURE_OVERVIEW.md
│   │   ├── CONTRIBUTING_WORKFLOW.md
│   │   ├── DECISIONS_LOG.md
│   │   ├── decisions/                 # Individual decision records
│   │   ├── BOOTSTRAP_CHECKLIST.md
│   │   ├── DECISION_TEMPLATE.md
│   │   ├── ENV_SETUP_TEMPLATE.md
│   │   ├── NEXT_SESSION_TEMPLATE.md
│   │   ├── PR_TEMPLATE.md
│   │   ├── CHANGELOG_TEMPLATE.md
│   │   └── INCIDENT_TEMPLATE.md
│   └── business/
│       ├── BUSINESS_PLAN.md
│       └── MARKETING_PLAN.md
└── prompts/
    ├── PROMPT_USAGE_ORDER.md           # Master sequencing guide
    ├── start/
    │   └── CORE_PROJECT_BOOTSTRAP_PROMPT.md
    ├── coding_prompts/
    │   ├── LLM_HANDOFF_PROMPT_TEMPLATE.md
    │   ├── REFACTOR_SETUP_PROMPT_TEMPLATE.md
    │   └── SESSION_HEALTH_CHECK_PROMPT.md
    └── business_prompts/
        ├── BUSINESS_PLAN_PROMPT_TEMPLATE.md
        ├── ROADMAP_PLAN_PROMPT_TEMPLATE.md
        └── MARKETING_PLAN_PROMPT_TEMPLATE.md
```
