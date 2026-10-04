# Themes

The rice includes multiple visual themes for different parts of the desktop.

The main theme systems are:

* Waybar themes
* Quickshell wallpaper themes
* Kitty configuration
* Wofi styling

---

## Waybar Themes

Waybar currently includes four themes:

```text
Nord
Glass
Minimal
Terminal
```

They are stored in:

```text
~/.config/waybar/themes/
```

Repository location:

```text
waybar/themes/
```

---

## Changing the Waybar Theme

Use:

```text
Super + Shift + B
```

A Wofi menu will appear with the available themes.

Select one of:

* Nord
* Glass
* Minimal
* Terminal

The selected theme is copied to:

```text
~/.config/waybar/style.css
```

Waybar is then restarted automatically.

---

## Waybar Theme Selector

The selector script is:

```text
~/.config/waybar/theme-selector.sh
```

Repository version:

```text
waybar/theme-selector.sh
```

It uses Wofi to display the available themes.

---

## Quickshell Themes

The wallpaper interface uses Quickshell and currently has three visual themes:

```text
Terminal
Glass
Minimal
```

They are stored in:

```text
quickshell/wallpaper-switcher/themes/
```

Each theme has its own `shell.qml`.

---

## Terminal Theme

The Terminal theme is inspired by classic terminal interfaces.

Characteristics:

* Dark interface
* Green terminal-style colors
* Simple layout
* Keyboard-focused navigation
* Wallpaper list and preview

It is designed to be lightweight and practical.

---

## Glass Theme

The Glass theme uses a translucent interface with a more modern appearance.

Characteristics:

* Glass-style panel
* Wallpaper thumbnails
* Visual preview
* Mouse selection
* Apply and Close buttons
* Keyboard navigation

This is the most visual-oriented wallpaper interface.

---

## Minimal Theme

The Minimal theme focuses on simplicity.

Characteristics:

* Reduced visual elements
* Simple wallpaper selection
* Lightweight interface
* Minimal decoration

---

## Changing the Quickshell Theme

Use:

```text
Super + Shift + W
```

This opens the theme selector.

Available themes:

```text
terminal
glass
minimal
```

The selected theme is stored in:

```text
quickshell/wallpaper-switcher/theme.conf
```

---

## Opening the Wallpaper Switcher

Use:

```text
Super + W
```

The launcher script is:

```text
quickshell/wallpaper-switcher/launch.sh
```

The script reads `theme.conf` and starts the selected Quickshell theme.

---

## Adding a New Quickshell Theme

Create a new directory:

```text
quickshell/wallpaper-switcher/themes/my-theme/
```

Then create:

```text
shell.qml
```

The theme should provide the same basic wallpaper selection functionality as the existing themes.

The theme must also be added to:

```text
theme-selector.sh
```

so it appears in the selector.

---

## Adding a New Waybar Theme

Create a directory:

```text
waybar/themes/my-theme/
```

Then create:

```text
style.css
```

Add the theme to:

```text
waybar/theme-selector.sh
```

For example:

```bash
MyTheme)
    cp "$THEMES_DIR/my-theme/style.css" "$WAYBAR_DIR/style.css"
    ;;
```

Also add the theme name to the Wofi menu.

---

## Kitty

Kitty has its own configuration:

```text
~/.config/kitty/kitty.conf
```

Repository:

```text
kitty/kitty.conf
```

Additional theme configuration files are stored alongside it.

Current files include:

```text
kitty/
├── kitty.conf
├── current-theme.conf
└── Adwaita dark.conf
```

---

## Wofi

Wofi provides the launcher and is also used by several theme selectors.

Configuration:

```text
~/.config/wofi/style.css
```

Repository:

```text
wofi/style.css
```

---

## Theme Philosophy

The goal of the rice is not to have one fixed appearance.

Instead, the system should allow different visual styles while keeping the same underlying workflow.

Themes should therefore:

* Keep the same basic functionality
* Be easy to switch
* Be easy to modify
* Avoid unnecessary dependencies
* Keep the configuration portable
