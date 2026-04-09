---
description: "Use when: bootstrapping a repository with this workflow and generating the initial documentation set from the current codebase."
argument-hint: "Repository context, domain, or extra constraints"
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
- G4: When asked to draft a workflow document, use the standard prompt pattern: `Task`, `Goal`, `Inputs`, `Output`, `Format`, `Rules`, `Action`.
- G5: For large or risky work, read the relevant project docs first and confirm what is decided, in progress, and next.
- G6: If scope is unclear, create or update analysis before planning.
- G7: If a major design choice is required, create an ADR before implementation.
- G8: Before implementation, define or update validation planning when the change needs verification.
- G9: After implementation, update relevant docs, checklists, and risks so traceability stays current.
- C1: Analysis checklists track decision lifecycle only.
- C2: Plan checklists track implementation progress only.
- C3: Never pre-check tasks that are not done.
- C4: Issue follow-up tasks belong in `*_PLAN.md`, `ROADMAP.md`, or `*_REFACTOR.md`, not in the issue doc itself.
- S1: Load only the docs relevant to the current task: usually `SPEC.md`, `ARCHITECTURE.md`, `ROADMAP.md`, and related analysis, ADR, issue, plan, or test docs.
- CC1: `*_PLAN.md` must include chosen approach, validation strategy, definition of done, and rollback or recovery notes.
- CC2: Skip analysis and go straight to `*_PLAN.md` only when the feature is well-understood, single-phase, low-risk, and limited to one module.
- CC3: Continuous refactoring like renames or small dead-code cleanup needs no workflow doc; broader cleanup needs `*_REFACTOR.md`.
- CC4: `README.md` is not a substitute for technical design docs.
- CC5: Use one rolling `RETROSPECTIVE.md` with dated entries, not separate files per milestone.
- CC6: Architecture docs for deployed systems should cover data model and observability; extract `DATA_MODEL.md` when it becomes large.
<!-- RULES:END -->

Use the mapped templates in [templates](../templates/).

Task:
- Inspect the repository and create or update the initial workflow documentation set.

Goal:
- Establish the project's baseline specification, planning, setup, and supporting docs without turning the full workflow into always-on context.

Inputs:
- Current source tree and existing project docs
- Any requirements or constraints supplied in chat

Output:
- Draft or update the baseline docs that fit the repo maturity, typically `SPEC.md`, `ROADMAP.md`, `ARCHITECTURE.md`, `SETUP.md`, `RISKS.md`, `README.md`, and other core artifacts when justified.

Rules:
When the prompt bundle is installed, prefer `/bootstrap-workflow`, `/feature-analysis`, `/feature-plan`, `/test-plan`, `/quality-review`, `/session-start`, and `/session-end` over pasting long workflow prompts manually.

- Choose the minimal or full document tier based on repository complexity.
- Use the mapped template files instead of inventing structure.
- Mark assumptions, gaps, and open questions explicitly.
- If docs already exist, update them instead of overwriting them blindly.

Action:
- Read the relevant repository context, create or update the baseline docs, and summarize what is still missing and what should happen next.