#!/usr/bin/env bash
set -euo pipefail

OUTPUT_FILE="${1:-ci-metrics.json}"

COMMIT=$(git rev-parse --short HEAD)
BRANCH=$(git rev-parse --abbrev-ref HEAD)
TIMESTAMP=$(date -u +%Y-%m-%dT%H:%M:%SZ)
TOTAL_COMMITS=$(git rev-list --count HEAD)

cat > "$OUTPUT_FILE" <<EOF
{
  "timestamp": "$TIMESTAMP",
  "branch": "$BRANCH",
  "commit": "$COMMIT",
  "total_commits": $TOTAL_COMMITS,
  "metrics": {
    "collected_by": "collect-ci-metrics.sh"
  }
}
EOF

echo "[metrics] Collected CI metrics to $OUTPUT_FILE"
