---
description: "Use when: recording a major architecture or design decision in an ADR (Architecture Decision Record)."
argument-hint: "Decision, feature, or architecture choice to record"
agent: "agent"
---
<!-- RULES:BEGIN — generated from RULES_REGISTRY.md, do not edit manually -->
- CR3: Decisions affecting architecture, scope, or behavior must be recorded.
- CR4: Keep work traceable across `SPEC -> ANALYSIS -> PLAN -> implementation -> release notes`.
- CR7: No major architectural choices without an ADR or recorded decision.
- WS1: `SPEC → [ARCHITECTURE/SETUP + ROADMAP/RISKS] → ANALYSIS → ADR → PLAN → TEST PLAN → IMPLEMENT → QUALITY/REVIEW → ISSUE/REFACTOR → DOCS UPDATE → PUBLISH → RETROSPECTIVE → feed back into ROADMAP/RISKS`
<!-- RULES:END -->

Use [ADR template](../templates/ADR.md).

Task:
- Record the decision for `${input:decision:<feature or architecture change>}`.

Goal:
- Preserve the rationale and context for major architecture, design, and scope decisions. Keep choices visible and auditable after implementation concludes. Link decisions to related analysis, plans, and code.

Inputs:
- Approved analysis document (e.g., `<FEATURE>_ANALYSIS.md`)
- Current architecture and related ADRs
- Decision context and trade-offs considered

Output:
- Create `ADR_###_TITLE.md` using [templates/ADR.md](../templates/ADR.md).

Rules:
- Create an ADR only for decisions affecting architecture, deployment, public interfaces, or long-term maintenance.
- Record the decision context, alternatives considered, chosen approach, and consequences.
- Link the ADR to related analysis, plan, implementation, and test artifacts.
- Status should be `Draft` if pending approval, or appropriate (Accepted, Superseded, Deprecated) if finalized.
- Include links to the issue/analysis that prompted the decision.

Action:
- Capture the decision context, alternatives, consequences, and justification. Link to related artifacts.
