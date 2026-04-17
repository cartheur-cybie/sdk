#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/../.." && pwd)"

sample="${1:-hello}"
target="${2:-}"
sample_dir="${ROOT_DIR}/samples/${sample}"

if [[ ! -d "$sample_dir" ]]; then
    echo "ERROR: sample not found: $sample" >&2
    exit 1
fi

pushd "$sample_dir" >/dev/null
if [[ -n "$target" ]]; then
    "${SCRIPT_DIR}/nmake.sh" /nologo "$target"
else
    "${SCRIPT_DIR}/nmake.sh" /nologo
fi
popd >/dev/null
