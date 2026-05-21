from pathlib import Path

REQUIRED_SCRIPTS = [
    "scripts/generate-version.sh",
    "scripts/generate-release-notes.sh",
    "scripts/generate-sbom.sh",
    "scripts/scan-secrets.sh",
    "scripts/scan-container.sh",
    "scripts/validate-compose.sh",
    "scripts/render-kustomize.sh",
    "scripts/sign-image.sh",
    "scripts/verify-image.sh",
    "scripts/promote-to-staging.sh",
    "scripts/promote-to-production.sh",
    "scripts/rollback-release.sh",
    "scripts/export-release-evidence.sh",
    "scripts/collect-ci-metrics.sh",
]


def test_required_scripts_exist():
    for script in REQUIRED_SCRIPTS:
        assert Path(script).exists(), f"Missing script: {script}"


def test_scripts_have_shebang():
    for script in REQUIRED_SCRIPTS:
        path = Path(script)
        if path.exists():
            first_line = path.read_text().splitlines()[0]
            assert first_line.startswith("#!"), (
                f"Script missing shebang: {script}"
            )
