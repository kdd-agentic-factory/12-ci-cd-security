from pathlib import Path

import yaml


def test_required_checks_policy_exists():
    assert Path("workflows/policies/required-checks.yaml").exists()


def test_required_checks_policy_valid():
    content = Path("workflows/policies/required-checks.yaml").read_text()
    data = yaml.safe_load(content)
    assert "repository_types" in data
    repo_types = data["repository_types"]
    assert "python-service" in repo_types
    assert "infrastructure" in repo_types
    for repo_type, config in repo_types.items():
        assert "required_checks" in config, (
            f"Missing required_checks for {repo_type}"
        )
        assert len(config["required_checks"]) > 0, (
            f"Empty required_checks for {repo_type}"
        )


def test_branch_protection_policy_exists():
    assert Path("workflows/policies/branch-protection.yaml").exists()


def test_release_approval_policy_exists():
    assert Path("workflows/policies/release-approval-policy.yaml").exists()


def test_release_approval_production_requires_manual():
    content = Path("workflows/policies/release-approval-policy.yaml").read_text()
    data = yaml.safe_load(content)
    production = data["release_environments"]["production"]
    assert production["manual_approval_required"] is True
