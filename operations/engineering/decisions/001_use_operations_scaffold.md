# Decision: Use Operations Scaffold for Project Governance

## Date

2026-03-12

## Status

Accepted

## Context

Starting a new project requires a system for persistent memory, engineering
standards, and session continuity — especially when working with LLM-assisted
development. Without this, each session starts from scratch and context is lost.

## Decision

Adopt the operations scaffold template as the governance backbone. All project
context, decisions, and standards live in `operations/` and are read at the
start of every session.

## Rationale

- Persistent memory prevents context loss across sessions.
- Codified standards are enforceable via pre-commit and CI.
- Structured handoff prompts reduce onboarding time for new contributors and
  LLM sessions.
- Decision records create an auditable trail of why choices were made.

## Alternatives Considered

- Ad-hoc notes in README only — no structure, drifts quickly.
- Wiki-based documentation — disconnected from repo, goes stale.
- No formal governance — fast to start, expensive to maintain.

## Consequences

- Positive: Every session starts with full context. Standards are enforced
  automatically. Decisions are traceable.
- Negative: Small overhead to maintain operations docs each session. New
  contributors must learn the scaffold structure.

## Follow-up Actions

- Run bootstrap prompt to populate all operations files with real content.
- Configure Makefile command hooks for the chosen tech stack.
- Install pre-commit hooks locally.
