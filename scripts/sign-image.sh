#!/usr/bin/env bash
set -euo pipefail

IMAGE_REF="${1:-}"

if [ -z "$IMAGE_REF" ]; then
  echo "Usage: sign-image.sh <image-ref>"
  exit 1
fi

if ! command -v cosign &> /dev/null; then
  echo "[sign] cosign not found — install from https://github.com/sigstore/cosign"
  exit 1
fi

cosign sign --yes "$IMAGE_REF"

echo "[sign] Signed $IMAGE_REF"
