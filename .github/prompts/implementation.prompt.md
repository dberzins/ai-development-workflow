---
description: "Use when: executing an approved implementation plan, phase by phase, with checklist updates and artifact synchronization."
argument-hint: "Feature or plan to implement"
agent: "agent"
---
<!-- RULES:BEGIN — generated from RULES_REGISTRY.md, do not edit manually -->
- CR4: Keep work traceable across `SPEC -> ANALYSIS -> PLAN -> implementation -> release notes`.
- CR5: Checklists track execution status; they do not replace technical content.
- CR8: No feature marked complete without validation record and quality review.
- G9: After implementation, update relevant docs, checklists, and risks so traceability stays current.
- C3: Never pre-check tasks that are not done.
<!-- RULES:END -->

Use the approved `<FEATURE>_PLAN.md`.

Task:
- Implement the approved `${input:planToExecute:<FEATURE>_PLAN.md phase}`.

Goal:
- Execute the plan phase by phase. Before editing, summarize the phase being executed and the validation that will confirm it. After changes, update the plan checklist, relevant feature docs, risks if needed, test or QA docs, and CHANGELOG.md.

Inputs:
- Approved `<FEATURE>_PLAN.md` or `<TOPIC>_PLAN.md`
- Related analysis, ADR, and architecture docs
- Current implementation and test coverage

Output:
- Code changes
- Updated plan checklist (mark the phase complete, update any risk notes)
- Updated CHANGELOG.md with feature progress
- Updated feature docs, test docs, and risks as needed

Rules:
- Phases are sequential; do not skip validation steps.
- Before editing code, summarize the phase and validation strategy to confirm understanding.
- After changes, synchronize all related artifacts (plan checklist, test docs, feature docs, CHANGELOG).
- If a phase reveals new risks, update RISKS.md immediately.
- If validation fails, capture the issue in an *_ISSUE.md before continuing.

Action:
- Summarize the approved phase, execute changes, update checklists and artifacts, and prepare the next phase for review.
