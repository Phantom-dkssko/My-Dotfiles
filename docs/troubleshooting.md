# Troubleshooting

Common problems and solutions for the rice.

---

## Hyprland

Check configuration errors:

```bash
hyprctl configerrors
```

Reload Hyprland:

```bash
hyprctl reload
```

## Waybar

Restart Waybar:

```bash
pkill waybar
waybar &
```

Check the configuration:

```bash
ls ~/.config/waybar
```

## awww

Check the wallpaper daemon:

```bash
systemctl --user status awww-daemon
```

Restart it:

```bash
systemctl --user restart awww-daemon
```

Test a wallpaper:

```bash
awww img ~/.config/wallpapers/IMAGE.jpg
```

## Quickshell

Check the wallpaper switcher:

```bash
ls ~/my-dotfiles/quickshell/wallpaper-switcher
```

Launch it manually:

```bash
~/my-dotfiles/quickshell/wallpaper-switcher/launch.sh
```

If necessary, check Quickshell directly:

```bash
qs -c ~/my-dotfiles/quickshell/wallpaper-switcher
```

## Wofi

Test the application launcher:

```bash
wofi --show drun
```

If the launcher was working before, reload Hyprland:

```bash
hyprctl reload
```

## Thunar

Check the default file manager:

```bash
xdg-mime query default inode/directory
```

Set Thunar as the default again:

```bash
xdg-mime default thunar.desktop inode/directory
```

## Fish

Check the current shell:

```bash
echo $SHELL
```

Check the Fish configuration:

```bash
ls ~/.config/fish/config.fish
```

## Packages

Check whether a package is installed:

```bash
pacman -Q PACKAGE
```

Install a package:

```bash
sudo pacman -S PACKAGE
```

## Git

Check the repository status:

```bash
cd ~/my-dotfiles
git status
```

Check recent commits:

```bash
git log --oneline --decorate -10
```

## Installer

Before running the installer, make sure the repository is clean and the installer is executable:

```bash
cd ~/my-dotfiles
git status
chmod +x scripts/install/install.sh
```

Run:

```bash
./scripts/install/install.sh
```

The installer creates a backup of existing configuration directories before replacing them.

## Backup

Backups created by the installer are stored under:

```text
~/.config/dotfiles-backup-DATE-TIME/
```

Do not delete a backup until the new configuration has been tested.

## Important

When troubleshooting, check the actual error output before changing configuration files. Avoid randomly modifying multiple files at once.
