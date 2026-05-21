# Quality Gates

## Definition

A quality gate is a mandatory check that must pass before a change
can be merged or a release can proceed.

## Gates Per Repository Type

### Python Service

| Gate            | Tool          | When        |
|-----------------|---------------|-------------|
| Ruff lint       | Ruff          | PR          |
| Tests           | Pytest        | PR          |
| Coverage        | pytest-cov    | PR          |
| Secret scan     | Gitleaks      | PR          |
| Dependency scan | Trivy (fs)    | PR          |
| Docker build    | Docker        | PR + main   |
| Container scan  | Trivy (image) | main        |
| SBOM            | Syft          | release     |

### Infrastructure

| Gate               | Tool          | When  |
|--------------------|---------------|-------|
| Secret scan        | Gitleaks      | PR    |
| YAML lint          | yamllint      | PR    |
| K8s manifest valid | Kubeconform   | PR    |
| Kustomize build    | kubectl       | PR    |
| Compose validate   | docker compose| PR    |

### Documentation

| Gate           | Tool           | When |
|----------------|----------------|------|
| Markdown lint  | markdownlint   | PR   |
| Secret scan    | Gitleaks       | PR   |

## Governance

Quality gates are defined in `workflows/policies/required-checks.yaml`.

Removing or weakening a gate requires a PR to this repository
with at least 1 reviewer approval. It cannot be done unilaterally
by the consuming repository.

## Failure Handling

When a gate fails:

1. The PR is blocked from merging.
2. The developer must fix the issue.
3. If a false positive, an exception must be documented in the
   relevant config file (e.g., `config/trivy/ignore.yaml`).
4. Exceptions require review and approval.
