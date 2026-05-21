from pathlib import Path


def test_release_templates_exist():
    assert Path("release/release-checklist.md").exists()
    assert Path("release/release-notes-template.md").exists()
    assert Path("release/rollback-plan-template.md").exists()
    assert Path("release/release-candidate-template.md").exists()
    assert Path("release/release-process.md").exists()
    assert Path("release/versioning-policy.md").exists()
    assert Path("release/changelog.md").exists()


def test_evidence_schema_exists():
    assert Path("release/evidence/release-evidence.schema.yaml").exists()


def test_release_templates_not_empty():
    for template in [
        "release/release-checklist.md",
        "release/release-notes-template.md",
        "release/rollback-plan-template.md",
    ]:
        content = Path(template).read_text()
        assert len(content.strip()) > 0, f"Template is empty: {template}"
