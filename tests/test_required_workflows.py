from pathlib import Path

REQUIRED_WORKFLOWS = [
    ".github/workflows/reusable-python-ci.yml",
    ".github/workflows/reusable-node-ci.yml",
    ".github/workflows/reusable-docker-build.yml",
    ".github/workflows/reusable-security-scan.yml",
    ".github/workflows/reusable-kubernetes-validate.yml",
    ".github/workflows/reusable-compose-validate.yml",
    ".github/workflows/reusable-docs-validate.yml",
    ".github/workflows/reusable-release.yml",
    ".github/workflows/reusable-deploy-staging.yml",
    ".github/workflows/reusable-deploy-production.yml",
    ".github/workflows/reusable-rollback.yml",
    ".github/workflows/reusable-full-platform-smoke-test.yml",
]


def test_required_workflows_exist():
    for workflow in REQUIRED_WORKFLOWS:
        assert Path(workflow).exists(), f"Missing workflow: {workflow}"
