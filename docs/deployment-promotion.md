# Deployment Promotion

## Environments

| Environment | Trigger          | Approval     | Target                  |
|-------------|------------------|--------------|-------------------------|
| local       | manual           | none         | docker-compose          |
| staging     | push to main     | none         | kdd-staging cluster     |
| production  | release branch   | manual       | kdd-production cluster  |

## Promotion Flow

```text
feature branch
  → PR opened → CI runs
  → PR merged to main
  → staging deploy (automatic)
  → smoke tests pass
  → release branch created
  → production deploy (manual approval required)
  → release evidence exported
```

## Staging Promotion

Automatic on merge to `main`. Uses `reusable-deploy-staging.yml`.

Required checks before staging deploy:
- CI passed
- Security scan passed
- Docker image built

## Production Promotion

Manual. Uses `reusable-deploy-production.yml` with GitHub Environments protection.

Required checks before production:
- All staging checks
- SBOM generated
- Smoke tests in staging passed
- Deployment plan reviewed
- Rollback plan documented
- Manual approval from `platform_owner` role

## Scripts

```bash
bash scripts/promote-to-staging.sh <image-name> [tag]
bash scripts/promote-to-production.sh <image-name> <tag>
```

Production promotion script verifies `sbom.spdx.json` exists before deploying.
