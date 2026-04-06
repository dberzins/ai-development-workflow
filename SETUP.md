# Development Environment

## Prerequisites

| Tool | Version | Purpose |
|------|---------|---------|
| VS Code | Current stable | Main editor and workflow host |
| GitHub Copilot Chat | Enabled in VS Code | Required for instructions and prompt workflows |
| Git | 2.x+ | Clone, branch, and publish repository changes |
| PowerShell | 7+ recommended or Windows PowerShell 5.1+ | Run repository scripts on Windows |
| Node.js | 18+ recommended | Required if Mermaid export will use `npx` fallback |
| Mermaid CLI (`mmdc`) | Optional | Direct diagram export command |

Verify common tooling:

```powershell
git --version
pwsh --version
npx --version
```

If `pwsh` is not installed, Windows PowerShell can still run the repository script.

## Installation Steps

1. Clone the repository (published as `ai-development-workflow`; local folder name may differ):

   ```powershell
   git clone <repository-url>
   cd workflow
   ```

2. Open the repository root in VS Code.

3. Ensure GitHub Copilot Chat is enabled for your VS Code profile.

4. Trust the workspace when VS Code prompts for workspace trust.

5. Open Copilot Chat and verify that the repository customizations are discoverable:
   - `.github/prompts/workflow.prompt.md` should be available from the prompt picker or auto-attached based on context
   - prompt files under `.github/prompts/` should be available from the `/` prompt picker

6. If you want to regenerate diagram images, install one of the following:
   - Mermaid CLI globally so `mmdc` is available on `PATH`, or
   - Node.js so the export script can use `npx --yes @mermaid-js/mermaid-cli`

7. Review the workflow entry points:
   - [README.md](README.md)
   - [WORKFLOW.md](WORKFLOW.md)
   - [COMPACT_WORKFLOW.md](COMPACT_WORKFLOW.md)

## Environment Variables

No environment variables are required for normal documentation work in this repository.

If your environment uses GitHub authentication, Copilot entitlement, or proxy configuration, use the standard setup already required by your workstation and VS Code profile.

## Local Services

No local services are required.

This repository contains documentation, templates, prompt files, diagrams, and a PowerShell export script. There is no application server, database, or backend service to run locally.

## Common Commands

| Command | Purpose |
|---------|---------|
| `git clone <repository-url>` | Clone the repository |
| `./scripts/export-mermaid-diagrams.sh` | Regenerate diagram PNG files from Mermaid sources (Linux / macOS) |
| `./scripts/export-mermaid-diagrams.sh diagrams png --dry-run` | Preview which Mermaid files would be exported (Linux / macOS) |
| `pwsh ./scripts/export-mermaid-diagrams.ps1` | Regenerate diagram PNG files from Mermaid sources (PowerShell) |
| `powershell -ExecutionPolicy Bypass -File .\scripts\export-mermaid-diagrams.ps1` | Windows PowerShell alternative for diagram export |
| `pwsh ./scripts/export-mermaid-diagrams.ps1 -DryRun` | Preview which Mermaid files would be exported (PowerShell) |

Useful chat actions in VS Code:

| Action | Purpose |
|--------|---------|
| `/bootstrap-workflow` | Generate or refresh the baseline workflow docs in a target repo |
| `/feature-analysis` | Create a `*_ANALYSIS.md` from relevant docs and code |
| `/feature-plan` | Create a phased `*_PLAN.md` from approved analysis |
| `/test-plan` | Create or update `TEST_PLAN.md` |
| `/quality-review` | Review changes for bugs, regressions, maintainability, and security issues |
| `/session-start` | Rebuild context at the start of a session |
| `/session-end` | Summarize and update workflow artifacts at session end |

## Troubleshooting

| Problem | Cause | Fix |
|---------|-------|-----|
| Prompt files do not appear in the `/` picker | Workspace not opened at repo root, prompt discovery not refreshed, or workspace not trusted | Open the repository root, trust the workspace, and reopen the chat session |
| Workflow prompt does not appear to apply | Prompt file not loaded or wrong workspace opened | Check that `.github/prompts/workflow.prompt.md` exists and the repo root is the active workspace |
| Mermaid export fails with "Mermaid CLI is not available" | Neither `mmdc` nor `npx` is available | Install Mermaid CLI globally or install Node.js so `npx` is available |
| Diagram PNGs are out of date | Mermaid sources changed without rerunning export | Run `./scripts/export-mermaid-diagrams.sh` (or `.ps1` on Windows) from the repo root |
| Relative links in prompts or docs look broken | File moved or opened from the wrong folder context | Keep the repository structure intact and open the repo root in VS Code |
| Prompt discovery works for some repos but not subfolders | Parent repository customizations are not discovered by default | Open the repo root or enable parent repository discovery in VS Code when appropriate |