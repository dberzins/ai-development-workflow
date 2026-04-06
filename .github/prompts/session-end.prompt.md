---
description: "Use when: ending a session and updating the workflow docs, checklists, and next-step summary."
argument-hint: "Feature, issue, or milestone being wrapped up"
agent: "agent"
---
Use [workflow rules](workflow.prompt.md) and the docs relevant to `${input:workItem:feature, issue, or milestone}`.

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