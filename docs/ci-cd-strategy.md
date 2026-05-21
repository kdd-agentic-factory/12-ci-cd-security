# CI/CD Strategy

## Goals

1. Every repository in the ecosystem shares a common quality baseline.
2. Automation runs consistently regardless of who owns the repository.
3. Security and quality gates cannot be bypassed without explicit governance approval.
4. Every production release is traceable and auditable.

## Principles

### Fail Fast

CI runs on every pull request. Failures block the merge.
The order is: lint → tests → security scan → docker build.

### Shift Left Security

Secret scanning and dependency scanning run on every PR,
not only on release builds.

### Reusable Over Duplicated

No repository copies workflow logic. Each repository calls
the shared reusable workflows via `workflow_call`.

### Evidence Over Trust

Every production release must produce:
- SBOM
- Security scan report
- Test report
- Release notes

Evidence is archived and cannot be retroactively removed.

### Immutable Artifacts

Docker images are tagged by git SHA and SemVer tag.
The `:latest` tag points to the most recent stable release.

## Workflow Tiers

| Tier         | Trigger         | Goal                                      |
|--------------|-----------------|-------------------------------------------|
| PR CI        | pull_request    | Fast feedback: lint, tests, build         |
| Main CI      | push to main    | Full validation + staging deploy          |
| Release CI   | release branch  | Full release: SBOM, sign, publish, notes  |
| Nightly      | schedule        | Deep scan, dependency audit               |

## Tool Stack

| Purpose           | Tool                  |
|-------------------|-----------------------|
| Python lint       | Ruff                  |
| Python types      | Mypy (optional)       |
| Python tests      | Pytest + pytest-cov   |
| Secret scan       | Gitleaks              |
| Dependency scan   | Trivy (fs)            |
| Container scan    | Trivy (image)         |
| SBOM              | Syft                  |
| Image signing     | Cosign (phase 3)      |
| K8s validate      | Kubeconform           |
| YAML lint         | yamllint              |
| Release notes     | Custom script         |
| Versioning        | SemVer + git log      |
