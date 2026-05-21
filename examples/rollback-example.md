# Rollback Example

## Scenario

A deployment to production of `agent-orchestrator:0.3.0` caused
health checks to fail 5 minutes after deployment.

## Step 1: Identify the issue

```bash
kubectl get pods -n kdd-production
kubectl describe pod <failing-pod>
kubectl logs <failing-pod>
```

## Step 2: Rollback via script

```bash
bash scripts/rollback-release.sh agent-orchestrator kdd-production
```

## Step 3: Rollback via GitHub Actions

Trigger `reusable-rollback.yml` manually:

```yaml
uses: kdd-agentic-race-engineering/12-ci-cd-release-engineering/.github/workflows/reusable-rollback.yml@main
with:
  deployment-name: agent-orchestrator
  namespace: kdd-production
```

## Step 4: Validate rollback

```bash
kubectl rollout status deployment/agent-orchestrator -n kdd-production
curl https://agent-orchestrator.kdd-production/health
```

## Step 5: Notify team

Post in the incident channel with:

- What was rolled back.
- Previous stable version now running.
- Time of rollback.
- Root cause (if known).

## Step 6: File incident report

Create a GitHub issue with label `incident` documenting:

- Timeline.
- Root cause.
- Fix plan.
- Estimated re-release date.
