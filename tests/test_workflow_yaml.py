from pathlib import Path

import yaml


def _get_triggers(parsed: dict) -> dict:
    # PyYAML parses bare `on:` as boolean True; handle both forms.
    return parsed.get("on", parsed.get(True, {})) or {}


def test_all_workflows_are_valid_yaml():
    workflow_dir = Path(".github/workflows")
    if not workflow_dir.exists():
        return
    for yml_file in workflow_dir.glob("*.yml"):
        content = yml_file.read_text(encoding="utf-8")
        parsed = yaml.safe_load(content)
        assert parsed is not None, f"Empty or invalid YAML: {yml_file}"
        assert "name" in parsed, f"Workflow missing 'name': {yml_file}"
        triggers = _get_triggers(parsed)
        assert triggers, f"Workflow missing 'on' trigger: {yml_file}"
        assert "jobs" in parsed, f"Workflow missing 'jobs': {yml_file}"


def test_reusable_workflows_use_workflow_call():
    workflow_dir = Path(".github/workflows")
    if not workflow_dir.exists():
        return
    for yml_file in workflow_dir.glob("reusable-*.yml"):
        content = yml_file.read_text(encoding="utf-8")
        parsed = yaml.safe_load(content)
        triggers = _get_triggers(parsed)
        assert "workflow_call" in triggers, (
            f"Reusable workflow missing 'workflow_call' trigger: {yml_file}"
        )
