---
description: "Use when: ending a session and updating the workflow docs, checklists, and next-step summary."
argument-hint: "Feature, issue, or milestone being wrapped up"
agent: "agent"
---
<!-- RULES:BEGIN — generated from RULES_REGISTRY.md, do not edit manually -->
- CR4: Keep work traceable across `SPEC -> ANALYSIS -> PLAN -> implementation -> release notes`.
- CR5: Checklists track execution status; they do not replace technical content.
- CR8: No feature marked complete without validation record and quality review.
- G3: Owner or Author must always be a human name, not an AI tool.
- G9: After implementation, update relevant docs, checklists, and risks so traceability stays current.
- C3: Never pre-check tasks that are not done.
- S1: Load only the docs relevant to the current task: usually `SPEC.md`, `ARCHITECTURE.md`, `ROADMAP.md`, and related analysis, ADR, issue, plan, or test docs.
- S3: At session end, summarize completed and pending work and update the relevant checklists and docs.
<!-- RULES:END -->

Use the docs relevant to `${input:workItem:feature, issue, or milestone}`.

Task:
- Close the session for `${input:workItem:feature, issue, or milestone}`.

Goal:
- Leave the repo and its workflow docs in a consistent handoff state.

Inputs:
- Session changes
- Relevant plan, roadmap, change log, issue, risk, refactor, and test docs

Output:
- A concise close-out summary and updated workflow docs or checklists where needed.

Rules:
- Summarize completed work, pending work, changed artifacts, and newly found issues or risks.
- Update the relevant plan checklist and any affected roadmap, risk, issue, refactor, or change log entries.
- End with the recommended next step for the next session.
- Do not claim validation that was not actually performed.

Action:
- Review the session changes, update the relevant workflow docs, and produce a short handoff summary.