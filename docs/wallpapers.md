# Wallpapers

The rice uses **awww** as the wallpaper daemon and **Quickshell** as the graphical wallpaper selector.

The system is designed to make changing wallpapers fast while keeping the wallpaper collection inside the dotfiles repository.

---

## Architecture

The wallpaper system has three main parts:

```text
Wallpapers
    │
    ▼
Quickshell
    │
    ▼
Wallpaper Selector
    │
    ▼
awww
    │
    ▼
Hyprland Display
```

### Wallpapers

The actual wallpaper files are stored in:

```text
wallpapers/
```

### Quickshell

Quickshell provides the graphical interface used to browse and select wallpapers.

Location:

```text
quickshell/wallpaper-switcher/
```

### awww

awww is responsible for actually displaying the selected wallpaper.

---

## awww

The wallpaper daemon is:

```text
awww-daemon
```

Check its status:

```bash
systemctl --user status awww-daemon
```

The service used by the rice is:

```text
~/.config/systemd/user/awww-daemon.service
```

Start it manually:

```bash
systemctl --user start awww-daemon
```

Enable it at login:

```bash
systemctl --user enable awww-daemon
```

Enable and start it together:

```bash
systemctl --user enable --now awww-daemon
```

---

## Testing a Wallpaper Manually

To test a wallpaper without using the graphical selector:

```bash
awww img /path/to/wallpaper.jpg
```

Example:

```bash
awww img ~/my-dotfiles/wallpapers/example.jpg
```

The exact wallpaper filename can be found with:

```bash
ls ~/my-dotfiles/wallpapers
```

---

## Wallpaper Switcher

The main wallpaper interface is launched with:

```text
Super + W
```

The launcher is:

```text
quickshell/wallpaper-switcher/launch.sh
```

It reads the currently selected theme from:

```text
quickshell/wallpaper-switcher/theme.conf
```

Then starts the corresponding Quickshell configuration.

---

## Wallpaper Themes

The wallpaper selector currently has:

```text
Terminal
Glass
Minimal
```

Theme files are located at:

```text
quickshell/wallpaper-switcher/themes/
```

---

## Changing Wallpaper Theme

Use:

```text
Super + Shift + W
```

This opens the theme selector.

The selected theme is saved in:

```text
quickshell/wallpaper-switcher/theme.conf
```

---

## Wallpaper Collection

The repository stores wallpapers in:

```text
wallpapers/
```

This makes the wallpaper collection part of the rice itself.

When the repository is installed on a new system, the installer copies the wallpaper collection to the user's configuration.

---

## Wallpaper Sources

Some wallpapers in the collection come from the PikaOS wallpaper project:

[PikaOS Wallpapers](https://github.com/PikaOS-Linux/pkg-pika-wallpapers/tree/main/backgrounds/pika)

Third-party artwork should remain subject to its original license and attribution requirements.

---

## Adding Wallpapers

To add a wallpaper to the collection:

1. Copy the image into:

```text
wallpapers/
```

2. Test it with awww:

```bash
awww img ~/my-dotfiles/wallpapers/IMAGE_NAME
```

3. Open the Quickshell wallpaper selector.

4. Verify that the image appears correctly.

5. Add the new file to Git:

```bash
git add wallpapers/
```

6. Commit the change:

```bash
git commit -m "feat: add wallpaper"
```

---

## Supported Image Files

The collection may contain common image formats such as:

```text
.jpg
.jpeg
.png
.webp
```

Very large images may use more memory and take longer to load.

---

## Troubleshooting

### awww is not working

Check the service:

```bash
systemctl --user status awww-daemon
```

Restart it:

```bash
systemctl --user restart awww-daemon
```

---

### Wallpaper does not change

Check whether awww is responding:

```bash
awww query
```

Then try a wallpaper manually:

```bash
awww img ~/my-dotfiles/wallpapers/IMAGE_NAME
```

---

### Quickshell does not open

Try launching it manually:

```bash
~/my-dotfiles/quickshell/wallpaper-switcher/launch.sh
```

If there is an error, run the selected theme directly:

```bash
qs -c ~/my-dotfiles/quickshell/wallpaper-switcher/themes/terminal
```

Replace `terminal` with:

```text
glass
```

or:

```text
minimal
```

---

## Design Goal

The wallpaper system is intended to provide:

* Fast wallpaper switching
* Multiple visual interfaces
* Keyboard navigation
* Mouse interaction where supported
* Local wallpaper storage
* Easy customization
* Integration with Hyprland
* Reproducibility after reinstalling the system

The long-term goal is to make wallpapers feel like another configurable part of the rice rather than a separate application.
