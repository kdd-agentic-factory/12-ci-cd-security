# Release Checklist

Use this checklist for every production release.

## Pre-Release

- [ ] All CI checks green on the release branch.
- [ ] Security scan passed — no unfixed CRITICAL or HIGH vulnerabilities.
- [ ] Docker image built and tagged correctly.
- [ ] SBOM generated (`sbom.spdx.json` exists).
- [ ] Release notes written (`RELEASE_NOTES.md`).
- [ ] Version computed (`scripts/generate-version.sh`).
- [ ] Changelog updated.
- [ ] At least 2 reviewer approvals on the release PR.

## Staging Validation

- [ ] Image deployed to staging successfully.
- [ ] Smoke tests passed.
- [ ] No regressions observed in staging.
- [ ] Rollback plan reviewed.

## Production Release

- [ ] Manual approval granted in GitHub Environments.
- [ ] Image deployed to production.
- [ ] Smoke tests passed in production.
- [ ] Release evidence exported (`scripts/export-release-evidence.sh`).
- [ ] Git tag created (`vX.Y.Z`).
- [ ] GitHub Release created with SBOM and release notes.

## Post-Release

- [ ] Dashboards monitored for 30 minutes.
- [ ] No alerts triggered.
- [ ] Team notified.
- [ ] Rollback plan archived.
