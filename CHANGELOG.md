# Change Log

## 0.2.0 — 2026-04-09

### Added

- `RULES_REGISTRY.md` — authoritative AI-rules source with 31 rules and stable IDs
  (CR1–CR8, WS1, G1–G9, C1–C4, S1–S3, CC1–CC7), canonical text, and a prompt→rule
  mapping table.
- 6 new task prompts to complete workflow prompt coverage:
  `.github/prompts/implementation.prompt.md` — execute approved plans phase by phase.
  `.github/prompts/issue-capture.prompt.md` — document debugging findings and root causes.
  `.github/prompts/decision-record.prompt.md` — create architecture decision records (ADRs).
  `.github/prompts/refactor-review.prompt.md` — analyze code and prepare refactor plans.
  `.github/prompts/publish-readiness.prompt.md` — verify release readiness and blockers.
  `.github/prompts/retrospective.prompt.md` — capture post-milestone lessons and improvements.
- `.github/prompts/re-sync-rules.prompt.md` — slash command to regenerate the inline
  rules block in any task prompt from the registry.
- `## Quick-Start Command Mapping` table in `WORKFLOW.md` linking all workflow steps
  to corresponding prompt files.
- `## Rule Traceability` section in `WORKFLOW.md` mapping all six rule groups
  (CR, WS, G, C, S, CC) to their originating sections.

### Changed

- Replaced shared `workflow.prompt.md` AI-rules injection with per-prompt inline rule
  blocks, reducing suite token cost by 65% (12,839 → 4,444 tokens across 7 prompts).
- All 7 task prompts updated with `<!-- RULES:BEGIN -->` / `<!-- RULES:END -->` blocks
  containing only the rules relevant to each prompt.
- Updated `WORKFLOW.md` Usage section to reflect the rules-registry architecture.
- Updated `WORKFLOW.md` Minimal bootstrap package to list `RULES_REGISTRY.md` and
  `.github/prompts/` instead of the retired `workflow.prompt.md`.
- Moved Document Registry table ownership to `COMPACT_WORKFLOW.md`; updated Role and
  Layered Package sections.
- Added optional rule ID annotations to Governance Rules bullets.
- Updated `CONTRIBUTING.md`: do not edit `RULES:BEGIN/END` blocks manually; rule
  changes go to `RULES_REGISTRY.md` first, then re-sync.

### Removed

- `.github/prompts/workflow.prompt.md` and all active references to it from
  `README.md`, `WORKFLOW.md`, `COMPACT_WORKFLOW.md`, `SETUP.md`, and
  `CONTRIBUTING.md`.

## 0.1.0 — 2026-03-02

Initial release of the AI Development Workflow package.

- Structured workflow for spec-driven development with GitHub Copilot: `SPEC → ANALYSIS → PLAN → implementation → release notes`.
- Workflow rules for Copilot in `.github/prompts/workflow.prompt.md`.
- 19 reusable document templates in `templates/`.
- Human quick reference in `COMPACT_WORKFLOW.md`.
- Task-specific prompt files in `.github/prompts/`.
- Full workflow reference and source of truth in `WORKFLOW.md`.
- Mermaid workflow diagrams in `diagrams/`.
- Contributor docs: `README.md`, `SETUP.md`, `CONTRIBUTING.md`, `SECURITY.md`.
- Three adoption tiers: Minimal, Enhanced, and Advanced.
