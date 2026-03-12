# Bootstrap Checklist

Use this checklist when turning this template into a real project. The project
is not considered initialized until every required item below is complete.

## Repository Activation

- [ ] Repository initialized with `master` as the default branch
- [ ] `.github/workflows/ci.yml.template` renamed to `.github/workflows/ci.yml`
- [ ] `pre-commit install` has been run locally
- [ ] `.env.example` reviewed and updated for the active stack

## Stack Configuration

- [ ] `LINT_CMD` configured for the project stack
- [ ] `FORMAT_CHECK_CMD` configured for the project stack
- [ ] `TEST_CMD` configured for the project stack
- [ ] `.pre-commit-config.yaml` updated with stack-specific hooks as needed
- [ ] CI workflow reviewed for any repository-specific environment or command setup

## Operations Initialization

- [ ] `operations/core/CORE_MISSION.md` replaced with real project content
- [ ] `operations/core/MASTER_MEMORY.md` initialized with project overview, current state, and first session log entry
- [ ] `operations/engineering/ROADMAP_PROGRESS.md` initialized with the active milestone and next session note
- [ ] `operations/engineering/ARCHITECTURE_OVERVIEW.md` initialized with the current system design
- [ ] `operations/business/BUSINESS_PLAN.md` reviewed and either populated or marked intentionally deferred
- [ ] `operations/business/MARKETING_PLAN.md` reviewed and either populated or marked intentionally deferred
- [ ] Stack/tooling decisions and open questions recorded in `MASTER_MEMORY.md`

## Validation

- [ ] `make init-check` passes
- [ ] `make check` passes with the configured stack commands
- [ ] Pre-commit hooks pass on the current repository state
- [ ] First Next Session Starter note is written before ending bootstrap

## Sign-Off

- [ ] Bootstrap session output includes assumptions, risks, and immediate next steps
- [ ] Team or project owner agrees the repository is ready for feature work
