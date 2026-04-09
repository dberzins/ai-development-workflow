---
description: "Use when: starting or resuming work on a feature, issue, or milestone and needing a concise session brief."
argument-hint: "Feature, issue, or milestone to resume"
agent: "agent"
---
<!-- RULES:BEGIN — generated from RULES_REGISTRY.md, do not edit manually -->
- CR1: Every major change starts from a written artifact, not from direct coding.
- CR2: Analysis before planning. Planning before implementation.
- CR3: Decisions affecting architecture, scope, or behavior must be recorded.
- CR4: Keep work traceable across `SPEC -> ANALYSIS -> PLAN -> implementation -> release notes`.
- WS1: `SPEC → [ARCHITECTURE/SETUP + ROADMAP/RISKS] → ANALYSIS → ADR → PLAN → TEST PLAN → IMPLEMENT → QUALITY/REVIEW → ISSUE/REFACTOR → DOCS UPDATE → PUBLISH → RETROSPECTIVE → feed back into ROADMAP/RISKS`
- G5: For large or risky work, read the relevant project docs first and confirm what is decided, in progress, and next.
- G6: If scope is unclear, create or update analysis before planning.
- S1: Load only the docs relevant to the current task: usually `SPEC.md`, `ARCHITECTURE.md`, `ROADMAP.md`, and related analysis, ADR, issue, plan, or test docs.
- S2: At session start, confirm current status, decisions, work in progress, and next action.
<!-- RULES:END -->

Use the docs relevant to `${input:workItem:feature, issue, or milestone}`.

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