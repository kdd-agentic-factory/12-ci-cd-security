from pathlib import Path

FORBIDDEN_PATTERNS = [
    "ghp_",
    "sk-",
    "BEGIN PRIVATE KEY",
    "real_password",
    "production_secret",
    "AKIA",  # AWS access key prefix
]

SCAN_EXTENSIONS = {".yml", ".yaml", ".md", ".sh", ".env", ".toml", ".json", ".js"}

SKIP_DIRS = {".git", "node_modules", "__pycache__", ".venv"}


def _iter_files():
    for path in Path(".").rglob("*"):
        if path.is_file() and path.suffix in SCAN_EXTENSIONS:
            if not any(skip in path.parts for skip in SKIP_DIRS):
                yield path


def test_no_real_secrets():
    for path in _iter_files():
        content = path.read_text(errors="ignore")
        for pattern in FORBIDDEN_PATTERNS:
            assert pattern not in content, (
                f"Forbidden pattern '{pattern}' found in {path}"
            )
