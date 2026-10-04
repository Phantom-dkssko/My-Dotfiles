# Development

Development and maintenance guide for My Dotfiles.

---

## Repository

The rice repository is located at:

```text
~/my-dotfiles
```

Enter the repository:

```bash
cd ~/my-dotfiles
```

Check the current state:

```bash
git status
```

---

## Rice Update

The main update tool is:

```bash
./scripts/update/rice-update.sh
```

It handles the project's versioning workflow.

Run:

```bash
cd ~/my-dotfiles
./scripts/update/rice-update.sh
```

The script allows selecting the release type:

* PATCH
* MINOR
* MAJOR

It calculates the next version, asks for a description, updates `VERSION`, updates `CHANGELOG.md`, creates the Git commit and creates the corresponding Git tag.

Example version flow:

```text
0.5.3-alpha
      ↓
PATCH
      ↓
0.5.4-alpha
```

---

## Check Versions

List all rice versions:

```bash
cd ~/my-dotfiles
./scripts/update/rice-versions.sh
```

This shows the available Git tags and indicates the current version.

You can also inspect the tags directly:

```bash
git tag --sort=-version:refname
```

---

## Sync Configuration

The sync tool is used to synchronize the current system configuration with the repository.

Run:

```bash
cd ~/my-dotfiles
./scripts/sync/rice-sync.sh
```

Before syncing, check the repository state:

```bash
git status
```

Review the changes afterward:

```bash
git diff
```

---

## Rollback

The rollback tool allows returning to a previous rice version.

First check the repository:

```bash
cd ~/my-dotfiles
git status
```

The working tree should be clean before performing a rollback.

Run:

```bash
./scripts/rollback/rice-rollback.sh
```

The script displays the available versions and allows selecting the desired version.

The rollback uses Git tags to restore a previous version of the rice.

---

## Development Workflow

A typical development cycle is:

```text
Edit configuration
      ↓
Test locally
      ↓
rice-sync
      ↓
Review git diff
      ↓
rice-update
      ↓
New version + Git tag
```

Start by entering the repository:

```bash
cd ~/my-dotfiles
```

Check the current state:

```bash
git status
```

Make the desired configuration changes.

Test the rice.

Then synchronize:

```bash
./scripts/sync/rice-sync.sh
```

Review:

```bash
git diff
git status
```

When everything is correct, create the new version:

```bash
./scripts/update/rice-update.sh
```

---

## Testing Hyprland

After changing Hyprland configuration:

```bash
hyprctl configerrors
```

If there are no errors, reload:

```bash
hyprctl reload
```

---

## Testing Waybar

Restart Waybar:

```bash
pkill waybar
waybar &
```

Check its configuration:

```bash
ls ~/.config/waybar
```

---

## Testing Quickshell

Test the wallpaper switcher:

```bash
~/my-dotfiles/quickshell/wallpaper-switcher/launch.sh
```

Test the theme selector:

```bash
~/my-dotfiles/quickshell/wallpaper-switcher/theme-selector.sh
```

---

## Testing Wallpapers

Check the wallpaper collection:

```bash
ls ~/.config/wallpapers
```

Test a wallpaper with awww:

```bash
awww img ~/.config/wallpapers/IMAGE.jpg
```

Check the daemon:

```bash
systemctl --user status awww-daemon
```

---

## Git

Check changes:

```bash
git status
```

Review differences:

```bash
git diff
```

Review commits:

```bash
git log --oneline --decorate -10
```

List tags:

```bash
git tag --sort=-version:refname
```

---

## Version File

The current rice version is stored in:

```text
~/my-dotfiles/VERSION
```

Read it:

```bash
cat ~/my-dotfiles/VERSION
```

Do not manually change the version when using the normal release workflow. Use:

```bash
./scripts/update/rice-update.sh
```

---

## Git Tags

Each release is represented by a Git tag.

Example:

```text
v0.5.0-alpha
v0.5.1-alpha
v0.5.2-alpha
v0.5.3-alpha
```

The version in `VERSION` and the release tag should remain synchronized.

---

## Commit Guidelines

Use clear commit messages.

Examples:

```text
feat: add new waybar theme
fix: repair wallpaper switcher
chore: update dependencies
docs: improve installation guide
refactor: reorganize quickshell themes
```

The normal versioning workflow should preferably use `rice-update.sh` instead of manually creating release commits and tags.

---

## Adding a New Theme

For a new Waybar theme, add the required files under:

```text
waybar/
```

For a new Quickshell wallpaper theme, create a directory under:

```text
quickshell/wallpaper-switcher/themes/
```

Example:

```text
quickshell/wallpaper-switcher/themes/
├── terminal/
├── glass/
├── minimal/
└── new-theme/
```

Test the theme locally before creating a release.

---

## Safety

Never commit:

* passwords
* API keys
* authentication tokens
* private keys
* personal credentials
* machine-specific secrets

Review changes before creating a release:

```bash
git status
git diff
```

---

## Recommended Release Checklist

Before releasing a new rice version:

```bash
cd ~/my-dotfiles
git status
./scripts/sync/rice-sync.sh
git diff
hyprctl configerrors
./scripts/update/rice-versions.sh
./scripts/update/rice-update.sh
git status
```

The goal is to keep the rice reproducible, versioned, portable and easy to restore after a fresh installation.
