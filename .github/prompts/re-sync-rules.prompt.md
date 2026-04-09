---
description: "Use when: a rule in RULES_REGISTRY.md has changed and the inline rules block in one or more task prompts needs to be regenerated."
argument-hint: "Prompt name to re-sync, e.g. 'feature-analysis' or 'all'"
agent: "agent"
---

Task:
- Re-sync the `<!-- RULES:BEGIN -->` / `<!-- RULES:END -->` block in `${input:target:prompt name or 'all'}`.

Goal:
- Replace the generated rules block in the target prompt file(s) with the current
  canonical rule text for the rules mapped to that prompt in `RULES_REGISTRY.md`.

Inputs:
- `RULES_REGISTRY.md` — rule definitions (canonical text) and prompt→rule mapping table
- The target `.github/prompts/<name>.prompt.md` file(s)

Output:
- Updated prompt file(s) where the content between `<!-- RULES:BEGIN -->` and
  `<!-- RULES:END -->` exactly matches the canonical text for the mapped rule IDs.

Rules:
- Read `RULES_REGISTRY.md` first. Identify the rule IDs mapped to the target prompt
  from the "Prompt → Rule Mapping" table (✓ entries in the prompt's column).
- Replace only the content between the `<!-- RULES:BEGIN -->` and `<!-- RULES:END -->`
  delimiters. Do not modify anything outside those delimiters.
- Use the exact canonical text from the "Rule Definitions" section of `RULES_REGISTRY.md`.
  Do not paraphrase, reorder, or reword rules.
- Format each rule as a plain bullet: `- <ID>: <canonical text>`
- If the target is `all`, re-sync all 7 task prompts in this order:
  `quality-review`, `session-end`, `session-start`, `test-plan`,
  `feature-analysis`, `feature-plan`, `bootstrap-workflow`.
- If `<!-- RULES:BEGIN -->` / `<!-- RULES:END -->` delimiters are missing from the
  target file, add them immediately after the frontmatter `---` closing line and
  before the first body line, then populate the block.
- Do not touch `re-sync-rules.prompt.md` itself.

Action:
- Read `RULES_REGISTRY.md` and the target prompt file(s), replace the rules block(s)
  with the current mapped rules, and confirm how many rules were written per file.
