---
description: "Use when: turning an approved analysis into a phased <FEATURE>_PLAN.md with dependencies, validation, and checklist items."
argument-hint: "Feature or approved analysis to turn into a plan"
agent: "agent"
---
Use [workflow rules](workflow.prompt.md) and [plan template](../templates/FEATURE_PLAN.md).

Task:
- Prepare the implementation plan for `${input:feature:feature or approved analysis}`.

Goal:
- Turn the selected approach into a sequenced, testable implementation plan.

Inputs:
- Approved `*_ANALYSIS.md`
- Related ADRs, risks, issues, refactor docs, and relevant project docs

Output:
- Create or update `<FEATURE>_PLAN.md` using [templates/FEATURE_PLAN.md](../templates/FEATURE_PLAN.md).

Rules:
- Include chosen approach, scope, assumptions, phases, dependencies, risks and mitigations, validation strategy, definition of done, and rollback notes.
- Add or update `TEST_PLAN.md` when validation planning is required.
- Use checklist items for implementation work, not decision history.
- If the analysis is missing or unapproved, identify that as the blocker.

Action:
- Read the approved analysis and supporting docs, draft the plan, and identify the next execution step.