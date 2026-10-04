#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/.config/wallpapers"
LOG="$HOME/.cache/wallpaper-start.log"

mkdir -p "$HOME/.cache"

if ! pgrep -x awww-daemon >/dev/null; then
    awww-daemon >"$LOG" 2>&1 &
fi

for i in {1..20}; do
    if awww query >/dev/null 2>&1; then
        break
    fi
    sleep 0.25
done

WALLPAPER="$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | sort | head -n 1)"

if [ -n "$WALLPAPER" ]; then
    awww img "$WALLPAPER"
fi
