#!/usr/bin/env bash
# Compatibility shim — use status.sh for a full installation check
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
exec "$SCRIPT_DIR/status.sh" "$@"
