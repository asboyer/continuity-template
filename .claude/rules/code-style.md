---
description: Code style and conventions. Replace with stack-specific rules during bootstrap.
---

# Code Style Rules

> Replace this file with project-specific language and framework conventions
> during bootstrap. The sections below are stack-neutral defaults.

## General

- Prefer explicit, readable code over clever one-liners
- One responsibility per function; one concept per file
- No dead code committed — remove rather than comment out
- Names should describe what something *is* or *does*, not how it's implemented

## Error Handling

- Validate at system boundaries (user input, external APIs)
- Do not add error handling for scenarios that cannot happen
- Do not swallow errors silently — log or rethrow with context

## Testing

- Tests live in `tests/` mirroring the `src/` structure
- Unit tests for all shared/library code
- Write tests before implementation for new shared logic (TDD)
- Run `make test` — must pass clean before declaring work complete

## Commits & Files

- No `console.log` / debug prints in committed code
- No commented-out code blocks
- Remove unused imports
