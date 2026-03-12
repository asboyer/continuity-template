# Starter Project Template

This folder is a generic starter project operations scaffold.

It includes reusable template documents for:

- core mission
- persistent memory
- roadmap handoff
- coding standards
- architecture and decisions
- contributing workflow
- business and marketing planning

It now includes project-local prompt templates under `prompts/`, organized into:

- `prompts/start`
- `prompts/coding_prompts`
- `prompts/business_prompts`

It also includes engineering starter scaffolding:

- `Makefile` with standard targets (`lint`, `format-check`, `test`, `check`)
- `.pre-commit-config.yaml` starter
- `.github/workflows/ci.yml` starter
- `.github/ISSUE_TEMPLATE/` for bug/feature/tech debt
- `.env.example` and `operations/engineering/ENV_SETUP_TEMPLATE.md`
- PR, release, and decision record templates under `operations/engineering/`

The build/lint/test scaffolding is stack-neutral by default and expects you to
configure command hooks for your language/toolchain.

## Start Here

1. Copy this `project-template/` folder into your new project.
2. Fill in placeholders in the files under `operations/`.
3. Use prompts in `prompts/PROMPT_USAGE_ORDER.md`.
4. Use your bootstrap prompt to initialize session behavior.
