# Infrastructure Repository Usage

## How to Add CI to an Infrastructure Repository

### Step 1: Copy the template

Copy `workflows/repository-templates/infrastructure-ci.yml`
to `.github/workflows/ci.yml` in your infrastructure repository.

### Step 2: Adjust paths

```yaml
jobs:
  kubernetes:
    uses: kdd-agentic-race-engineering/12-ci-cd-release-engineering/.github/workflows/reusable-kubernetes-validate.yml@main
    with:
      overlay-path: overlays/local   # adjust to your overlay

  compose:
    uses: kdd-agentic-race-engineering/12-ci-cd-release-engineering/.github/workflows/reusable-compose-validate.yml@main
    with:
      compose-file: docker-compose.yml   # adjust if named differently
```

### Required Structure

For Kubernetes validation, your repository must have a Kustomize overlay:

```text
overlays/
  local/
    kustomization.yaml
  staging/
    kustomization.yaml
  production/
    kustomization.yaml
```

### Full Example

```yaml
name: Infrastructure CI

on:
  pull_request:
  push:
    branches:
      - main

jobs:
  security:
    uses: kdd-agentic-race-engineering/12-ci-cd-release-engineering/.github/workflows/reusable-security-scan.yml@main

  kubernetes:
    uses: kdd-agentic-race-engineering/12-ci-cd-release-engineering/.github/workflows/reusable-kubernetes-validate.yml@main
    with:
      overlay-path: overlays/local

  compose:
    uses: kdd-agentic-race-engineering/12-ci-cd-release-engineering/.github/workflows/reusable-compose-validate.yml@main
    with:
      compose-file: docker-compose.yml
```
