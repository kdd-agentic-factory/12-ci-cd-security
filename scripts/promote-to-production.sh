#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME="${1:-}"
IMAGE_TAG="${2:-}"

if [ -z "$IMAGE_NAME" ] || [ -z "$IMAGE_TAG" ]; then
  echo "Usage: promote-to-production.sh <image-name> <image-tag>"
  exit 1
fi

echo "[promote] Promoting $IMAGE_NAME:$IMAGE_TAG to production"
echo "[promote] Verifying release evidence..."

if [ ! -f sbom.spdx.json ]; then
  echo "[promote] ERROR: sbom.spdx.json not found — cannot promote to production"
  exit 1
fi

bash scripts/render-kustomize.sh overlays/production
kubectl apply -f rendered.yaml
kubectl rollout status deployment/"$IMAGE_NAME" --timeout=300s

echo "[promote] Deployed $IMAGE_NAME:$IMAGE_TAG to production"
