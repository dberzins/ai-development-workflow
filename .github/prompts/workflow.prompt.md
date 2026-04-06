---
description: "AI Development Workflow rules — templates, document guardrails, checklists, session guidance"
---
<!-- Source: WORKFLOW.md — regenerate when WORKFLOW.md changes materially -->
<!-- Templates: .github/templates/ (this repo bundles templates there) -->

# AI Development Workflow

Use this file only for workflow rules that should apply to most Copilot requests. Keep detailed human reference material in `COMPACT_WORKFLOW.md` and task-specific workflows in `.github/prompts/`.

## Core Rules

1. Every major change starts from a written artifact, not from direct coding.
2. Analysis before planning. Planning before implementation.
3. Decisions affecting architecture, scope, or behavior must be recorded.
4. Keep work traceable across `SPEC -> ANALYSIS -> PLAN -> implementation -> release notes`.
5. Checklists track execution status; they do not replace technical content.
6. No large features without a related analysis or plan.
7. No major architectural choices without an ADR or recorded decision.
8. No feature marked complete without validation record and quality review.

## Workflow Sequence

`SPEC → [ARCHITECTURE/SETUP + ROADMAP/RISKS] → ANALYSIS → ADR → PLAN → TEST PLAN → IMPLEMENT → QUALITY/REVIEW → ISSUE/REFACTOR → DOCS UPDATE → PUBLISH → RETROSPECTIVE → feed back into ROADMAP/RISKS`

## Document Registry

| Document | Pattern | Requires | Required by | Checklist |
|----------|---------|----------|-------------|-----------|
| Specification | `SPEC.md` | — | ARCHITECTURE, ROADMAP, *_ANALYSIS | Yes |
| Roadmap | `ROADMAP.md` | SPEC | *_ANALYSIS, PUBLISH | Yes |
| Architecture | `ARCHITECTURE.md` | SPEC, *_REFACTOR | *_ANALYSIS, DEPLOYMENT, DATA_MODEL | No |
| Setup | `SETUP.md` | — | README | No |
| Risks | `RISKS.md` | *_ISSUE | *_ANALYSIS, *_PLAN, TEST_PLAN | No |
| Analysis | `<F>_ANALYSIS.md` | SPEC, ARCH, ROADMAP, RISKS, *_ISSUE | ADR, *_PLAN | Yes |
| Decision | `ADR_###_TITLE.md` | *_ANALYSIS | *_PLAN | No |
| Plan | `<F>_PLAN.md` | *_ANALYSIS, ADR, RISKS, *_ISSUE, *_REFACTOR | TEST_PLAN, *_DOC, CHANGELOG | Yes |
| Test Plan | `TEST_PLAN.md` | *_PLAN, RISKS | PUBLISH | No |
| Issue | `<T>_ISSUE.md` | — | *_ANALYSIS, *_PLAN, RISKS | No |
| Refactor | `<A>_REFACTOR.md` | — | *_PLAN, ARCHITECTURE | Yes |
| Feature Doc | `<F>_DOC.md` | *_PLAN | README, API_REFERENCE | No |
| README | `README.md` | SETUP, *_DOC | PUBLISH | No |
| API Reference | `API_REFERENCE.md` | *_DOC | PUBLISH | No |
| Change Log | `CHANGELOG.md` | *_PLAN | PUBLISH | No |
| Publish | `PUBLISH.md` | ROADMAP, TEST_PLAN, API_REF, README, CHANGELOG, DEPLOYMENT | RETROSPECTIVE | Yes |
| Deployment | `DEPLOYMENT.md` | ARCHITECTURE | PUBLISH | No |
| Data Model | `DATA_MODEL.md` | ARCHITECTURE | — | No |
| Retrospective | `RETROSPECTIVE.md` | PUBLISH | — (feeds back into ROADMAP, RISKS) | No |

## Template Use

This repo bundles templates in `.github/templates/`. Use that directory as the canonical source for document scaffolds.

- For fixed-name artifacts, use the same filename from `.github/templates/`: `SPEC.md`, `ROADMAP.md`, `ARCHITECTURE.md`, `SETUP.md`, `RISKS.md`, `TEST_PLAN.md`, `README.md`, `API_REFERENCE.md`, `CHANGELOG.md`, `PUBLISH.md`, `DEPLOYMENT.md`, `DATA_MODEL.md`, `RETROSPECTIVE.md`.
- Use `.github/templates/FEATURE_ANALYSIS.md` for `<FEATURE>_ANALYSIS.md`.
- Use `.github/templates/FEATURE_PLAN.md` for `<FEATURE>_PLAN.md`.
- Use `.github/templates/ADR.md` for `ADR_###_TITLE.md` or `DECISIONS.md`.
- Use `.github/templates/FEATURE_ISSUE.md` for `<TOPIC>_ISSUE.md`.
- Use `.github/templates/FEATURE_REFACTOR.md` for `<AREA>_REFACTOR.md`.
- Use `.github/templates/FEATURE_DOC.md` for `<FEATURE>_DOC.md`.
- If the project uses `ENVIRONMENT.md`, start from `.github/templates/SETUP.md`.
- If the project uses `QA.md`, start from `.github/templates/TEST_PLAN.md`.

## Document Guardrails

- Use the mapped template instead of inventing document structure.
- Every workflow document starts with:

```text
Status: Draft | In Progress | Reviewed | Done
Owner: <human name>
Workflow Version: <x.y.z>
Last Updated: YYYY-MM-DD
Related: <other docs>
Traceability: <upstream -> current -> downstream>
```

- Owner or Author must always be a human name, not an AI tool.
- When asked to draft a workflow document, use the standard prompt pattern: `Task`, `Goal`, `Inputs`, `Output`, `Format`, `Rules`, `Action`.
- For large or risky work, read the relevant project docs first and confirm what is decided, in progress, and next.
- If scope is unclear, create or update analysis before planning.
- If a major design choice is required, create an ADR before implementation.
- Before implementation, define or update validation planning when the change needs verification.
- After implementation, update relevant docs, checklists, and risks so traceability stays current.

## Checklist Rules

- Analysis checklists track decision lifecycle only.
- Plan checklists track implementation progress only.
- Never pre-check tasks that are not done.
- Issue follow-up tasks belong in `*_PLAN.md`, `ROADMAP.md`, or `*_REFACTOR.md`, not in the issue doc itself.

## Session Guidance

- Load only the docs relevant to the current task: usually `SPEC.md`, `ARCHITECTURE.md`, `ROADMAP.md`, and related analysis, ADR, issue, plan, or test docs.
- At session start, confirm current status, decisions, work in progress, and next action.
- At session end, summarize completed and pending work and update the relevant checklists and docs.

## Content Constraints

- `*_PLAN.md` must include chosen approach, validation strategy, definition of done, and rollback or recovery notes.
- Skip analysis and go straight to `*_PLAN.md` only when the feature is well-understood, single-phase, low-risk, and limited to one module.
- Continuous refactoring like renames or small dead-code cleanup needs no workflow doc; broader cleanup needs `*_REFACTOR.md`.
- `README.md` is not a substitute for technical design docs.
- Use one rolling `RETROSPECTIVE.md` with dated entries, not separate files per milestone.
- Architecture docs for deployed systems should cover data model and observability; extract `DATA_MODEL.md` when it becomes large.
