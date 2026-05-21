# SBOM and Provenance

## What is an SBOM?

A Software Bill of Materials (SBOM) is a machine-readable inventory of
the components, libraries and dependencies in a software artifact.

It enables:

- Vulnerability tracking across the supply chain.
- Compliance with emerging regulations (e.g., US Executive Order 14028).
- Reproducibility audits.

## Generation

SBOMs are generated using [Syft](https://github.com/anchore/syft) in SPDX JSON format.

```bash
bash scripts/generate-sbom.sh ghcr.io/org/image:tag
```

Output: `sbom.spdx.json`

In CI via composite action:

```yaml
uses: ./.github/actions/generate-sbom
with:
  image-ref: ghcr.io/org/image:tag
```

## Format

SPDX JSON is the default format. It is machine-readable and widely supported
by vulnerability databases and compliance tooling.

## Archiving

The SBOM is uploaded as a GitHub Actions artifact and attached to the
GitHub Release on every production release.

## Image Signing (Phase 3)

In the mature phase, images will be signed using [Cosign](https://github.com/sigstore/cosign):

```bash
bash scripts/sign-image.sh ghcr.io/org/image:tag
bash scripts/verify-image.sh ghcr.io/org/image:tag
```

This provides cryptographic proof of the build origin (SLSA provenance).

## SLSA Provenance (Phase 3)

SLSA (Supply-chain Levels for Software Artifacts) provenance attestations
will be generated using the `slsa-github-generator` GitHub Action.
