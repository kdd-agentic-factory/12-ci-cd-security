# Versioning Policy

## Standard

This ecosystem uses Semantic Versioning (SemVer): `MAJOR.MINOR.PATCH`

## Rules

### PATCH — `0.0.X`

Increment for:

- Bug fixes.
- Minor documentation updates.
- Test additions or fixes.
- Dependency patches with no API changes.

### MINOR — `0.X.0`

Increment for:

- New backwards-compatible features.
- New optional parameters.
- New endpoints or capabilities.
- Deprecations (not removals).

### MAJOR — `X.0.0`

Increment for:

- Breaking changes in public APIs.
- Incompatible changes in contracts or schemas.
- Removal of deprecated features.
- Breaking changes in workflow interfaces.

## Initial Development

While `MAJOR = 0`, breaking changes may occur in MINOR versions.
The ecosystem will reach `1.0.0` when:

- Core APIs are stable.
- CI/CD pipelines are production-grade.
- At least one paper submission has been made.

## Automated Version Detection

`scripts/generate-version.sh` reads git history:

- Commit message contains `BREAKING CHANGE` → MAJOR bump.
- Commit message starts with `feat` → MINOR bump.
- Otherwise → PATCH bump.

## Git Tags

Every release must be tagged: `vMAJOR.MINOR.PATCH`

Release candidates: `rc/vMAJOR.MINOR.PATCH`
