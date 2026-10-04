#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG="$SCRIPT_DIR/theme.conf"

THEME=$(printf "terminal\n glass\nminimal" | sed 's/^ //' | wofi --dmenu --prompt "Select Theme")

case "$THEME" in
    terminal|glass|minimal)
        printf '%s\n' "$THEME" > "$CONFIG"
        ;;
    *)
        exit 0
        ;;
esac
