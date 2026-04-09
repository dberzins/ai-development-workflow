Source: WORKFLOW.md — review this file when WORKFLOW.md changes materially
Last Updated: 2026-04-08

# Rules Registry

This file is the authoritative AI-rules source for all `.github/prompts/` task prompts.
Do not edit rule text directly in task prompt files — edit it here, then re-sync.

## Re-sync Instructions

To update the inline rules block in a task prompt after a rule change:

1. Edit the rule text or mapping in this file.
2. Run: `/re-sync-rules` and specify the target prompt name (or "all" for all prompts).
3. The AI will replace the content between `<!-- RULES:BEGIN -->` and `<!-- RULES:END -->`
   in that prompt file with the canonical text for the mapped rule IDs.

**Do not edit `<!-- RULES:BEGIN -->` / `<!-- RULES:END -->` blocks in prompt files
manually. Those blocks are generated artifacts — manual edits will be overwritten.**

## Rule Definitions

### Core Rules

| ID  | Canonical Text |
|-----|----------------|
| CR1 | Every major change starts from a written artifact, not from direct coding. |
| CR2 | Analysis before planning. Planning before implementation. |
| CR3 | Decisions affecting architecture, scope, or behavior must be recorded. |
| CR4 | Keep work traceable across `SPEC -> ANALYSIS -> PLAN -> implementation -> release notes`. |
| CR5 | Checklists track execution status; they do not replace technical content. |
| CR6 | No large features without a related analysis or plan. |
| CR7 | No major architectural choices without an ADR or recorded decision. |
| CR8 | No feature marked complete without validation record and quality review. |

### Workflow Sequence

| ID  | Canonical Text |
|-----|----------------|
| WS1 | `SPEC → [ARCHITECTURE/SETUP + ROADMAP/RISKS] → ANALYSIS → ADR → PLAN → TEST PLAN → IMPLEMENT → QUALITY/REVIEW → ISSUE/REFACTOR → DOCS UPDATE → PUBLISH → RETROSPECTIVE → feed back into ROADMAP/RISKS` |

### Document Guardrails

| ID  | Canonical Text |
|-----|----------------|
| G1  | Use the mapped template instead of inventing document structure. |
| G2  | Every workflow document starts with: `Status`, `Owner`, `Workflow Version`, `Last Updated`, `Related`, `Traceability` — in that order, as plain `Key: Value` lines before the first heading. |
| G3  | Owner or Author must always be a human name, not an AI tool. |
| G4  | When asked to draft a workflow document, use the standard prompt pattern: `Task`, `Goal`, `Inputs`, `Output`, `Format`, `Rules`, `Action`. |
| G5  | For large or risky work, read the relevant project docs first and confirm what is decided, in progress, and next. |
| G6  | If scope is unclear, create or update analysis before planning. |
| G7  | If a major design choice is required, create an ADR before implementation. |
| G8  | Before implementation, define or update validation planning when the change needs verification. |
| G9  | After implementation, update relevant docs, checklists, and risks so traceability stays current. |

### Checklist Rules

| ID  | Canonical Text |
|-----|----------------|
| C1  | Analysis checklists track decision lifecycle only. |
| C2  | Plan checklists track implementation progress only. |
| C3  | Never pre-check tasks that are not done. |
| C4  | Issue follow-up tasks belong in `*_PLAN.md`, `ROADMAP.md`, or `*_REFACTOR.md`, not in the issue doc itself. |

### Session Guidance

| ID  | Canonical Text |
|-----|----------------|
| S1  | Load only the docs relevant to the current task: usually `SPEC.md`, `ARCHITECTURE.md`, `ROADMAP.md`, and related analysis, ADR, issue, plan, or test docs. |
| S2  | At session start, confirm current status, decisions, work in progress, and next action. |
| S3  | At session end, summarize completed and pending work and update the relevant checklists and docs. |

### Content Constraints

| ID  | Canonical Text |
|-----|----------------|
| CC1 | `*_PLAN.md` must include chosen approach, validation strategy, definition of done, and rollback or recovery notes. |
| CC2 | Skip analysis and go straight to `*_PLAN.md` only when the feature is well-understood, single-phase, low-risk, and limited to one module. |
| CC3 | Continuous refactoring like renames or small dead-code cleanup needs no workflow doc; broader cleanup needs `*_REFACTOR.md`. |
| CC4 | `README.md` is not a substitute for technical design docs. |
| CC5 | Use one rolling `RETROSPECTIVE.md` with dated entries, not separate files per milestone. |
| CC6 | Architecture docs for deployed systems should cover data model and observability; extract `DATA_MODEL.md` when it becomes large. |
| CC7 | Do not reference or record gitignored-path artifacts in any versioned document (`README.md`, `WORKFLOW.md`, `SETUP.md`, `CHANGELOG.md`, `CONTRIBUTING.md`, etc.). Internal work in gitignored locations is invisible to version control and released packages. |

## Prompt → Rule Mapping

A ✓ means the rule is included in that prompt's `RULES:BEGIN/END` block.

| ID  | feature-analysis | feature-plan | implementation | issue-capture | decision-record | refactor-review | publish-readiness | retrospective | session-start | session-end | quality-review | test-plan | bootstrap-workflow |
|-----|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| CR1 | ✓ | ✓ |   |   |   |   |   |   | ✓ |   |   |   | ✓ |
| CR2 | ✓ | ✓ |   |   |   |   |   |   | ✓ |   |   |   | ✓ |
| CR3 | ✓ | ✓ |   | ✓ | ✓ |   |   |   | ✓ |   | ✓ |   | ✓ |
| CR4 | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |   | ✓ |
| CR5 | ✓ | ✓ | ✓ |   |   |   |   |   |   | ✓ |   |   | ✓ |
| CR6 | ✓ |   |   |   |   |   |   |   |   |   |   |   | ✓ |
| CR7 | ✓ |   |   |   | ✓ |   |   |   |   |   |   |   | ✓ |
| CR8 | ✓ |   | ✓ |   |   |   |   |   |   | ✓ | ✓ | ✓ | ✓ |
| WS1 | ✓ | ✓ |   |   | ✓ |   |   | ✓ | ✓ |   |   | ✓ | ✓ |
| G1  | ✓ | ✓ |   |   |   |   |   |   |   |   |   | ✓ | ✓ |
| G2  | ✓ | ✓ |   | ✓ |   |   |   |   |   |   |   | ✓ | ✓ |
| G3  | ✓ | ✓ |   |   |   |   |   |   |   | ✓ |   | ✓ | ✓ |
| G4  |   |   |   |   |   |   |   |   |   |   |   |   | ✓ |
| G5  | ✓ |   |   |   |   |   | ✓ |   | ✓ |   |   |   | ✓ |
| G6  | ✓ |   |   |   |   |   |   |   | ✓ |   |   |   | ✓ |
| G7  | ✓ | ✓ |   |   | ✓ |   |   |   |   |   |   |   | ✓ |
| G8  |   | ✓ |   |   |   |   |   |   |   |   |   | ✓ | ✓ |
| G9  |   | ✓ | ✓ |   |   | ✓ |   |   |   | ✓ | ✓ |   | ✓ |
| C1  | ✓ |   |   |   |   |   |   |   |   |   |   |   | ✓ |
| C2  |   | ✓ |   |   |   |   |   |   |   |   |   | ✓ | ✓ |
| C3  | ✓ | ✓ | ✓ |   |   |   |   |   | ✓ | ✓ | ✓ | ✓ | ✓ |
| C4  |   |   |   |   |   |   |   |   |   |   |   |   | ✓ |
| S1  |   |   |   |   |   |   |   |   | ✓ | ✓ |   |   | ✓ |
| S2  |   |   |   |   |   |   |   |   | ✓ |   |   |   |   |
| S3  |   |   |   |   |   |   |   |   |   | ✓ |   |   |   |
| CC1 |   | ✓ |   |   |   |   |   |   |   |   |   | ✓ | ✓ |
| CC2 | ✓ |   |   |   |   |   |   |   |   |   |   |   | ✓ |
| CC3 |   |   |   |   |   |   |   |   |   |   |   |   | ✓ |
| CC4 |   |   |   |   |   |   |   |   |   |   |   |   | ✓ |
| CC5 |   |   |   |   |   |   |   |   |   |   |   |   | ✓ |
| CC6 |   |   |   |   |   |   |   |   |   |   |   |   | ✓ |
| CC7 |   |   |   |   |   |   |   |   |   |   |   |   | ✓ |
| **Count** | **17** | **15** | **6** | **4** | **7** | **4** | **5** | **5** | **9** | **8** | **5** | **9** | **25** |
