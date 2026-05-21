# Architecture

## Overview

`12-ci-cd-release-engineering` is a transversal repository that provides shared
CI/CD automation for the entire KDD-governed agentic race engineering ecosystem.

It does not contain application logic. It contains:

- Reusable GitHub Actions workflows consumed by all other repositories.
- Quality gate policies enforced across the organisation.
- Release automation scripts and templates.
- Environment deployment policies.
- Structural validation tests.

## Component Map

```text
.github/workflows/
  reusable-*.yml          Callable workflows (workflow_call trigger)

workflows/
  repository-templates/   Ready-to-copy CI files per repo type
  examples/               Concrete examples per ecosystem service
  policies/               YAML policy files for checks, branches, approvals

actions/
  setup-python-project/   Composite action: install Python + deps
  docker-metadata/        Composite action: generate image tags
  generate-sbom/          Composite action: run Syft SBOM
  validate-kdd-repository/ Composite action: structural check
  export-release-evidence/ Composite action: generate evidence file

scripts/
  generate-version.sh     SemVer computation from git log
  generate-release-notes.sh  Markdown release notes from git log
  generate-sbom.sh        Run Syft via Docker
  scan-secrets.sh         Run Gitleaks via Docker
  scan-container.sh       Run Trivy image scan
  validate-compose.sh     docker compose config
  render-kustomize.sh     kubectl kustomize
  promote-to-staging.sh   Deploy to staging
  promote-to-production.sh Deploy to production with evidence gate
  rollback-release.sh     kubectl rollout undo
  export-release-evidence.sh  Write structured evidence YAML

config/
  trivy/                  Trivy severity and ignore config
  gitleaks/               Secret scan rules and allowlists
  ruff/                   Python linter config
  mypy/                   Type checker config
  pytest/                 Test runner config
  kubeconform/            Kubernetes manifest validator config
  yamllint/               YAML linter config
  semantic-release/       Changelog and release automation config

release/
  release-process.md      Step-by-step release guide
  versioning-policy.md    SemVer rules
  release-checklist.md    Pre/post release checklist
  evidence/               Release evidence files and schema

environments/
  local/                  Local Docker Compose deployment policy
  staging/                Staging Kubernetes deployment policy
  production/             Production deployment policy (manual approval)

tests/
  test_required_workflows.py
  test_workflow_yaml.py
  test_no_real_secrets.py
  test_release_templates.py
  test_required_checks_policy.py
  test_script_existence.py
```

## Data Flow

```text
Developer → PR → CI (reusable workflows) → merge main
  → staging deploy (automatic) → smoke tests
  → release branch → production deploy (manual approval)
  → release evidence exported → GitHub Release created
```
