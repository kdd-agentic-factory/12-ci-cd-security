#!/usr/bin/env bash
set -euo pipefail

LATEST_TAG=$(git describe --tags --abbrev=0 2>/dev/null || echo "v0.0.0")
VERSION=${LATEST_TAG#v}

IFS='.' read -r MAJOR MINOR PATCH <<< "$VERSION"

COMMITS=$(git log "$LATEST_TAG"..HEAD --pretty=%s 2>/dev/null || git log --pretty=%s)

if echo "$COMMITS" | grep -q "BREAKING CHANGE"; then
  MAJOR=$((MAJOR + 1))
  MINOR=0
  PATCH=0
elif echo "$COMMITS" | grep -q "^feat"; then
  MINOR=$((MINOR + 1))
  PATCH=0
else
  PATCH=$((PATCH + 1))
fi

echo "$MAJOR.$MINOR.$PATCH"
