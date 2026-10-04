# Installation & Recovery

This document explains how to install the rice on a fresh CachyOS installation and restore the desktop environment.

---

## Requirements

The primary target is:

* CachyOS
* Hyprland
* Wayland
* Fish shell
* Git
* Internet connection

The installer uses `pacman`, so Arch-based distributions are recommended.

---

## Fresh Installation

### 1. Install Git

If Git is not already installed:

```bash
sudo pacman -S git
```

---

### 2. Clone the repository

Clone the dotfiles repository:

```bash
git clone <REPOSITORY_URL>
```

Enter the repository:

```bash
cd my-dotfiles
```

---

### 3. Run the installer

Make the installer executable:

```bash
chmod +x scripts/install/install.sh
```

Run it:

```bash
./scripts/install/install.sh
```

The installer will install the required packages and copy the configuration files into `~/.config`.

---

## What Gets Installed

The installer currently handles:

* Hyprland
* Waybar
* Wofi
* Kitty
* Fish
* Thunar
* Fastfetch
* Quickshell
* awww
* grim
* slurp
* wl-clipboard
* qt6ct

It also installs the rice's wallpapers and configures the wallpaper daemon.

---

## Configuration Backup

Before replacing existing configurations, the installer creates a backup.

The backup is stored under:

```text
~/.config/dotfiles-backup-DATE-TIME/
```

For example:

```text
~/.config/dotfiles-backup-20261004-120000/
```

This allows the previous configuration to be recovered if something goes wrong.

---

## After Installation

After the installer finishes, restart the graphical session.

The easiest option is to log out and log back into Hyprland.

Then test:

```text
Super + Enter
```

to open Kitty.

Test:

```text
Super + E
```

to open Thunar.

Test:

```text
Super + Space
```

to open Wofi.

Test:

```text
Super + W
```

to open the wallpaper switcher.

---

## Verify Hyprland

Check for configuration errors:

```bash
hyprctl configerrors
```

A correct configuration should not report errors.

Reload Hyprland if necessary:

```bash
hyprctl reload
```

---

## Verify Waybar

Restart Waybar:

```bash
pkill waybar
waybar &
```

The bar should appear at the top of the screen.

---

## Verify awww

Check the wallpaper daemon:

```bash
systemctl --user status awww-daemon
```

It should report that the service is active.

---

## Verify Quickshell

Launch the wallpaper interface manually:

```bash
~/my-dotfiles/quickshell/wallpaper-switcher/launch.sh
```

If the interface opens, Quickshell and the wallpaper switcher are working.

---

## Restoring After Formatting

The intended recovery workflow is:

```text
1. Install CachyOS
2. Install Hyprland
3. Install Git
4. Clone this repository
5. Enter the repository
6. Run install.sh
7. Log out
8. Log back into Hyprland
9. Test the rice
```

In commands:

```bash
sudo pacman -S git
git clone <REPOSITORY_URL>
cd my-dotfiles
chmod +x scripts/install/install.sh
./scripts/install/install.sh
```

The goal of the project is to make this process as close as possible to a complete one-command restoration.

---

## Updating the Rice

Before updating, check the Git status:

```bash
git status
```

Pull the latest version:

```bash
git pull
```

If configuration files changed, review them before applying anything.

---

## Important

Do not run the installer blindly on a system containing important custom configurations.

The installer creates backups, but it is still recommended to keep a separate backup of important personal files.

The dotfiles repository should contain configuration and scripts, not personal secrets.

Never commit:

* passwords
* API keys
* tokens
* private keys
* personal credentials
* sensitive machine data
