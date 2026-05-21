# Release Example

## How to Release a Python Service

### Step 1: Ensure CI is green on main

All required checks must pass.

### Step 2: Create a release branch

```bash
git checkout -b release/v0.2.0
git push origin release/v0.2.0
```

### Step 3: Compute the version

```bash
bash scripts/generate-version.sh
# outputs: 0.2.0
```

### Step 4: Generate release notes

```bash
bash scripts/generate-release-notes.sh 0.2.0 > RELEASE_NOTES.md
```

### Step 5: Add the reusable release workflow

In your service repository's `.github/workflows/release.yml`:

```yaml
name: Release

on:
  push:
    tags:
      - "v*"

jobs:
  release:
    uses: kdd-agentic-race-engineering/12-ci-cd-release-engineering/.github/workflows/reusable-release.yml@main
    with:
      image-name: my-python-service
    secrets:
      registry-token: ${{ secrets.GITHUB_TOKEN }}
```

### Step 6: Tag and push

```bash
git tag v0.2.0
git push origin v0.2.0
```

The workflow runs automatically, builds the image, generates the SBOM
and creates the GitHub Release.

### Step 7: Export release evidence

```bash
bash scripts/export-release-evidence.sh 0.2.0 my-python-service
```
