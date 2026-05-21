# Release Process

## Overview

Every release follows a structured process to ensure quality, traceability and safety.

## Steps

### 1. Feature Development

- Work on a feature branch.
- Open a pull request against `main`.
- CI runs automatically: lint, tests, security scan, docker build.

### 2. Merge to Main

- At least 1 reviewer approval required.
- All required checks must pass.
- Squash or merge commit.

### 3. Build Release Candidate

- Tag the commit with `rc/vX.Y.Z`.
- CI builds and publishes the release candidate image to GHCR.
- Run smoke tests against staging.

### 4. Staging Deployment

- Automatic promotion to staging on merge to `main`.
- Run smoke tests.
- Monitor for regressions.

### 5. Production Release

- Create a `release/vX.Y.Z` branch from main.
- Run `scripts/generate-version.sh` to compute version.
- Run `scripts/generate-release-notes.sh` to generate notes.
- Open PR: `release/vX.Y.Z` → `main`.
- Requires 2 reviewer approvals.
- Manual approval gate in GitHub Environments.

### 6. Release Evidence Export

- Run `scripts/export-release-evidence.sh`.
- Verify SBOM exists.
- Archive evidence in `release/evidence/`.

### 7. Post-Release

- Monitor dashboards for 30 minutes.
- Keep rollback plan ready.
- Tag the release commit: `git tag vX.Y.Z`.
