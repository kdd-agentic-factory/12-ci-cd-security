# Dashboard (Node/React) Service Usage

## How to Add CI to a Node/React Dashboard Repository

### Step 1: Copy the template

Copy `workflows/repository-templates/node-dashboard-ci.yml`
to `.github/workflows/ci.yml` in your dashboard repository.

### Step 2: Ensure package.json has the right scripts

```json
{
  "scripts": {
    "lint": "eslint src/",
    "type-check": "tsc --noEmit",
    "test": "vitest run",
    "build": "vite build"
  }
}
```

### Full Example

```yaml
name: Dashboard CI

on:
  pull_request:
  push:
    branches:
      - main

jobs:
  node-ci:
    uses: kdd-agentic-race-engineering/12-ci-cd-release-engineering/.github/workflows/reusable-node-ci.yml@main
    with:
      node-version: "20"
      run-build: true

  security:
    uses: kdd-agentic-race-engineering/12-ci-cd-release-engineering/.github/workflows/reusable-security-scan.yml@main

  docker-build:
    uses: kdd-agentic-race-engineering/12-ci-cd-release-engineering/.github/workflows/reusable-docker-build.yml@main
    with:
      image-name: race-command-center
      push: false
```
