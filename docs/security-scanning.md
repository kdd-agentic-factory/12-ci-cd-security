# Security Scanning

## Tools

### Gitleaks — Secret Scanning

Scans git history and working tree for secrets, tokens and credentials.

Configuration: `config/gitleaks/gitleaks.toml`

Runs on every PR via `reusable-security-scan.yml`.

To run locally:

```bash
bash scripts/scan-secrets.sh
```

### Trivy — Vulnerability Scanning

Scans filesystem dependencies and container images.

Configuration: `config/trivy/trivy.yaml`

Severity threshold: CRITICAL and HIGH only.
Unfixed vulnerabilities are ignored by default.

To scan filesystem:

```bash
docker run --rm -v "$PWD:/repo" aquasec/trivy:latest fs /repo
```

To scan a container image:

```bash
bash scripts/scan-container.sh ghcr.io/org/image:tag
```

## False Positives

When a finding is a known false positive:

1. Document it in `config/trivy/ignore.yaml` with justification and expiry date.
2. Open a PR to this repository.
3. Get at least 1 reviewer approval.

Never disable scans entirely.

## Secret Scan Allowlists

Allowlisted patterns are in `config/gitleaks/gitleaks.toml` under `[allowlist]`.

Example allowlisted values: `example_token`, `placeholder`, `REPLACE_ME`.

## Scan Frequency

| Scan type        | Frequency              |
|------------------|------------------------|
| Secret scan      | Every PR               |
| Dependency scan  | Every PR               |
| Container scan   | On push to main        |
| Deep audit       | Nightly (planned)      |
