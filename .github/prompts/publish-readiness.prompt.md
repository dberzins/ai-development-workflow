---
description: "Use when: verifying release or publication readiness and preparing PUBLISH.md with a pre-release checklist."
argument-hint: "Release version, milestone, or publication context"
agent: "agent"
---
<!-- RULES:BEGIN — generated from RULES_REGISTRY.md, do not edit manually -->
- CR4: Keep work traceable across `SPEC -> ANALYSIS -> PLAN -> implementation -> release notes`.
- G5: For large or risky work, read the relevant project docs first and confirm what is decided, in progress, and next.
<!-- RULES:END -->

Use [publish template](../templates/PUBLISH.md).

Task:
- Verify release readiness for `${input:releaseOrMilestone:<release version or milestone>}`.

Goal:
- Identify blockers and dependencies before publishing or releasing. Ensure documentation is complete, identity decisions are made, versioning is correct, test coverage is adequate, CI is healthy, licensing and secrets are verified, and repository is ready for publication.

Inputs:
- SPEC.md, ROADMAP.md, RISKS.md
- Test coverage and CI status
- Documentation completeness (README, CONTRIBUTING, SETUP, API docs, examples)
- Current versioning and licensing
- Repository metadata (issue/PR templates, badges, keywords)

Output:
- Create or update `PUBLISH.md` using [templates/PUBLISH.md](../templates/PUBLISH.md).

Rules:
- Cover all publication dimensions: features, documentation, versioning, testing, CI readiness, licensing, secrets safety, public repository support files.
- Identify missing features (diff SPEC vs. released features).
- Confirm public repository essentials exist: CONTRIBUTING.md, CODE_OF_CONDUCT.md, SECURITY.md, issue templates, PR templates, license file.
- State whether each blocker is critical (blocks release) or lower-priority (nice to have).
- Include a pre-release checklist that can be used to gate publication.

Action:
- Check all release readiness criteria against the relevant docs and repository state, then produce a task list of blockers and a publication checklist.
