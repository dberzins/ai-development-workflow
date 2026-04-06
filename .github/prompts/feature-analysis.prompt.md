---
description: "Use when: analyzing a feature, issue, or milestone and creating a <FEATURE>_ANALYSIS.md with options, trade-offs, and a recommendation."
argument-hint: "Feature, issue, or milestone to analyze"
agent: "agent"
---
Use [workflow rules](workflow.prompt.md) and [analysis template](../templates/FEATURE_ANALYSIS.md).

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