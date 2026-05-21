# Changelog

All notable changes to this repository will be documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Reusable GitHub Actions workflows for Python CI, Docker build, security scan,
  Kubernetes validate, Compose validate, release, deploy staging, deploy production,
  rollback and full platform smoke test.
- Repository CI templates for python-service, node-dashboard, infrastructure,
  documentation and paper repositories.
- Policies for required checks, branch protection, release approval and deployment gates.
- Bash scripts for version generation, release notes, SBOM, secret scan,
  container scan, kustomize render, image signing, environment promotion and rollback.
- Tool configurations for Trivy, Gitleaks, Ruff, Mypy, Pytest, Kubeconform and yamllint.
- Release documentation: process, versioning policy, checklist, templates and changelog.
- Environment deployment policies for local, staging and production.
- Custom composite actions for project setup, Docker metadata, SBOM and evidence export.
- Structural validation tests.
- Makefile with common automation targets.
