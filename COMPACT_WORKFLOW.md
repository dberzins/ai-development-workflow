Source: WORKFLOW.md (compact human reference — not always-on Copilot context; see RULES_REGISTRY.md for AI workflow rules)
Related: RULES_REGISTRY.md, ADR_001_RULES_REGISTRY.md
Templates: repo-root templates/ (or .github/templates/ if bundled there)

# AI Development Workflow — Compact Reference

Workflow Version: 0.2.0

## Role

This file is the human quick reference for the workflow. It is not intended to be the always-on Copilot instructions layer.

- Use `RULES_REGISTRY.md` for the AI-rules source. Task prompts pull only their relevant rules inline from it via `/re-sync-rules`.
- Use `COMPACT_WORKFLOW.md` when a human wants a quick workflow lookup or wants to attach additional workflow context manually.
- Use `.github/prompts/` for reusable task-specific workflows that should not be loaded on every request.

## Layered Package

| Layer | Artifact | Purpose | Automatic |
|-------|----------|---------|----------|
| AI rules source | `RULES_REGISTRY.md` | Canonical rule text + prompt→rule mapping; re-synced into task prompts | No |
| Task prompts | `.github/prompts/*.prompt.md` | Inline rules + task instructions for each workflow operation | No |
| Templates | `templates/` | Canonical scaffolds for generated documents | No |
| Human quick reference | `COMPACT_WORKFLOW.md` | Readable workflow summary, Document Registry, optional manual context | No |
| Re-sync prompt | `.github/prompts/re-sync-rules.prompt.md` | Regenerates inline rule blocks in task prompts from registry | No |

## Deployment Packages

| Package | Include | Use When |
|---------|---------|----------|
| Minimal | `RULES_REGISTRY.md`, `templates/`, `.github/prompts/` | Lowest token overhead with reliable per-prompt rules |
| Enhanced | Minimal + `COMPACT_WORKFLOW.md` | Team or human-heavy usage where a quick reference should live in the repo |
| Advanced | Enhanced + full `.github/prompts/` suite | Frequent workflow use where reusable slash-command prompts reduce repeated prompting |

When the prompt bundle is installed, prefer `/bootstrap-workflow`, `/feature-analysis`, `/feature-plan`, `/test-plan`, `/quality-review`, `/session-start`, and `/session-end` over pasting long workflow prompts manually.

## Core Principles

1. Every major change starts from a written artifact, not from direct coding.
2. Analysis before planning. Planning before implementation.
3. Each artifact: owner, status, date, clear next action.
4. Decisions affecting architecture, scope, or behavior must be recorded.
5. Features traceable across SPEC → ANALYSIS → PLAN → implementation → release notes.
6. Checklists track execution status, not replace technical content.

## Workflow Sequence

`SPEC → [ARCHITECTURE/SETUP + ROADMAP/RISKS] → ANALYSIS → ADR → PLAN → TEST PLAN → IMPLEMENT → QUALITY/REVIEW → ISSUE/REFACTOR → DOCS UPDATE → PUBLISH → RETROSPECTIVE → feed back into ROADMAP/RISKS`

## Document Registry with Dependencies

> This table is the authoritative Document Registry. It lives here so it is available as human
> reference without being injected as AI token overhead on every prompt invocation.

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

## Document Location (`docs/`)

Dev docs are organized into domain directories under `docs/`:

| Directory | Domain |
|-----------|--------|
| `infra/` | CI, workflow, tooling, dev setup, testing infrastructure |
| `publish/` | Publishing, release, legal, branding |
| `refactor/` | Cross-domain refactors |
| `issue/` | Cross-domain issues |
| `_archive/` | Stale or superseded docs |

Rules:
- ADRs (`ADR_###_TITLE.md`) stay at `docs/` top level.
- File naming: `<FEATURE>_<TYPE>.md` where TYPE is ANALYSIS, PLAN, ISSUE, REFACTOR, or REF.
- Domain-specific issues/refactors go in their domain dir.
- Cross-domain issues/refactors go in `issue/` or `refactor/`.
- Superseded docs move to `_archive/`.
- New domains can be added when a topic accumulates ≥ 3 docs.

## Template Use

Use the repository-root `templates/` directory as the canonical source for document scaffolds in this repo. Because the Copilot instructions file commonly lives in `.github/`, `templates/` means the top-level `templates/` folder, not `.github/templates/`, unless a target repo explicitly bundles templates there.

- For fixed-name artifacts, use the same filename from `templates/`: `SPEC.md`, `ROADMAP.md`, `ARCHITECTURE.md`, `SETUP.md`, `RISKS.md`, `TEST_PLAN.md`, `README.md`, `API_REFERENCE.md`, `CHANGELOG.md`, `PUBLISH.md`, `DEPLOYMENT.md`, `DATA_MODEL.md`, `RETROSPECTIVE.md`.
- Use `templates/FEATURE_ANALYSIS.md` for `<FEATURE>_ANALYSIS.md`.
- Use `templates/FEATURE_PLAN.md` for `<FEATURE>_PLAN.md`.
- Use `templates/ADR.md` for `ADR_###_TITLE.md` or `DECISIONS.md`.
- Use `templates/FEATURE_ISSUE.md` for `<TOPIC>_ISSUE.md`.
- Use `templates/FEATURE_REFACTOR.md` for `<AREA>_REFACTOR.md`.
- Use `templates/FEATURE_DOC.md` for `<FEATURE>_DOC.md`.
- If the project uses `ENVIRONMENT.md`, start from `templates/SETUP.md`.
- If the project uses `QA.md`, start from `templates/TEST_PLAN.md`.

## Document Tiers

**Minimal** (small projects, prototypes, solo work): SPEC, ROADMAP, README, CHANGELOG, *_PLAN.

**Full** (production, public repos, teams, audits): All documents from registry above.

When uncertain, default to full tier.

## Standard Prompt Pattern

```text
Task: <what needs to be produced>
Goal: <why this is needed>
Inputs: <files, requirements, decisions, constraints>
Output: <target file name>
Format: <required sections, checklist, table, diagram>
Rules: <quality bar, exclusions, assumptions>
Action: <analyze only | draft doc | update code and docs>
```

## Prompt Reference

| Action | Prompt |
|--------|--------|
| Project bootstrap | `Create the initial project documentation set for this repository from the current files and note assumptions, gaps, and open questions.` |
| Feature analysis | `Create <FEATURE>_ANALYSIS.md using the current codebase and project docs, compare options, recommend one, and note risks.` |
| Planning | `Create <FEATURE>_PLAN.md from the approved analysis with phases, validation, dependencies, risks, and a checklist.` |
| Implementation | `Implement the approved plan phase, summarize the phase before editing, then update docs, checklists, and validation artifacts after changes.` |
| Validation plan | `Prepare or update TEST_PLAN.md for <feature or release> with unit, integration, end-to-end, manual checks, and exit criteria.` |
| Quality review | `Review this session's changes for bugs, regressions, maintainability issues, and security concerns against the related plan and risks.` |
| Issue capture | `Document the problem in <ISSUE>_ISSUE.md with symptoms, root cause, attempted fixes, final resolution, and follow-up actions.` |
| Refactor review | `Review the current implementation for duplication, weak abstractions, dead code, and complexity, then prepare <AREA>_REFACTOR.md.` |
| Session start | `Load context from the relevant project docs, confirm current status, and identify the next action for <feature, issue, or milestone>.` |
| Session end | `Summarize the session, update the relevant checklists and docs, record issues or risks, and state the recommended next step.` |
| Publish readiness | `Prepare or update PUBLISH.md by checking documentation, publish-time identity decisions, versioning, tests, CI, licensing, secrets, and remaining blockers.` |
| Retrospective | `Prepare RETROSPECTIVE.md for the completed milestone or release with what worked, what failed, and next process improvements.` |

## Session Management

**Start:**

```text
Load context from SPEC.md, ARCHITECTURE.md, ROADMAP.md, and any related analysis, ADR, issue, plan, or test documents.
We are working on <feature, issue, or milestone>.
Current status: <brief status>.
Confirm what is already decided, what is in progress, and what should happen next.
```

**End:**

```text
Summarize this session: what was completed, what is still pending, what changed, and any issues or risks found.
Update the relevant plan checklist, ROADMAP.md, CHANGELOG.md, and any issue, risk, or refactor documents that should reflect the current state.
List the recommended next step for the next session.
```

## Governance Rules

1. No large features without a related analysis or plan.
2. No major architectural choices without an ADR or recorded decision.
3. No feature marked complete without validation record and quality review.
4. No issues closed without root cause and fix summary.
5. No publishing without PUBLISH.md review.
6. No treating README.md as a substitute for technical design docs.
7. No stale checklists, risk entries, or traceability links after a session.
8. No duplicate feature names across artifacts.

## Key Rules

### Publish scope

- Branding is a publish-time identity decision or pre-publish hardening task.
- Versioning is a cross-cutting rule; Publish is the release checkpoint that verifies consistency across docs, metadata, and release artifacts.

### Checklist scoping

- Analysis checklist tracks the decision lifecycle (options evaluated, option chosen, ADR created, plan created) — never implementation steps.
- Plan checklist tracks implementation progress only.
- Issue docs do not carry checklists unless used as a temporary execution artifact.
- Never pre-check planned tasks; only mark actually completed work.

### Skip and escalation

- Skip analysis and go straight to `*_PLAN.md` when: feature is well-understood, no arch decision needed, single phase, low risk, one module.
- Upgrade from minimal to full document tier when: production deployment, public repo, team > 1, audit requirements, or complex architecture.
- Continuous refactoring (rename, extract method, remove obvious dead code) needs no document. Multi-file, arch-pattern, or debt-driven cleanup needs `*_REFACTOR.md`.

### Cross-document routing

- If scope is unclear → create or update analysis before planning.
- If a major design choice is required → create an ADR before implementation.
- Before implementation → define or update validation planning.
- After implementation → update relevant docs, checklists, and risks.
- Issue follow-up tasks must be moved to `*_PLAN.md`, `ROADMAP.md`, or `*_REFACTOR.md` — not left in the issue.
- Retrospective action items go to `ROADMAP.md`; new risks go to `RISKS.md`.
- Use one rolling `RETROSPECTIVE.md` with dated sections, not separate files per milestone.

### Content constraints

- Plan must include: chosen approach, validation strategy, definition of done, rollback notes.
- Architecture must include Data Model section for persistent storage (extract to `DATA_MODEL.md` when large) and Observability for deployed projects.
- `README.md` is not a substitute for technical design docs.
- Owner/Author field is always a human name, never an AI tool.
- Quality review findings must be resolved or tracked before marking work complete.

## Document Metadata

Every document starts with:

```text
Status: Draft | In Progress | Reviewed | Done
Owner: <human name>
Workflow Version: <x.y.z>
Last Updated: YYYY-MM-DD
Related: <other docs>
Traceability: <upstream -> current -> downstream>
```

Use the value from the repo-root `VERSION` file for `Workflow Version`.

## Source Control

- Trunk-based development on `main` (single source of truth)
- Feature branches from `main`; no enforced naming conventions
- Squash merge feature branches into `main`
- [Conventional Commits](https://www.conventionalcommits.org/): `feat`, `fix`, `docs`, `refactor`, `test`, `chore`
- Branch protection: require squash merges; enable required checks when CI is configured
