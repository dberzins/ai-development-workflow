---
description: "Use when: analyzing implemented code for cleanup opportunities and preparing a refactor plan in *_REFACTOR.md."
argument-hint: "Area or component to review for refactoring"
agent: "agent"
---
<!-- RULES:BEGIN — generated from RULES_REGISTRY.md, do not edit manually -->
- CR4: Keep work traceable across `SPEC -> ANALYSIS -> PLAN -> implementation -> release notes`.
- G9: After implementation, update relevant docs, checklists, and risks so traceability stays current.
<!-- RULES:END -->

Use [refactor template](../templates/FEATURE_REFACTOR.md).

Task:
- Review the current implementation of `${input:areaToReview:<area or component>}` for refactoring opportunities.

Goal:
- Identify high-impact cleanup and maintainability improvements. Separate critical issues (duplication, weak abstractions, wrapper bloat) from lower-priority debt. Prioritize execution to focus on highest impact first.

Inputs:
- Implemented code and test coverage
- Related SPEC.md and ARCHITECTURE.md
- Current design patterns and abstractions
- Performance considerations and test gaps

Output:
- Create or update `<AREA>_REFACTOR.md` using [templates/FEATURE_REFACTOR.md](../templates/FEATURE_REFACTOR.md).

Rules:
- Focus on maintainability: duplication, weak abstractions, unnecessary wrappers, cohesion issues.
- Use concrete code references and explain why each refactoring matters.
- Separate high-impact refactoring (goes in *_REFACTOR.md checklist) from lower-priority debt (document as notes).
- Distinguish continuous refactoring (small cleanups, no doc) from documented cleanup (complex changes, needs *_REFACTOR.md).
- Prioritize based on impact and complexity.

Action:
- Analyze the code and implementation, produce a prioritized refactor plan with findings and an incremental checklist.
