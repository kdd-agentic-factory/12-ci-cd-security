# 12-ci-cd-release-engineering

CI/CD and release engineering repository for the KDD-governed agentic race engineering ecosystem.

This repository provides reusable GitHub Actions workflows, quality gates, release templates,
security scanning, SBOM generation, image signing, deployment promotion and rollback processes.

It supports:

- Python services,
- Node/React dashboards,
- Docker images,
- Kubernetes manifests,
- Docker Compose environments,
- documentation repositories,
- paper reproducibility artifacts.

## Main Capabilities

- reusable CI workflows,
- Docker build and publish,
- security scanning,
- secret scanning,
- dependency scanning,
- SBOM generation,
- semantic versioning,
- release notes generation,
- staging deployment,
- production deployment,
- rollback automation,
- release evidence export.

## Repository Structure

```text
.github/workflows/          reusable GitHub Actions workflows
workflows/
  repository-templates/    CI templates per repo type
  examples/                usage examples per ecosystem repo
  policies/                required checks and approval policies
actions/                   custom composite actions
scripts/                   bash automation scripts
config/                    tool configurations (trivy, ruff, mypy, etc.)
release/                   release docs, templates and evidence schema
environments/              deployment policies per environment
dashboards/                Grafana dashboard definitions
docs/                      technical documentation
tests/                     structural validation tests
examples/                  usage guides
```

## Usage from Other Repositories

```yaml
jobs:
  python-ci:
    uses: kdd-agentic-race-engineering/12-ci-cd-release-engineering/.github/workflows/reusable-python-ci.yml@main
    with:
      python-version: "3.11"

  security:
    uses: kdd-agentic-race-engineering/12-ci-cd-release-engineering/.github/workflows/reusable-security-scan.yml@main

  docker-build:
    uses: kdd-agentic-race-engineering/12-ci-cd-release-engineering/.github/workflows/reusable-docker-build.yml@main
    with:
      image-name: my-service
      push: false
```

## Quality Gates

| Repo Type       | Required Checks                              |
|-----------------|----------------------------------------------|
| python-service  | python-ci, security, docker-build            |
| node-dashboard  | node-ci, security, docker-build              |
| infrastructure  | security, kubernetes, compose                |
| documentation   | docs-validate, security                      |
| paper           | latex-build, paper-artifacts, security       |

## Promotion Flow

```text
feature branch → pull request → CI → merge main
  → build image :main → release candidate
  → staging (automatic) → manual approval → production
```

## Principles

- Automate repeatable controls before merging.
- Fail early on secrets, critical vulnerabilities or invalid manifests.
- Produce traceable evidence in CI.
- Every production release requires SBOM, scan report and release notes.
- No production deployment without manual approval.
