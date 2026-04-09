---
description: "Use when: capturing lessons from a completed milestone or release in RETROSPECTIVE.md."
argument-hint: "Milestone, release, or time period to reflect on"
agent: "agent"
---
<!-- RULES:BEGIN — generated from RULES_REGISTRY.md, do not edit manually -->
- CR4: Keep work traceable across `SPEC -> ANALYSIS -> PLAN -> implementation -> release notes`.
- WS1: `SPEC → [ARCHITECTURE/SETUP + ROADMAP/RISKS] → ANALYSIS → ADR → PLAN → TEST PLAN → IMPLEMENT → QUALITY/REVIEW → ISSUE/REFACTOR → DOCS UPDATE → PUBLISH → RETROSPECTIVE → feed back into ROADMAP/RISKS`
<!-- RULES:END -->

Use [retrospective template](../templates/RETROSPECTIVE.md).

Task:
- Prepare a retrospective for `${input:milestoneOrRelease:<completed milestone or release>}`.

Goal:
- Extract reusable lessons and feed insights back into ROADMAP.md and RISKS.md. Summarize what worked, what failed, which workflow steps were weak, and what process changes should be applied next.

Inputs:
- Project timeline and completed features
- Blockers and issues encountered
- Test coverage and quality metrics
- Team feedback and process observations
- ROADMAP.md and RISKS.md (to understand what was planned vs. what happened)

Output:
- Update `RETROSPECTIVE.md` using [templates/RETROSPECTIVE.md](../templates/RETROSPECTIVE.md). Use one rolling file with dated sections, not separate per-milestone files.

Rules:
- Focus on reusable lessons, not blame or individual performance.
- Include: what worked, what failed, which risks materialized, which workflow steps were missing or weak.
- Action items from the retrospective feed directly into ROADMAP.md (next priorities) and RISKS.md (risks to watch).
- Use a rolling RETROSPECTIVE.md with dated sections; do not create separate files per milestone.
- Link to related analysis, plans, test reports, and quality reviews.

Action:
- Summarize the milestone: successes, failures, surprises, and recommended process changes. Feed results back into ROADMAP and RISKS.
