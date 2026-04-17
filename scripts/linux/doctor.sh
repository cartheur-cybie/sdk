#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
# shellcheck source=scripts/linux/common.sh
source "${SCRIPT_DIR}/common.sh"

required_tools=(
    NMAKE.EXE
    CC900.EXE
    ASM900.EXE
    TULINK.EXE
    TUCONV.EXE
    TULIB.EXE
    THC1.EXE
    THC2.EXE
    adpcm66.exe
)

status=0

echo "SDK root: ${SDK_ROOT}"

if command -v wine >/dev/null 2>&1; then
    echo "wine: $(command -v wine)"
else
    echo "wine: MISSING"
    status=1
fi

if command -v g++ >/dev/null 2>&1; then
    echo "g++: $(command -v g++)"
else
    echo "g++: MISSING"
    status=1
fi

for tool in "${required_tools[@]}"; do
    if [[ -f "${BIN_DIR}/${tool}" ]]; then
        echo "tool: ${tool} [ok]"
    else
        echo "tool: ${tool} [missing]"
        status=1
    fi
done

native_tools=(
    convic3
    splitic3
    mergeic3
    adp2c
    sicburn
    sicgrab
)

for tool in "${native_tools[@]}"; do
    if [[ -x "${BIN_DIR}/${tool}" ]]; then
        echo "native: ${tool} [ok]"
    else
        echo "native: ${tool} [missing] (run: make tools-native)"
    fi
done

if [[ $status -ne 0 ]]; then
    printf "\nDoctor check failed. See docs/linux.md for setup instructions.\n" >&2
    exit $status
fi

printf "\nDoctor check passed.\n"
