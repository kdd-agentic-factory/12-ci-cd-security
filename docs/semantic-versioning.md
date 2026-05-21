# Semantic Versioning

## Format

```text
MAJOR.MINOR.PATCH
```

## Rules

See `release/versioning-policy.md` for the full policy.

## Automated Version Computation

`scripts/generate-version.sh` computes the next version from git history:

```bash
bash scripts/generate-version.sh
# outputs: 0.3.1
```

## Commit Message Convention

To drive automated versioning correctly:

| Commit message prefix | Version bump |
|-----------------------|--------------|
| `BREAKING CHANGE`     | MAJOR        |
| `feat: ...`           | MINOR        |
| anything else         | PATCH        |

Examples:

```text
feat: add SBOM generation to release workflow
fix: correct kubeconform version in validate workflow
docs: update reusable-workflows documentation
BREAKING CHANGE: rename image-name input to service-name
```

## Git Tags

```bash
git tag v0.3.1
git push origin v0.3.1
```

Tags trigger the release workflow.

## Release Candidates

```bash
git tag rc/v0.3.1
git push origin rc/v0.3.1
```

Release candidates are deployed to staging only.
