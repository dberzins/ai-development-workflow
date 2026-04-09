---
description: "Use when: documenting a discovered issue or design lesson in *_ISSUE.md."
argument-hint: "Issue, problem, or finding to document"
agent: "agent"
---
<!-- RULES:BEGIN — generated from RULES_REGISTRY.md, do not edit manually -->
- CR3: Decisions affecting architecture, scope, or behavior must be recorded.
- CR4: Keep work traceable across `SPEC -> ANALYSIS -> PLAN -> implementation -> release notes`.
- G2: Every workflow document starts with: `Status`, `Owner`, `Workflow Version`, `Last Updated`, `Related`, `Traceability` — in that order, as plain `Key: Value` lines before the first heading.
<!-- RULES:END -->

Use [issue template](../templates/FEATURE_ISSUE.md).

Task:
- Document the problem encountered during `${input:issueContext:this session or phase}`.

Goal:
- Preserve debugging lessons and root cause analysis for future reference. Separate symptoms from diagnosis, record attempted fixes, and capture design implications and follow-up actions.

Inputs:
- Symptoms observed
- Attempted fixes and their outcomes
- Root cause analysis
- Design or architecture implications
- Affected components or files

Output:
- Create or update `<TOPIC>_ISSUE.md` using [templates/FEATURE_ISSUE.md](../templates/FEATURE_ISSUE.md).

Rules:
- Focus on root cause, not just symptoms.
- Document failed attempts if they provide learning value.
- Capture design implications if the issue reveals architectural weakness.
- State recommended follow-up actions (e.g., refactor, test expansion, related issues).
- Use the standard front matter format (`Status`, `Owner`, `Workflow Version`, `Last Updated`, `Related`, `Traceability`).

Action:
- Analyze the problem, document symptoms and root cause, identify design implications, and prepare follow-up actions.
