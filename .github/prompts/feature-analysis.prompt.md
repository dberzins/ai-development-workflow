---
description: "Use when: analyzing a feature, issue, or milestone and creating a <FEATURE>_ANALYSIS.md with options, trade-offs, and a recommendation."
argument-hint: "Feature, issue, or milestone to analyze"
agent: "agent"
---
<!-- RULES:BEGIN — generated from RULES_REGISTRY.md, do not edit manually -->
- CR1: Every major change starts from a written artifact, not from direct coding.
- CR2: Analysis before planning. Planning before implementation.
- CR3: Decisions affecting architecture, scope, or behavior must be recorded.
- CR4: Keep work traceable across `SPEC -> ANALYSIS -> PLAN -> implementation -> release notes`.
- CR5: Checklists track execution status; they do not replace technical content.
- CR6: No large features without a related analysis or plan.
- CR7: No major architectural choices without an ADR or recorded decision.
- CR8: No feature marked complete without validation record and quality review.
- WS1: `SPEC → [ARCHITECTURE/SETUP + ROADMAP/RISKS] → ANALYSIS → ADR → PLAN → TEST PLAN → IMPLEMENT → QUALITY/REVIEW → ISSUE/REFACTOR → DOCS UPDATE → PUBLISH → RETROSPECTIVE → feed back into ROADMAP/RISKS`
- G1: Use the mapped template instead of inventing document structure.
- G2: Every workflow document starts with: `Status`, `Owner`, `Workflow Version`, `Last Updated`, `Related`, `Traceability` — in that order, as plain `Key: Value` lines before the first heading.
- G3: Owner or Author must always be a human name, not an AI tool.
- G5: For large or risky work, read the relevant project docs first and confirm what is decided, in progress, and next.
- G6: If scope is unclear, create or update analysis before planning.
- G7: If a major design choice is required, create an ADR before implementation.
- C1: Analysis checklists track decision lifecycle only.
- C3: Never pre-check tasks that are not done.
- CC2: Skip analysis and go straight to `*_PLAN.md` only when the feature is well-understood, single-phase, low-risk, and limited to one module.
<!-- RULES:END -->

Use [analysis template](../templates/FEATURE_ANALYSIS.md).

Task:
- Prepare analysis for `${input:featureOrIssue:feature, issue, or milestone}`.

Goal:
- Compare viable options, identify risks and prerequisites, and recommend one approach.

Inputs:
- `SPEC.md`, `ARCHITECTURE.md`, `ROADMAP.md`, `RISKS.md`
- Related issue, refactor, plan, or ADR docs
- Current implementation for the target area

Output:
- Create or update `<FEATURE>_ANALYSIS.md` using [templates/FEATURE_ANALYSIS.md](../templates/FEATURE_ANALYSIS.md).

Rules:
- Use uppercase snake case for feature-specific file names.
- Keep the checklist focused on decision lifecycle, not implementation tasks.
- Add `Source` and `Decision` sections and identify whether an ADR is needed.
- If critical upstream context is missing, state the gap instead of inventing decisions.

Action:
- Load only the relevant docs and code, draft the analysis, and summarize the recommendation.