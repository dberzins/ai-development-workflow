---
description: "Use when: preparing or updating TEST_PLAN.md for a feature, milestone, or release."
argument-hint: "Feature, milestone, or release to validate"
agent: "agent"
---
Use [workflow rules](workflow.prompt.md) and [test plan template](../templates/TEST_PLAN.md).

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