# Release Management

## Overview

See `release/release-process.md` for the step-by-step process.

## Release Types

### Patch Release

- Bugfix or documentation update.
- No new features.
- No API changes.
- Example: `0.2.1`

### Minor Release

- New backwards-compatible feature.
- Example: `0.3.0`

### Major Release

- Breaking change.
- Requires migration guide in release notes.
- Example: `1.0.0`

## Release Artifacts

Every release produces:

| Artifact            | Description                              |
|---------------------|------------------------------------------|
| Docker image        | Tagged by SemVer and SHA                 |
| Git tag             | `vX.Y.Z`                                 |
| GitHub Release      | With release notes and attached SBOM     |
| SBOM                | `sbom.spdx.json` in SPDX JSON format     |
| Release evidence    | Structured YAML with checks and artifacts|

## Automation

The `reusable-release.yml` workflow automates:

1. Version computation.
2. Release notes generation.
3. Docker build and push.
4. SBOM generation.
5. GitHub Release creation.

## Manual Steps

- Reviewer approval (minimum 2 for production).
- Manual approval in GitHub Environments (production).
- Post-release monitoring (30 minutes).
