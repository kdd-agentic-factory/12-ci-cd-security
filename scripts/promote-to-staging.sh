#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME="${1:-}"
IMAGE_TAG="${2:-main}"

if [ -z "$IMAGE_NAME" ]; then
  echo "Usage: promote-to-staging.sh <image-name> [image-tag]"
  exit 1
fi

echo "[promote] Promoting $IMAGE_NAME:$IMAGE_TAG to staging"

bash scripts/render-kustomize.sh overlays/staging
kubectl apply -f rendered.yaml
kubectl rollout status deployment/"$IMAGE_NAME" --timeout=120s

echo "[promote] Deployed $IMAGE_NAME:$IMAGE_TAG to staging"
