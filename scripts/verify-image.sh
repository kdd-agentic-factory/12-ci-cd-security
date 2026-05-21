#!/usr/bin/env bash
set -euo pipefail

IMAGE_REF="${1:-}"

if [ -z "$IMAGE_REF" ]; then
  echo "Usage: verify-image.sh <image-ref>"
  exit 1
fi

if ! command -v cosign &> /dev/null; then
  echo "[verify] cosign not found — install from https://github.com/sigstore/cosign"
  exit 1
fi

cosign verify "$IMAGE_REF"

echo "[verify] Signature verified for $IMAGE_REF"
