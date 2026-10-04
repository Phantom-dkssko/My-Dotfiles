#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

THEME="$(cat "$SCRIPT_DIR/theme.conf")"

exec qs -c "$SCRIPT_DIR/themes/$THEME"
