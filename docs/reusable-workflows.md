# Reusable Workflows

## How to Use

Call a reusable workflow from any repository:

```yaml
jobs:
  python-ci:
    uses: kdd-agentic-race-engineering/12-ci-cd-release-engineering/.github/workflows/reusable-python-ci.yml@main
    with:
      python-version: "3.11"
      run-mypy: false
```

## Available Workflows

### `reusable-python-ci.yml`

Runs Ruff lint, optional Mypy, Pytest with coverage.

| Input          | Type    | Default  | Description                    |
|----------------|---------|----------|--------------------------------|
| python-version | string  | `3.11`   | Python version                 |
| run-mypy       | boolean | `false`  | Enable Mypy type checking      |
| min-coverage   | string  | `0`      | Minimum coverage threshold     |

### `reusable-node-ci.yml`

Runs npm install, lint, type-check, test, build.

| Input         | Type    | Default                            |
|---------------|---------|------------------------------------|
| node-version  | string  | `20`                               |
| run-build     | boolean | `true`                             |
| build-command | string  | `npm run build`                    |
| test-command  | string  | `npm test -- --passWithNoTests`    |

### `reusable-docker-build.yml`

Builds Docker image with metadata tags. Optionally pushes to GHCR.

| Input      | Type    | Default        | Required |
|------------|---------|----------------|----------|
| image-name | string  | —              | yes      |
| context    | string  | `.`            | no       |
| dockerfile | string  | `Dockerfile`   | no       |
| push       | boolean | `false`        | no       |

### `reusable-security-scan.yml`

Runs Gitleaks (secret scan) and Trivy filesystem scan.
Optionally scans a container image.

| Input           | Type    | Default  |
|-----------------|---------|----------|
| scan-container  | boolean | `false`  |
| image-ref       | string  | `""`     |

### `reusable-kubernetes-validate.yml`

Renders Kustomize overlay and validates with Kubeconform.

| Input        | Type   | Default          |
|--------------|--------|------------------|
| overlay-path | string | `overlays/local` |

### `reusable-compose-validate.yml`

Validates Docker Compose file syntax.

| Input        | Type   | Default              |
|--------------|--------|----------------------|
| compose-file | string | `docker-compose.yml` |

### `reusable-docs-validate.yml`

Runs markdownlint and optionally lychee link checker.

| Input       | Type    | Default  |
|-------------|---------|----------|
| docs-path   | string  | `.`      |
| check-links | boolean | `false`  |

### `reusable-release.yml`

Full release: compute version, generate notes, build+push image, generate SBOM, create GitHub Release.

| Input        | Type   | Default  | Required |
|--------------|--------|----------|----------|
| image-name   | string | —        | yes      |
| release-type | string | `auto`   | no       |

### `reusable-deploy-staging.yml`

Renders Kustomize and applies to staging cluster.

### `reusable-deploy-production.yml`

Renders Kustomize and applies to production cluster (requires `production` environment approval).

### `reusable-rollback.yml`

Executes `kubectl rollout undo` on a named deployment.

### `reusable-full-platform-smoke-test.yml`

Runs smoke tests against a deployed environment.
