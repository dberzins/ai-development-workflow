---
description: "Use when: bootstrapping a repository with this workflow and generating the initial documentation set from the current codebase."
argument-hint: "Repository context, domain, or extra constraints"
agent: "agent"
---
Use [workflow rules](workflow.prompt.md) and the mapped templates in [templates](../templates/).

Task:
- Inspect the repository and create or update the initial workflow documentation set.

Goal:
- Establish the project's baseline specification, planning, setup, and supporting docs without turning the full workflow into always-on context.

Inputs:
- Current source tree and existing project docs
- Any requirements or constraints supplied in chat

Output:
- Draft or update the baseline docs that fit the repo maturity, typically `SPEC.md`, `ROADMAP.md`, `ARCHITECTURE.md`, `SETUP.md`, `RISKS.md`, `README.md`, and other core artifacts when justified.

Rules:
When the prompt bundle is installed, prefer `/bootstrap-workflow`, `/feature-analysis`, `/feature-plan`, `/test-plan`, `/quality-review`, `/session-start`, and `/session-end` over pasting long workflow prompts manually.

- Choose the minimal or full document tier based on repository complexity.
- Use the mapped template files instead of inventing structure.
- Mark assumptions, gaps, and open questions explicitly.
- If docs already exist, update them instead of overwriting them blindly.

Action:
- Read the relevant repository context, create or update the baseline docs, and summarize what is still missing and what should happen next.