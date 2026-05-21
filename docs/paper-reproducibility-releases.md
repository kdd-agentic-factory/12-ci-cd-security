# Paper Reproducibility Releases

## Purpose

This document describes how the CI/CD infrastructure supports
the reproducibility requirements of the KDD paper submission.

## What Reproducibility Means Here

Every experimental result in the paper must be traceable to:

1. A specific git commit in the relevant repository.
2. A Docker image built from that commit.
3. A set of configuration files and data references.
4. A set of metrics logged during the experiment.

## How CI/CD Supports This

### Immutable Image Tags

Every Docker image is tagged by git SHA:

```text
ghcr.io/kdd-agentic-race-engineering/service:sha-abc1234
```

This ensures the exact image used in an experiment can always be retrieved.

### SBOM

The SBOM records every dependency version at the time of the build.
This allows auditors to reproduce the exact dependency tree.

### Release Evidence

`release/evidence/` stores structured records of what was validated
for each release. These records are immutable after creation.

### Paper Artifact Workflow

The `reusable-paper-artifacts.yml` workflow (planned) will:

1. Build the LaTeX paper.
2. Archive all experiment configuration files.
3. Archive metric exports.
4. Produce a reproducibility bundle.

## Metrics for the Paper

The following CI/CD metrics will be reported in the paper:

| Metric                        | Description                                   |
|-------------------------------|-----------------------------------------------|
| `ci_success_rate`             | Percentage of CI runs that pass               |
| `mean_time_to_validate`       | Average CI duration per PR                    |
| `release_frequency`           | Releases per week                             |
| `deployment_success_rate`     | Percentage of deployments that succeed        |
| `rollback_rate`               | Percentage of releases requiring rollback     |
| `security_findings_count`     | Number of security findings per scan          |
| `sbom_generation_rate`        | Percentage of releases with SBOM              |
| `artifact_reproducibility`    | Whether exact artifacts can be reproduced     |
