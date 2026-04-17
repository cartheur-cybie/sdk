#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SDK_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
BIN_DIR="${SDK_ROOT}/bin"

require_cmd() {
    local cmd="$1"
    if ! command -v "$cmd" >/dev/null 2>&1; then
        echo "ERROR: required command not found: $cmd" >&2
        exit 1
    fi
}

require_bin_file() {
    local file="$1"
    local path="${BIN_DIR}/${file}"
    if [[ ! -f "$path" ]]; then
        echo "ERROR: missing Windows tool: $path" >&2
        exit 1
    fi
}

run_wine_tool() {
    local tool="$1"
    shift

    require_cmd wine
    require_bin_file "$tool"

    local wineprefix="${WINEPREFIX:-${HOME}/.wine}"
    local xdg_runtime="${XDG_RUNTIME_DIR:-/tmp/xdg-${UID}}"
    mkdir -p "${xdg_runtime}"
    chmod 700 "${xdg_runtime}" || true

    exec env -i \
        HOME="${HOME}" \
        USER="${USER:-}" \
        LOGNAME="${LOGNAME:-${USER:-}}" \
        PATH="${PATH}" \
        TERM="${TERM:-xterm}" \
        LANG="${LANG:-C.UTF-8}" \
        LC_ALL="${LC_ALL:-}" \
        XDG_RUNTIME_DIR="${xdg_runtime}" \
        WINEPREFIX="${wineprefix}" \
        THOME="${THOME:-}" \
        wine "${BIN_DIR}/${tool}" "$@"
}
