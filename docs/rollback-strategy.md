# Rollback Strategy

## When to Rollback

- Health check fails after deployment.
- Smoke tests fail in production.
- Error rate exceeds normal threshold.
- On-call alert triggered within 30 minutes of deploy.

## How to Rollback

### Via Script

```bash
bash scripts/rollback-release.sh <deployment-name> [namespace] [revision]
```

### Via GitHub Actions

```yaml
uses: kdd-agentic-race-engineering/12-ci-cd-release-engineering/.github/workflows/reusable-rollback.yml@main
with:
  deployment-name: my-service
  namespace: default
```

### Via kubectl Directly

```bash
kubectl rollout undo deployment/<name> -n <namespace>
kubectl rollout status deployment/<name> -n <namespace>
```

## Rollback Validation

After rollback:

1. Confirm health check passes.
2. Run smoke tests.
3. Monitor dashboards for 15 minutes.
4. Notify team.

## Rollback Plan Template

See `release/rollback-plan-template.md`.

A rollback plan must be prepared before every production deployment.

## Post-Rollback Actions

1. File an incident report.
2. Identify root cause.
3. Create a fix branch.
4. Define a timeline for re-release.
5. Update the release checklist with lessons learned.
