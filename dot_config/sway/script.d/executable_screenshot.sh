#!/bin/bash
# screenshot.sh — screen capture helper using grim + wl-clipboard
# Usage: screenshot.sh [full|region|window] [save]

set -euo pipefail

SCREENSHOT_DIR="${SCREENSHOT_DIR:-$HOME/Screenshots}"
mkdir -p "$SCREENSHOT_DIR"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
FILENAME="screenshot_$TIMESTAMP.png"
FILEPATH="$SCREENSHOT_DIR/$FILENAME"

MODE="${1:-full}"   # full | region | window
SAVE="${2:-}"       # pass "save" to also write to disk

usage() {
    echo "Usage: $(basename "$0") [full|region|window] [save]"
    echo ""
    echo "  full     → Capture the entire screen (default)"
    echo "  region   → Select an area with the mouse (requires slurp)"
    echo "  window   → Capture the focused window (requires slurp + swaymsg)"
    echo ""
    echo "  save     → Pass 'save' as second argument to also write to disk."
    echo "             Otherwise the screenshot is only copied to the clipboard."
    echo ""
    echo "Environment variable:"
    echo "  SCREENSHOT_DIR  Output directory (default: ~/Screenshots)"
    exit 0
}

[[ "${1:-}" == "-h" || "${1:-}" == "--help" ]] && usage

# Dependency check
for cmd in grim wl-copy; do
    if ! command -v "$cmd" &>/dev/null; then
        echo "Error: '$cmd' not found. Please install it." >&2
        exit 1
    fi
done

TMP=$(mktemp /tmp/screenshot_XXXXXX.png)
trap 'rm -f "$TMP"' EXIT

case "$MODE" in
    full)
        grim "$TMP"
        LABEL="Full screen"
        ;;
    region)
        if ! command -v slurp &>/dev/null; then
            echo "Error: 'slurp' not found (required for region mode)." >&2
            exit 1
        fi
        SELECTION=$(slurp) || { echo "Region selection cancelled." >&2; exit 1; }
        grim -g "$SELECTION" "$TMP"
        LABEL="Region"
        ;;
    window)
        if ! command -v slurp &>/dev/null || ! command -v swaymsg &>/dev/null; then
            echo "Error: 'slurp' and 'swaymsg' are required for window mode." >&2
            exit 1
        fi
        GEOMETRY=$(swaymsg -t get_tree | python3 -c "
import json, sys
def find_focused(node):
    if node.get('focused'):
        r = node['rect']
        print(f\"{r['x']},{r['y']} {r['width']}x{r['height']}\")
        return True
    for child in node.get('nodes', []) + node.get('floating_nodes', []):
        if find_focused(child):
            return True
find_focused(json.load(sys.stdin))
") || { echo "Error: Could not find focused window." >&2; exit 1; }
        grim -g "$GEOMETRY" "$TMP"
        LABEL="Window"
        ;;
    *)
        echo "Unknown mode: '$MODE'" >&2
        usage
        ;;
esac

# Copy to clipboard
wl-copy < "$TMP"
echo "✓ $LABEL screenshot copied to clipboard."

# Optionally save to disk
if [[ "$SAVE" == "save" ]]; then
    cp "$TMP" "$FILEPATH"
    echo "✓ Saved to: $FILEPATH"
fi
