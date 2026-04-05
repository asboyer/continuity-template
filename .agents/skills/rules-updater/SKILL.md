---
name: rules-updater
description: Runs at the end of every session. Scans the conversation for newly discovered patterns, constraints, failure modes, and decisions — then writes them back to the appropriate .claude/rules/ or .claude/skills/ file. Keeps rules evergreen without manual maintenance.
---

# Rules Updater

Your job is to close the feedback loop: after each session, extract what was
actually learned and write it back into the rules files so the next session
starts smarter.

## What to Look For

Scan the session for moments where:

- A constraint or behavior was discovered that isn't obvious from the code
- Something failed in a non-obvious way (wrong assumption, edge case, env issue)
- A pattern emerged that worked well and should be repeated
- A decision was made that should constrain future work
- The agent made a mistake that a better rule would have prevented
- "I didn't know X about Y" — anything that required explaining mid-session

Do NOT capture:

- Things already documented in the rules files
- Temporary debugging context that won't apply again
- Task-specific implementation details (those go in MASTER_MEMORY, not rules)
- Anything that's obvious from reading the code

## Routing Table

Route each learning to the correct file based on topic:

| Topic                                   | File                                                         |
| --------------------------------------- | ------------------------------------------------------------ |
| Data model, schema, DB constraints      | `.claude/rules/data-model.md` (if it exists)                 |
| Language/framework patterns             | `.claude/rules/code-style.md`                                |
| Git workflow, commit format, PR process | `.claude/rules/git.md`                                       |
| Things that must never happen           | `.claude/rules/boundaries.md`                                |
| Session read order, logging, handoff    | `.claude/rules/session.md`                                   |
| Domain-specific workflow                | `.claude/skills/<skill>/SKILL.md` (if relevant skill exists) |
| New decisions locking future direction  | `operations/engineering/DECISIONS_LOG.md`                    |

Also update the mirror copies in `.agents/skills/` for any skill files that
change, so all agents stay in sync.

If a learning doesn't fit any category, skip it rather than force it somewhere.

## How to Write

Rules files are loaded into context on every relevant request. Every line costs
tokens. Write lean:

- One bullet per learning, maximum two sentences
- State the rule, not the story behind discovering it
- Add under the most relevant existing heading — do not create new headings
  unless there is genuinely no existing home
- Never remove or rewrite existing content — only append or clarify
- Mark truly non-obvious constraints with a comment: `# discovered YYYY-MM-DD`

**Bad (too narrative):**

> We discovered during the session that when we tried to do X it caused issues
> because of Y underlying reason...

**Good (rule form):**

> - Never do X — Y is the underlying constraint. `# discovered YYYY-MM-DD`

## Process

1. Read the current content of every rules file you might update
2. Identify 1–5 learnings from the session worth persisting (most sessions will
   have 0–2; that is normal and correct — do not pad)
3. For each learning: route it, check it's not already covered, write it
4. Report what you added and to which file. If nothing was worth adding, say so.

## Example Output

```
Rules updated:

.claude/rules/code-style.md
  + Added note under "Error Handling": never swallow errors from external API
    calls — always log the status code and response body before re-throwing.

No changes to: git.md, boundaries.md, session.md
```
