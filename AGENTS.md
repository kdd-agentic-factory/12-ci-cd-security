# AGENTS.md — CI/CD and Release Engineering

## Repository Mission

This repository defines reusable CI/CD, validation, release and deployment automation
for the KDD-governed agentic race engineering ecosystem.

## Mandatory Rules

- Do not commit real secrets.
- Do not disable security scans.
- Do not remove required checks without governance approval.
- Do not publish production releases without release evidence.
- Do not deploy production without manual approval.
- Do not skip tests for core services.
- Do not publish unsigned production images in mature environments.
- Do not modify branch protection templates without review.

## Allowed Responsibilities

- define reusable GitHub Actions workflows,
- define quality gates,
- define release pipelines,
- define security scanning,
- define SBOM and provenance generation,
- define deployment promotion,
- define rollback procedures,
- export release evidence.

## Forbidden Responsibilities

- implementing application logic,
- storing credentials,
- changing runtime infrastructure directly without deployment workflow,
- approving race engineering recommendations,
- modifying scientific paper content,
- bypassing governance policies.

## Conventions

- Keep examples generic and parametrizable.
- Document important assumptions inside each file.
- Prefer secure-by-default configurations.
- Avoid real secrets, tokens or internal production values.
- Use valid YAML and clear Markdown.

## Validation Before Delivering Changes

- Verify workflows do not depend on non-existent paths without fallback.
- Check that scanners have a minimal usable configuration.
- Keep policies aligned with mandatory reviews, traceability and secret management.
- Run `pytest -q tests/` to validate structural integrity.

## Style

- Clear English in workflow names and steps.
- Stable and descriptive file names.
- Small, reviewable, reuse-oriented changes.
