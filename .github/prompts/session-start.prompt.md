---
description: "Use when: starting or resuming work on a feature, issue, or milestone and needing a concise session brief."
argument-hint: "Feature, issue, or milestone to resume"
agent: "agent"
---
Use [workflow rules](workflow.prompt.md) and the docs relevant to `${input:workItem:feature, issue, or milestone}`.

Task:
- Start or resume the session for `${input:workItem:feature, issue, or milestone}`.

Goal:
- Rebuild only the context needed for the current task and identify the next action.

Inputs:
- Usually `SPEC.md`, `ARCHITECTURE.md`, `ROADMAP.md`, and related analysis, ADR, issue, plan, or test docs

Output:
- A concise session brief covering what is decided, what is in progress, what is blocked, and what should happen next.

Rules:
- Load only the docs relevant to the current task.
- Distinguish decided work from assumptions and open questions.
- Prefer the next actionable step, not a broad recap.

Action:
- Read the smallest useful set of docs, summarize current state, and propose the immediate next step.