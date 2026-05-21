# Rollback Plan — vX.Y.Z

## Rollback Triggers

- Health check fails after deployment.
- Smoke tests fail.
- Error rate exceeds threshold.
- On-call alert triggered.

## Previous Stable Version

```text
Version: vX.Y.(Z-1)
Image: ghcr.io/kdd-agentic-race-engineering/<service>:X.Y.(Z-1)
Deployment: <previous-deployment-name>
```

## Rollback Commands

```bash
bash scripts/rollback-release.sh <deployment-name> <namespace>
```

Or via GitHub Actions:

```yaml
uses: kdd-agentic-race-engineering/12-ci-cd-release-engineering/.github/workflows/reusable-rollback.yml@main
with:
  deployment-name: <deployment-name>
  namespace: default
```

## Validation After Rollback

1. Run smoke tests.
2. Confirm health check passes.
3. Monitor dashboards for 15 minutes.
4. Notify team.

## Post-Rollback Actions

- [ ] Incident report filed.
- [ ] Root cause identified.
- [ ] Fix branch created.
- [ ] Timeline for re-release defined.
