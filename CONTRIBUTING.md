# Contributing

## Scope

This repository is the AI Development Workflow — an internal workflow package for teams using GitHub Copilot in VS Code. Contributions should strengthen the workflow itself, the supporting documentation, the prompt layer, the templates, the diagrams, or the published examples.

## Before You Change Anything

1. Open the repository root in VS Code so `.github/` customizations are discovered.
2. Read [README.md](README.md), [SETUP.md](SETUP.md), and [WORKFLOW.md](WORKFLOW.md).

## Expected Contribution Flow

1. Start from the relevant written artifact, not from implementation alone.
2. For small fixes, keep the change focused and update the affected docs directly.
3. For larger or riskier changes, create or update the relevant analysis, plan, risks, or validation artifact before changing repo behavior.
4. Keep `.github/prompts/workflow.prompt.md` concise; move heavier workflow detail into [COMPACT_WORKFLOW.md](COMPACT_WORKFLOW.md) or other `.github/prompts/` files when appropriate.
5. Use the repo-root `templates/` directory for standard workflow artifacts.
6. Update related docs, checklists, and [CHANGELOG.md](CHANGELOG.md) when the repository state changes.

## Pull Request Expectations

- Keep each change scoped to one clear outcome.
- Explain the reason for the change, not only the files modified.
- Call out any assumptions, deferred work, or policy decisions.
- Include the validation you performed.
- If prompts, instructions, templates, or diagrams change, mention that explicitly in the summary.

## Validation Expectations

- Check markdown and frontmatter correctness for edited docs.
- Re-run Mermaid export if `.mmd` sources change.
- Verify relative links if files are moved or renamed.
- If you change `.github/prompts/`, perform manual VS Code validation when possible.

## Content Guidelines

- Prefer minimal, traceable changes over broad rewrites.
- Keep examples realistic and internally useful.
- Avoid putting secrets, credentials, access tokens, or private endpoints into docs, prompts, or scripts.
- Keep internal-only assumptions explicit when a document might later be reused more broadly.

## Security-Related Changes

If your change involves secrets, credentials, prompt leakage, internal URLs, or unsafe workflow guidance, follow [SECURITY.md](SECURITY.md) instead of treating it as a normal documentation edit.