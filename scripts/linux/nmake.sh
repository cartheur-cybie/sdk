#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
"${SCRIPT_DIR}/win-tool.sh" NMAKE.EXE "$@"
