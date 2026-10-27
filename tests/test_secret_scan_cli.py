from pathlib import Path
import yaml


def test_secret_scan_is_pinned_redacted_full_history_without_credentials():
    data = yaml.safe_load(Path('.github/workflows/reusable-security-scan.yml').read_text())
    steps = data['jobs']['secret-scan']['steps']
    checkout = next(step for step in steps if step.get('uses', '').startswith('actions/checkout@'))
    assert checkout['with']['fetch-depth'] == 0
    assert checkout['with']['persist-credentials'] is False
    command = next(step['run'] for step in steps if 'run' in step)
    for required in ('--log-opts=--all', '--redact=100', '--network none', '--read-only', '@sha256:'):
        assert required in command
    assert 'continue-on-error' not in str(steps)
    assert 'GITHUB_TOKEN' not in str(steps)
    assert set(data['jobs']) == {'secret-scan', 'dependency-scan', 'container-scan'}
