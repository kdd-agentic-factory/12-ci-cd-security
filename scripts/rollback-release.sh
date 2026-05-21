#!/usr/bin/env bash
set -euo pipefail

DEPLOYMENT_NAME="${1:-}"
NAMESPACE="${2:-default}"
REVISION="${3:-0}"

if [ -z "$DEPLOYMENT_NAME" ]; then
  echo "Usage: rollback-release.sh <deployment-name> [namespace] [revision]"
  exit 1
fi

echo "[rollback] Rolling back $DEPLOYMENT_NAME in $NAMESPACE"

if [ "$REVISION" = "0" ]; then
  kubectl rollout undo deployment/"$DEPLOYMENT_NAME" -n "$NAMESPACE"
else
  kubectl rollout undo deployment/"$DEPLOYMENT_NAME" -n "$NAMESPACE" --to-revision="$REVISION"
fi

kubectl rollout status deployment/"$DEPLOYMENT_NAME" -n "$NAMESPACE" --timeout=120s
kubectl rollout history deployment/"$DEPLOYMENT_NAME" -n "$NAMESPACE"

echo "[rollback] Rollback complete for $DEPLOYMENT_NAME"
