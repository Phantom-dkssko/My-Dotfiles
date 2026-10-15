# My-Dotfiles

> **Current version:** `0.5.4-alpha`

My personal Linux desktop configuration, built around **CachyOS, Hyprland, Waybar, Quickshell, and Wofi**.

The goal of this project is to make rebuilding and customizing my Linux desktop easier through organized configurations, themes, wallpapers, useful scripts, and documented keyboard shortcuts.

**Status:** Alpha — configurations and installation scripts are still evolving.

## ✨ Features

- 🪟 Hyprland Wayland compositor configuration
- 🎨 Waybar and Quickshell customization
- 🚀 Wofi application launcher
- 💻 Kitty terminal and Fish shell configuration
- 📁 Thunar file manager configuration
- 🖼️ Wallpaper collection and startup configuration
- 📦 Essential and optional package lists
- 🔄 Git-based versioning and rollback scripts
- 💾 Backups of selected existing configurations
- ⌨️ Keyboard shortcuts for common desktop actions
- 🛠️ Installation and update scripts

## 🖥️ Desktop environment

This project is primarily designed for:

- **Operating system:** CachyOS / Arch Linux
- **Window manager:** Hyprland
- **Status bar:** Waybar
- **Application launcher:** Wofi
- **Terminal:** Kitty
- **Shell:** Fish
- **File manager:** Thunar
- **Desktop shell:** Quickshell
- **Wallpaper daemon:** awww

Other Linux distributions may require changes to package names, dependencies, or configuration paths.

## ⚠️ Before installing

These are personal configurations and may not work perfectly on every computer.

- The installer uses `pacman` and is intended for Arch-based distributions.
- Review the scripts before executing them.
- Back up important files before installing.
- Selected existing configuration directories may be moved to a timestamped backup directory.
- Installing these dotfiles can change desktop behavior, appearance, and keyboard shortcuts.

**Do not run installation scripts blindly on a system you depend on.**

## 🚀 Installation

### 1. Install Git

On CachyOS or another Arch-based distribution:

```bash
sudo pacman -S --needed git
```

### 2. Clone the repository

```bash
git clone https://github.com/Phantom-dkssko/My-Dotfiles.git
```

Enter the project directory:

```bash
cd My-Dotfiles
```

### 3. Review the installer

Before running it, inspect the installation script:

```bash
less scripts/install/install.sh
```

Press `q` to exit.

### 4. Run the installer

When you are ready:

```bash
chmod +x scripts/install/install.sh
./scripts/install/install.sh
```

The installer uses `sudo` to install packages and may ask for your password.

### 5. Restart your session

After installation finishes, log out of Hyprland and log back in to apply the changes.

## 📦 What the installer does

The current installer is designed to:

1. Install essential packages from `packages/essential.txt`.
2. Back up selected existing configuration directories.
3. Install the Hyprland configuration.
4. Install Waybar and Wofi configurations.
5. Install Kitty and Fish configurations.
6. Install Thunar and Fastfetch configurations.
7. Install Quickshell configurations.
8. Copy the wallpaper collection.
9. Set Thunar as the default file manager.
10. Configure and enable the awww wallpaper daemon.
11. Set executable permissions on relevant scripts.

The exact behavior depends on the current contents of the installer and package lists.

## ⌨️ Keyboard shortcuts

The following are the main shortcuts intended for this setup. Check your actual Hyprland configuration if a binding differs.

| Shortcut | Action |
|---|---|
| `Super + Enter` | Open Kitty |
| `Super + D` | Open Wofi |
| `Super + Q` | Close the focused window |
| `Super + F` | Toggle fullscreen |
| `Super + E` | Open Thunar |
| `Super + B` | Open the browser |
| `Super + V` | Open Discord |
| `Super + 1–9` | Switch workspace |
| `Super + Shift + 1–9` | Move the focused window to a workspace |
| `Super + Arrow keys` | Navigate between windows |

`Super` usually refers to the Windows key on a standard keyboard.

To inspect the bindings on your system:

```bash
less ~/.config/hypr/hyprland.conf
```

## 📁 Repository structure

```text
My-Dotfiles/
├── commands/
│   ├── apps/
│   ├── cheatsheets/
│   └── linux/
├── docs/
├── dolphin/
├── fastfetch/
├── fish/
├── hyprland/
├── icons/
├── kitty/
├── packages/
│   ├── essential.txt
│   └── optional.txt
├── quickshell/
├── screenshots/
├── scripts/
│   ├── install/
│   │   └── install.sh
│   ├── rollback/
│   │   └── rice-rollback.sh
│   ├── start/
│   │   └── wallpaper-start.sh
│   └── update/
│       ├── rice-update.sh
│       └── rice-versions.sh
├── shortcuts/
├── themes/
├── thunar/
├── wallpapers/
├── waybar/
├── wofi/
├── CHANGELOG.md
├── README.md
└── VERSION
```

Some directories may contain experimental or unfinished features.

### Where to edit things

- `hyprland/` — Hyprland configuration and keyboard shortcuts.
- `waybar/` — status bar layout and styling.
- `wofi/` — application launcher styling.
- `kitty/` — terminal appearance and settings.
- `fish/` — shell configuration and functions.
- `quickshell/` — desktop widgets, shell components, and wallpaper interface.
- `wallpapers/` — wallpaper collection.
- `packages/` — essential and optional package lists.
- `scripts/install/` — installation script.
- `scripts/update/` — version update and listing scripts.
- `scripts/rollback/` — rollback script.
- `scripts/start/` — startup scripts.
- `commands/` — helper commands and cheatsheets.
- `docs/` — project documentation.
- `CHANGELOG.md` — project change history.
- `VERSION` — current development version.

## 🖼️ Wallpapers

The repository contains wallpapers used with the desktop configuration.

Add your own images to `wallpapers/` and adjust the wallpaper configuration in `quickshell/` as needed.

The collection also includes images sourced from [PikaOS Wallpapers](https://github.com/PikaOS-Linux/pkg-pika-wallpapers/tree/main/backgrounds/pika).

Check the original sources and their licensing terms before redistributing images.

## 🔄 Updating the dotfiles

To download the latest repository changes:

```bash
cd ~/My-Dotfiles
git pull
```

Review changes before applying updated configurations. Pulling updates the local repository; it does not necessarily apply every configuration change automatically.

## 🏷️ Versioning

This project uses Git tags and a semantic-style versioning workflow.

The current version is stored in the `VERSION` file.

Current version:

```text
0.5.4-alpha
```

Example Git tag:

```text
v0.5.4-alpha
```

The version update script can be run with:

```bash
./scripts/update/rice-update.sh
```

Version increments:

- **PATCH** — bug fixes and small corrections.
- **MINOR** — new features and improvements.
- **MAJOR** — significant changes that may require configuration updates.

The `alpha` suffix indicates that the project is still under development. Local tests and changes do not automatically become official releases.

## ↩️ Rollback

The project includes scripts for inspecting available versions and returning to an earlier version.

List available versions:

```bash
./scripts/update/rice-versions.sh
```

Run the rollback script:

```bash
./scripts/rollback/rice-rollback.sh
```

**Before using rollback:** save your work and make sure the Git working tree is clean. Review the script first, because restoring an earlier version can replace repository files. A Git rollback does not automatically restore every installed configuration in `~/.config`.

## ▶️ Terminal media tools

The repository may include experimental helper commands under `commands/apps/` for searching and playing online media using tools such as `fzf`, `yt-dlp`, and `mpv`.

These tools depend on external services and may stop working when those services change their access requirements. They are not guaranteed to work on every system and are separate from the core desktop installation.

## 🧰 Useful commands

Check the current project version:

```bash
cat VERSION
```

Check the Git working tree:

```bash
git status
```

Review recent commits:

```bash
git log --oneline -10
```

Inspect the installer:

```bash
less scripts/install/install.sh
```

Inspect the Hyprland configuration:

```bash
less hyprland/hyprland.conf
```

## 🔗 Project links

- [My-Dotfiles repository](https://github.com/Phantom-dkssko/My-Dotfiles)
- [Hyprland](https://hypr.land/)
- [Waybar](https://github.com/Alexays/Waybar)
- [Quickshell](https://quickshell.org/)
- [Wofi](https://hg.sr.ht/~scoopta/wofi)
- [Kitty](https://sw.kovidgoyal.net/kitty/)
- [Fish shell](https://fishshell.com/)
- [Thunar](https://docs.xfce.org/xfce/thunar/start)

## 📌 Project status

This project is actively evolving. Some components are stable enough for daily use, while others are experimental or still being documented.

Contributions, bug reports, and suggestions are welcome.

---

*Made for my own Linux desktop, shared so others can explore, customize, and learn from it.*
