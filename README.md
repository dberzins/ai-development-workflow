# AI Development Workflow

Workflow Version: 0.2.0

The repository release version and workflow package version are currently the same contract.

## Overview

This repository packages a structured workflow for working with GitHub Copilot during spec-driven software development. It gives teams a repeatable way to move from requirements to analysis, planning, implementation, validation, review, and publishing without relying on ad hoc prompts or undocumented decisions.

The repository is organized as a layered workflow system:

- AI rules source in [RULES_REGISTRY.md](RULES_REGISTRY.md)
- canonical document scaffolds in [templates](templates)
- human quick reference in [COMPACT_WORKFLOW.md](COMPACT_WORKFLOW.md)
- task-specific prompt files in [.github/prompts](.github/prompts)
- full reference and source of truth in [WORKFLOW.md](WORKFLOW.md)

## Features

- Full workflow reference with document lifecycle, prompt patterns, governance rules, and diagrams in [WORKFLOW.md](WORKFLOW.md)
- Compact human quick reference in [COMPACT_WORKFLOW.md](COMPACT_WORKFLOW.md)
- AI rules source with rule IDs and prompt mapping in [RULES_REGISTRY.md](RULES_REGISTRY.md)
- Repository release notes in [CHANGELOG.md](CHANGELOG.md)
- Contribution workflow in [CONTRIBUTING.md](CONTRIBUTING.md)
- Internal security reporting guidance in [SECURITY.md](SECURITY.md)
- Contributor environment and troubleshooting guide in [SETUP.md](SETUP.md)
- Reusable document templates in [templates](templates) for specification, analysis, planning, setup, release, and support artifacts
- Reusable task prompts in [.github/prompts](.github/prompts) for bootstrap, analysis, planning, test planning, review, and session handoff
- Mermaid source and generated diagrams in [diagrams](diagrams)

## Architecture Summary

| Layer | Artifact | Purpose |
|------|----------|---------|
| Source of truth | [WORKFLOW.md](WORKFLOW.md) | Full workflow definition, rules, dependencies, and prompt catalog |
| AI rules source | [RULES_REGISTRY.md](RULES_REGISTRY.md) | Canonical rule text and prompt→rule mapping for Copilot |
| Release notes | [CHANGELOG.md](CHANGELOG.md) | Repository-level change history for publishing and release tracking |
| Contribution guide | [CONTRIBUTING.md](CONTRIBUTING.md) | Expected change flow, review expectations, and validation rules |
| Security policy | [SECURITY.md](SECURITY.md) | Internal reporting and handling guidance for repository security concerns |
| Contributor setup | [SETUP.md](SETUP.md) | Local environment, tool prerequisites, commands, and troubleshooting |
| Templates | [templates](templates) | Canonical scaffolds for generated project documents |
| Human quick reference | [COMPACT_WORKFLOW.md](COMPACT_WORKFLOW.md) | Readable workflow summary and optional manual context |
| Task layer | [.github/prompts](.github/prompts) | On-demand slash-command prompts for repetitive workflow actions |
| Supporting assets | [diagrams](diagrams) | Visual workflow diagrams |

## Setup

Minimum working setup:

- VS Code with GitHub Copilot Chat enabled
- Open the repository root so customizations under `.github/` are discovered
- PowerShell or Bash for running repository scripts

Optional but recommended for diagram maintenance:

- `mmdc` installed globally, or
- Node.js with `npx` available so the export scripts can run Mermaid CLI on demand

To refresh diagram exports from the Mermaid source files:

```bash
# Linux / macOS
./scripts/export-mermaid-diagrams.sh

# Windows (PowerShell)
./scripts/export-mermaid-diagrams.ps1
```

See [SETUP.md](SETUP.md) for full contributor setup and troubleshooting.

## Usage

Choose the package that matches how much workflow support you want in a target repository:

| Package | Include | Use When |
|---------|---------|----------|
| Minimal | `RULES_REGISTRY.md`, `templates/`, `.github/prompts/` | Lowest token overhead with reliable per-prompt rules |
| Enhanced | Minimal + `COMPACT_WORKFLOW.md` | Teams want a quick human reference in the repo |
| Advanced | Enhanced + `.github/prompts/` | Teams want reusable slash-command prompts for common workflow tasks |

Typical adoption flow:

1. Copy the selected workflow package into the target repository.
2. Generate baseline project docs with `/bootstrap-workflow` or the project bootstrap prompt from [WORKFLOW.md](WORKFLOW.md).
3. Use `/session-start`, `/feature-analysis`, `/feature-plan`, `/test-plan`, `/quality-review`, and `/session-end` during day-to-day work.
4. Keep the full workflow rules and template mapping aligned with [WORKFLOW.md](WORKFLOW.md).

## Development Workflow

The standard artifact flow is:

`SPEC -> ARCHITECTURE / SETUP / ROADMAP / RISKS -> ANALYSIS -> ADR -> PLAN -> TEST_PLAN -> IMPLEMENT -> REVIEW -> DOCS UPDATE -> PUBLISH -> RETROSPECTIVE`

Working rules for this repository:

- keep [WORKFLOW.md](WORKFLOW.md) as the source of truth
- keep [RULES_REGISTRY.md](RULES_REGISTRY.md) as the AI-rules source; run `/re-sync-rules` after rule changes
- keep heavy workflow detail in [COMPACT_WORKFLOW.md](COMPACT_WORKFLOW.md) and [.github/prompts](.github/prompts)
- update related docs and checklists when workflow assets change

## Limitations

- The workflow currently targets GitHub Copilot in VS Code first.
- Prompt discovery and always-on instruction loading still require manual UI verification in VS Code.
- Some publish-support artifacts such as CI workflow configuration and manual validation are still pending.
- Other AI tools can use [COMPACT_WORKFLOW.md](COMPACT_WORKFLOW.md) manually, but the automated instruction layer is built for Copilot.

## License

This project is licensed under the [Apache License 2.0](LICENSE).