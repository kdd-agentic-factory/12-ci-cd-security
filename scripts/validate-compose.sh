#!/usr/bin/env bash
set -euo pipefail

COMPOSE_FILE="${1:-docker-compose.yml}"

docker compose -f "$COMPOSE_FILE" config
