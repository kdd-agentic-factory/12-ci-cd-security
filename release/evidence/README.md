# Release Evidence

This directory stores release evidence for auditing and traceability.

## Structure

```text
evidence/
  README.md                  this file
  release-evidence.schema.yaml   JSON Schema for evidence files
  releases/
    vX.Y.Z/
      release-evidence.yaml  evidence for a specific release
```

## What is Release Evidence?

Release evidence is a structured record of what was validated and produced
for a given release. It includes:

- Release ID and version.
- Repository and commit SHA.
- Docker image reference.
- List of checks that passed.
- List of artifacts produced (SBOM, release notes, test reports).

## How to Generate

```bash
bash scripts/export-release-evidence.sh <version> [repo] [commit-sha] [image-ref]
```

## Schema Validation

Evidence files must conform to `release-evidence.schema.yaml`.
