#!/usr/bin/env bash
set -euo pipefail

OVERLAY="${1:-overlays/local}"

kubectl kustomize "$OVERLAY" > rendered.yaml

echo "[kustomize] Rendered $OVERLAY to rendered.yaml"
