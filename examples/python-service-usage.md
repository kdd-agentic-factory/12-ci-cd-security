# Python Service Usage

## How to Add CI to a Python Service Repository

### Step 1: Copy the template

Copy `workflows/repository-templates/python-service-ci.yml`
to `.github/workflows/ci.yml` in your Python service repository.

### Step 2: Adjust inputs if needed

```yaml
jobs:
  python-ci:
    uses: kdd-agentic-race-engineering/12-ci-cd-release-engineering/.github/workflows/reusable-python-ci.yml@main
    with:
      python-version: "3.11"   # change if needed
      run-mypy: true            # enable if you have type annotations
      min-coverage: "80"        # enforce a minimum coverage threshold
```

### Step 3: Ensure your project is installable

The workflow expects either `pyproject.toml` or `requirements.txt`.

For `pyproject.toml` with a dev group:

```toml
[project.optional-dependencies]
dev = ["pytest", "pytest-cov", "ruff"]
```

### Step 4: Ensure tests exist

The workflow runs `pytest --cov=src`. Make sure `tests/` exists.

### Full Example

```yaml
name: CI

on:
  pull_request:
  push:
    branches:
      - main

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
      image-name: my-python-service
      push: false
```
