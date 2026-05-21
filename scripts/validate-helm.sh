#!/usr/bin/env bash
set -euo pipefail

CHART_PATH="${1:-helm/}"
VALUES_FILE="${2:-}"

if [ ! -d "$CHART_PATH" ]; then
  echo "[helm] Chart path $CHART_PATH not found, skipping."
  exit 0
fi

helm lint "$CHART_PATH"

if [ -n "$VALUES_FILE" ] && [ -f "$VALUES_FILE" ]; then
  helm lint "$CHART_PATH" -f "$VALUES_FILE"
  helm template release "$CHART_PATH" -f "$VALUES_FILE" > /dev/null
fi

echo "[helm] Helm chart $CHART_PATH validated successfully"
