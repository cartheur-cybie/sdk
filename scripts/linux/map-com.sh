#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 || $# -gt 2 ]]; then
    cat >&2 <<USAGE
Usage: $(basename "$0") <linux-serial-device> [com-number]
Example: $(basename "$0") /dev/ttyUSB0 1
USAGE
    exit 2
fi

device="$1"
com_number="${2:-1}"

if [[ ! -e "$device" ]]; then
    echo "ERROR: serial device not found: $device" >&2
    exit 1
fi

if ! [[ "$com_number" =~ ^[1-9][0-9]*$ ]]; then
    echo "ERROR: COM number must be a positive integer" >&2
    exit 1
fi

if [[ -z "${WINEPREFIX:-}" ]]; then
    wine_prefix="${HOME}/.wine"
else
    wine_prefix="${WINEPREFIX}"
fi

dosdevices="${wine_prefix}/dosdevices"
mkdir -p "$dosdevices"

link_path="${dosdevices}/com${com_number}"

rm -f "$link_path"
ln -s "$device" "$link_path"

echo "Mapped $device -> COM${com_number} via $link_path"
echo "Tip: ensure your user has serial permissions (dialout/uucp group)."
