#!/usr/bin/env bash

WAYBAR_DIR="$HOME/.config/waybar"
THEMES_DIR="$WAYBAR_DIR/themes"

THEME=$(printf '%s\n' "Nord" "Glass" "Minimal" "Terminal" | wofi --dmenu --prompt "Waybar Theme")

case "$THEME" in
    Nord)
        cp "$THEMES_DIR/nord/style.css" "$WAYBAR_DIR/style.css"
        ;;
    Glass)
        cp "$THEMES_DIR/glass/style.css" "$WAYBAR_DIR/style.css"
        ;;
    Minimal)
        cp "$THEMES_DIR/minimal/style.css" "$WAYBAR_DIR/style.css"
        ;;
    Terminal)
        cp "$THEMES_DIR/terminal/style.css" "$WAYBAR_DIR/style.css"
        ;;
    *)
        exit 0
        ;;
esac

pkill waybar
waybar >/dev/null 2>&1 &
