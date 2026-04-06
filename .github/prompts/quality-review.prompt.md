---
description: "Use when: reviewing current changes for bugs, regressions, maintainability risks, and security issues against the related plan and risks."
argument-hint: "Change scope, feature, or files to review"
agent: "agent"
---
Use [workflow rules](workflow.prompt.md) and the relevant `*_PLAN.md`, `TEST_PLAN.md`, and `RISKS.md`.

Task:
- Review `${input:reviewScope:current changes, feature, or file set}`.

Goal:
- Identify the highest-signal correctness, regression, maintainability, and security issues before the work is considered complete.

Inputs:
- Changed files
- Relevant plan, risks, test plan, issue, and ADR docs

Output:
- A review with findings first, then residual risks or testing gaps.

Rules:
- Prioritize bugs, regressions, security issues, and missing validation over style commentary.
- Use file references and explain why each issue matters.
- If no findings exist, say so explicitly and note remaining testing gaps.
- Do not rewrite large amounts of code unless the task specifically asks for fixes.

Action:
- Inspect the relevant docs and changes, produce the review, and call out the highest-priority next action.