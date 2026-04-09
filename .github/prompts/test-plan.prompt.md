---
description: "Use when: preparing or updating TEST_PLAN.md for a feature, milestone, or release."
argument-hint: "Feature, milestone, or release to validate"
agent: "agent"
---
<!-- RULES:BEGIN — generated from RULES_REGISTRY.md, do not edit manually -->
- CR8: No feature marked complete without validation record and quality review.
- WS1: `SPEC → [ARCHITECTURE/SETUP + ROADMAP/RISKS] → ANALYSIS → ADR → PLAN → TEST PLAN → IMPLEMENT → QUALITY/REVIEW → ISSUE/REFACTOR → DOCS UPDATE → PUBLISH → RETROSPECTIVE → feed back into ROADMAP/RISKS`
- G1: Use the mapped template instead of inventing document structure.
- G2: Every workflow document starts with: `Status`, `Owner`, `Workflow Version`, `Last Updated`, `Related`, `Traceability` — in that order, as plain `Key: Value` lines before the first heading.
- G3: Owner or Author must always be a human name, not an AI tool.
- G8: Before implementation, define or update validation planning when the change needs verification.
- C2: Plan checklists track implementation progress only.
- C3: Never pre-check tasks that are not done.
- CC1: `*_PLAN.md` must include chosen approach, validation strategy, definition of done, and rollback or recovery notes.
<!-- RULES:END -->

Use [test plan template](../templates/TEST_PLAN.md).

Task:
- Prepare or update the test plan for `${input:scope:feature, milestone, or release}`.

Goal:
- Define the validation needed before the work can be considered complete or publishable.

Inputs:
- Related `*_PLAN.md`
- `RISKS.md`
- Relevant specs, ADRs, and implementation constraints

Output:
- Create or update `TEST_PLAN.md` using [templates/TEST_PLAN.md](../templates/TEST_PLAN.md).

Rules:
- Cover automated and manual validation as appropriate.
- Include scope, test levels, test cases, manual validation, exit criteria, and open gaps.
- Tie test coverage to known risks and planned work.
- State explicitly what is out of scope or deferred.

Action:
- Load the relevant docs, draft the validation plan, and highlight any untested high-risk areas.