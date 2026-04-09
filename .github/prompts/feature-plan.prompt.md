---
description: "Use when: turning an approved analysis into a phased <FEATURE>_PLAN.md with dependencies, validation, and checklist items."
argument-hint: "Feature or approved analysis to turn into a plan"
agent: "agent"
---
<!-- RULES:BEGIN — generated from RULES_REGISTRY.md, do not edit manually -->
- CR1: Every major change starts from a written artifact, not from direct coding.
- CR2: Analysis before planning. Planning before implementation.
- CR3: Decisions affecting architecture, scope, or behavior must be recorded.
- CR4: Keep work traceable across `SPEC -> ANALYSIS -> PLAN -> implementation -> release notes`.
- CR5: Checklists track execution status; they do not replace technical content.
- WS1: `SPEC → [ARCHITECTURE/SETUP + ROADMAP/RISKS] → ANALYSIS → ADR → PLAN → TEST PLAN → IMPLEMENT → QUALITY/REVIEW → ISSUE/REFACTOR → DOCS UPDATE → PUBLISH → RETROSPECTIVE → feed back into ROADMAP/RISKS`
- G1: Use the mapped template instead of inventing document structure.
- G2: Every workflow document starts with: `Status`, `Owner`, `Workflow Version`, `Last Updated`, `Related`, `Traceability` — in that order, as plain `Key: Value` lines before the first heading.
- G3: Owner or Author must always be a human name, not an AI tool.
- G7: If a major design choice is required, create an ADR before implementation.
- G8: Before implementation, define or update validation planning when the change needs verification.
- G9: After implementation, update relevant docs, checklists, and risks so traceability stays current.
- C2: Plan checklists track implementation progress only.
- C3: Never pre-check tasks that are not done.
- CC1: `*_PLAN.md` must include chosen approach, validation strategy, definition of done, and rollback or recovery notes.
<!-- RULES:END -->

Use [plan template](../templates/FEATURE_PLAN.md).

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