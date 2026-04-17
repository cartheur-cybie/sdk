#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
# shellcheck source=scripts/linux/common.sh
source "${SCRIPT_DIR}/common.sh"

if [[ $# -lt 1 ]]; then
    cat >&2 <<USAGE
Usage: $(basename "$0") <TOOL.EXE> [args...]
Example: $(basename "$0") CC900.EXE -v
USAGE
    exit 2
fi

TOOL="$1"
shift

run_wine_tool "$TOOL" "$@"
