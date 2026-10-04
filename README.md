# My Dotfiles

Personal dotfiles and rice configuration for **CachyOS + Hyprland**.

This repository contains my desktop configuration, themes, wallpapers, scripts, package lists and tools used to rebuild my setup after reinstalling the system.

> **Status:** Active development
> **Current version:** `0.5.3-alpha`

---

## ✨ Features

* 🪟 Hyprland window manager configuration
* 📊 Waybar with multiple themes
* 🚀 Wofi application launcher
* 🖥️ Customized Kitty terminal
* 🐚 Fish shell configuration
* 📁 Thunar file manager integration
* 🖼️ Wallpaper management with awww
* 🎨 Quickshell wallpaper and theme selector
* 💻 Customized Fastfetch
* 📦 Essential and optional package lists
* ⚙️ Automatic installation script
* 🔄 Git-based versioning
* ↩️ Version rollback system
* ⌨️ Custom Hyprland keybinds

---

## 🖥️ Environment

| Component          | Software   |
| ------------------ | ---------- |
| Operating System   | CachyOS    |
| Window Manager     | Hyprland   |
| Shell              | Fish       |
| Terminal           | Kitty      |
| Status Bar         | Waybar     |
| Launcher           | Wofi       |
| File Manager       | Thunar     |
| Wallpaper Daemon   | awww       |
| Wallpaper UI       | Quickshell |
| System Information | Fastfetch  |
| Qt Configuration   | qt6ct      |

---

## 📦 Components

The main applications and projects used by this rice:

* [Hyprland](https://hyprland.org/)
* [Waybar](https://github.com/Alexays/Waybar)
* [Wofi](https://github.com/SimplyCEO/wofi)
* [Kitty](https://sw.kovidgoyal.net/kitty/)
* [Fish](https://fishshell.com/)
* [Thunar](https://docs.xfce.org/xfce/thunar/start)
* [Fastfetch](https://github.com/fastfetch-cli/fastfetch)
* [Quickshell](https://github.com/quickshell-mirror/quickshell)
* [awww](https://github.com/waycrate/awww)
* [grim](https://github.com/emersion/grim)
* [slurp](https://github.com/emersion/slurp)
* [wl-clipboard](https://github.com/bugaevc/wl-clipboard)
* [qt6ct](https://github.com/trialuser02/qt6ct)

---

## 🎨 Themes

### Waybar

The rice currently includes four Waybar themes:

* Nord
* Glass
* Minimal
* Terminal

Change the Waybar theme with:

**Super + Shift + B**

### Wallpaper Switcher

The Quickshell wallpaper interface currently includes:

* Terminal
* Glass
* Minimal

Open the wallpaper switcher:

**Super + W**

Open the wallpaper theme selector:

**Super + Shift + W**

---

## 🖼️ Wallpapers

Wallpapers used by the rice are stored inside:

```text
wallpapers/
```

The collection includes wallpapers from different sources and artists.

### PikaOS Wallpapers

Some wallpapers come from the PikaOS wallpaper collection:

[PikaOS Wallpapers](https://github.com/PikaOS-Linux/pkg-pika-wallpapers/tree/main/backgrounds/pika)

Please respect the original licenses and credits of wallpapers and artwork included in this repository.

---

## ⌨️ Keybinds

| Shortcut                   | Action                   |
| -------------------------- | ------------------------ |
| Super + Enter              | Open terminal            |
| Super + T                  | Open terminal            |
| Super + Space              | Open launcher            |
| Super + E                  | Open Thunar              |
| Super + B                  | Open browser             |
| Super + Q                  | Close active window      |
| Super + M                  | Exit Hyprland            |
| Super + Shift + R          | Reload Hyprland          |
| Super + V                  | Open Discord             |
| Super + F                  | Toggle fullscreen        |
| Super + W                  | Wallpaper switcher       |
| Super + Shift + W          | Wallpaper theme selector |
| Super + Shift + B          | Waybar theme selector    |
| Super + Arrow Keys         | Move focus               |
| Super + Shift + Arrow Keys | Move window              |
| Super + 1-9                | Change workspace         |
| Super + Shift + 1-9        | Move window to workspace |
| Super + Shift + S          | Screenshot               |

---

## 📁 Project Structure

```text
my-dotfiles/
│
├── hyprland/
│   └── hyprland.conf
│
├── waybar/
│   ├── config.jsonc
│   ├── style.css
│   ├── theme-selector.sh
│   └── themes/
│
├── wofi/
│   └── style.css
│
├── kitty/
│   ├── kitty.conf
│   ├── current-theme.conf
│   └── Adwaita dark.conf
│
├── fish/
│   └── config.fish
│
├── thunar/
│   ├── accels.scm
│   └── uca.xml
│
├── fastfetch/
│   ├── config.jsonc
│   └── aesthetic.jpg
│
├── quickshell/
│   └── wallpaper-switcher/
│
├── wallpapers/
│
├── packages/
│   ├── essential.txt
│   └── optional.txt
│
├── scripts/
│   ├── install/
│   ├── update/
│   ├── sync/
│   └── rollback/
│
├── commands/
├── shortcuts/
├── themes/
├── icons/
├── screenshots/
├── docs/
│
├── VERSION
├── CHANGELOG.md
└── README.md
```

---

## 🚀 Installation

The goal of this repository is to make rebuilding the desktop after a system reinstall as simple as possible.

### 1. Clone the repository

```bash
git clone <REPOSITORY_URL>
cd my-dotfiles
```

### 2. Run the installer

```bash
chmod +x scripts/install/install.sh
./scripts/install/install.sh
```

The installer handles the main parts of the setup automatically.

### What the installer does

1. Installs essential packages.
2. Creates a backup of existing configurations.
3. Installs the Hyprland configuration.
4. Installs Waybar and its themes.
5. Installs Wofi.
6. Installs Kitty configuration.
7. Installs Fish configuration.
8. Installs Thunar configuration.
9. Installs Fastfetch configuration.
10. Installs Quickshell configuration.
11. Copies the wallpaper collection.
12. Sets Thunar as the default file manager.
13. Configures the awww wallpaper daemon.
14. Sets executable permissions on the required scripts.

After installation, logging out and back into Hyprland is recommended.

---

## 💾 Backups

The installer does not simply overwrite everything.

Existing configuration directories are moved into a timestamped backup directory before the new configuration is installed.

Example:

```text
~/.config/dotfiles-backup-20261004-120000/
```

This makes it possible to recover previous configurations if necessary.

---

## 🔄 Versioning

The project uses Git tags and semantic-style versioning.

Current version:

```text
0.5.3-alpha
```

Example release tag:

```text
v0.5.3-alpha
```

The project uses:

* **PATCH** — small fixes
* **MINOR** — new features
* **MAJOR** — major changes

Development versions currently use the `alpha` suffix.

---

## ↩️ Rollback

The rice includes a rollback system for returning to previous versions.

The goal is to make it possible to experiment with the rice without permanently breaking the setup.

Available versions can be viewed with:

```bash
./scripts/rice-versions.sh
```

Previous versions can be restored using:

```bash
./scripts/rollback/rice-rollback.sh
```

Rollback requires the Git working tree to be clean.

---

## 🛠️ Development

This repository is actively developed directly on the system where the rice is being used.

Before making changes:

```bash
git status
```

After making changes:

```bash
git add .
git commit
```

The project uses Git tags to preserve stable points in the development history.

---

## 🗺️ Roadmap

### Completed

* [x] Hyprland configuration
* [x] Waybar configuration
* [x] Waybar theme selector
* [x] Wofi configuration
* [x] Kitty configuration
* [x] Fish configuration
* [x] Thunar configuration
* [x] Fastfetch configuration
* [x] awww wallpaper system
* [x] Quickshell wallpaper switcher
* [x] Wallpaper themes
* [x] Package lists
* [x] Automatic installer
* [x] Version system
* [x] Rollback system

### Planned

* [ ] Git synchronization script
* [ ] More wallpaper themes
* [ ] More Waybar themes
* [ ] More automated configuration checks
* [ ] Improved troubleshooting tools
* [ ] Full one-command restoration
* [ ] Better documentation
* [ ] Rice screenshots and showcase

---

## 🧪 Tested Environment

The rice is currently developed and tested on:

```text
CachyOS
Hyprland
Wayland
Fish
```

Other Arch-based distributions may work, but CachyOS is the primary target.

---

## 🐛 Troubleshooting

### Hyprland configuration

Check for configuration errors:

```bash
hyprctl configerrors
```

Reload the configuration:

```bash
hyprctl reload
```

### Waybar

Restart Waybar:

```bash
pkill waybar
waybar &
```

### awww

Check the daemon:

```bash
systemctl --user status awww-daemon
```

### Quickshell

Launch the wallpaper switcher manually:

```bash
~/my-dotfiles/quickshell/wallpaper-switcher/launch.sh
```

---

## 🔐 Security

Machine-specific or sensitive information should never be committed to this repository.

Do not commit:

* passwords
* API keys
* access tokens
* private keys
* session data
* personal secrets
* unnecessary machine-specific paths

Configuration should remain as portable as possible.

---

## 📝 Credits

This project uses and builds upon many open-source projects.

Special thanks to the developers of:

* Hyprland
* Waybar
* Wofi
* Kitty
* Fish
* Thunar
* Quickshell
* awww
* Fastfetch
* grim
* slurp
* wl-clipboard
* qt6ct

Wallpaper sources and artists are credited where applicable.

---

## 📜 License

The configuration files and scripts in this repository are personal work and are provided for personal use.

Third-party software, artwork, wallpapers and other external resources remain under their respective licenses.

---

## ❤️ About

This project started as a personal Linux rice and is gradually becoming a complete system for rebuilding and maintaining my desktop environment.

The long-term goal is simple:

> **Install CachyOS → clone the repository → run the installer → get the environment back.**
