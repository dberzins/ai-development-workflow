# Security Policy

## Scope

This repository contains prompts, instructions, scripts, and documentation that could expose sensitive information or unsafe practices if handled poorly when adopted into a project.

## What To Report

Report security concerns that affect the repository contents or the way the workflow is used, including:

- committed secrets, credentials, or access tokens
- internal URLs, system names, or sensitive identifiers that should not be published
- prompts or instructions that could encourage unsafe handling of secrets or production systems
- scripts that expose local machine data, credentials, or private configuration
- dependency or supply-chain concerns related to tools used by this repository

## How To Report

- Do not publish sensitive details in a public issue if the report includes secrets or infrastructure information.
- Report the issue by contacting the repository maintainers directly.
- Include the affected file or files, impact, reproduction steps if safe to share, and any immediate containment advice.

## Initial Handling Expectations

- Treat exposed credentials or tokens as urgent and rotate or revoke them immediately.
- Remove or redact sensitive information from the repository as soon as possible.
- Keep the repository internal until the issue is understood and contained if the exposure changes the current risk profile.

## Response Guidance

- Acknowledge reported issues as quickly as practical.
- Prioritize secret exposure, credential leakage, and unsafe automation guidance first.
- Document follow-up actions in the appropriate issue, plan, risk, or publish artifact once the immediate risk is contained.

## Scope Changes

If the repository scope or audience changes significantly, revisit this file and the overall release process. Wider adoption may require a more formal disclosure process and additional support files.