#!/usr/bin/env bash
set -euo pipefail

IMAGE_REF="${1:-}"

if [ -z "$IMAGE_REF" ]; then
  echo "Usage: generate-sbom.sh <image-ref>"
  exit 1
fi

docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  anchore/syft:latest "$IMAGE_REF" -o spdx-json > sbom.spdx.json

echo "[sbom] Generated sbom.spdx.json for $IMAGE_REF"
