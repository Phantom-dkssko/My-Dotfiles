# Keybinds

This document contains the main keyboard shortcuts configured for Hyprland.

The main modifier key is:

```text
Super
```

Usually this is the Windows key.

---

## Applications

| Shortcut      | Action       |
| ------------- | ------------ |
| Super + Enter | Open Kitty   |
| Super + T     | Open Kitty   |
| Super + Space | Open Wofi    |
| Super + E     | Open Thunar  |
| Super + B     | Open browser |
| Super + V     | Open Discord |

---

## Window Management

| Shortcut      | Action                    |
| ------------- | ------------------------- |
| Super + Q     | Close active window       |
| Super + F     | Toggle fullscreen         |
| Super + M     | Exit Hyprland             |
| Super + Left  | Focus window to the left  |
| Super + Right | Focus window to the right |
| Super + Up    | Focus window above        |
| Super + Down  | Focus window below        |

---

## Moving Windows

| Shortcut              | Action            |
| --------------------- | ----------------- |
| Super + Shift + Left  | Move window left  |
| Super + Shift + Right | Move window right |
| Super + Shift + Up    | Move window up    |
| Super + Shift + Down  | Move window down  |

---

## Workspaces

| Shortcut  | Action      |
| --------- | ----------- |
| Super + 1 | Workspace 1 |
| Super + 2 | Workspace 2 |
| Super + 3 | Workspace 3 |
| Super + 4 | Workspace 4 |
| Super + 5 | Workspace 5 |
| Super + 6 | Workspace 6 |
| Super + 7 | Workspace 7 |
| Super + 8 | Workspace 8 |
| Super + 9 | Workspace 9 |

Move the active window:

| Shortcut          | Action                     |
| ----------------- | -------------------------- |
| Super + Shift + 1 | Move window to workspace 1 |
| Super + Shift + 2 | Move window to workspace 2 |
| Super + Shift + 3 | Move window to workspace 3 |
| Super + Shift + 4 | Move window to workspace 4 |
| Super + Shift + 5 | Move window to workspace 5 |
| Super + Shift + 6 | Move window to workspace 6 |
| Super + Shift + 7 | Move window to workspace 7 |
| Super + Shift + 8 | Move window to workspace 8 |
| Super + Shift + 9 | Move window to workspace 9 |

---

## Rice Controls

| Shortcut          | Action                        |
| ----------------- | ----------------------------- |
| Super + W         | Open wallpaper switcher       |
| Super + Shift + W | Open wallpaper theme selector |
| Super + Shift + B | Open Waybar theme selector    |
| Super + Shift + R | Reload Hyprland               |

---

## Screenshots

Take a screenshot of a selected area:

```text
Super + Shift + S
```

This uses:

* `grim`
* `slurp`
* `wl-clipboard`

The selected screenshot is copied directly to the clipboard.

---

## Mouse Controls

| Shortcut                   | Action        |
| -------------------------- | ------------- |
| Super + Left Mouse Button  | Move window   |
| Super + Right Mouse Button | Resize window |

---

## Quick Reference

```text
Super + Enter          Terminal
Super + Space          Launcher
Super + E              File manager
Super + B              Browser
Super + Q              Close window
Super + F              Fullscreen
Super + M              Exit Hyprland

Super + W              Wallpaper switcher
Super + Shift + W      Wallpaper themes
Super + Shift + B      Waybar themes
Super + Shift + R      Reload Hyprland
Super + Shift + S      Screenshot

Super + Arrow          Focus
Super + Shift + Arrow  Move window

Super + 1-9            Workspace
Super + Shift + 1-9    Move window
```

---

## Configuration

The Hyprland keybind configuration is located at:

```text
~/.config/hypr/hyprland.conf
```

Repository version:

```text
hyprland/hyprland.conf
```

After modifying keybinds, reload Hyprland:

```bash
hyprctl reload
```
