#!/usr/bin/env bash
set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
CONFIG_DIR="$HOME/.config"
BACKUP_DIR="$HOME/.config/dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

echo
echo "========================================"
echo "        MY DOTFILES INSTALLER"
echo "========================================"
echo

echo "==> Instalando pacotes essenciais..."
sudo pacman -Syu --needed - < "$REPO_DIR/packages/essential.txt"

echo
echo "==> Criando backup das configurações existentes..."

for dir in hypr waybar wofi kitty fish thunar fastfetch quickshell; do
    if [ -e "$CONFIG_DIR/$dir" ]; then
        mkdir -p "$BACKUP_DIR"
        mv "$CONFIG_DIR/$dir" "$BACKUP_DIR/"
    fi
done

if [ -d "$REPO_DIR/hyprland" ]; then
    mkdir -p "$CONFIG_DIR/hypr"
    cp -r "$REPO_DIR/hyprland/." "$CONFIG_DIR/hypr/"
fi

for dir in waybar wofi kitty fish thunar fastfetch quickshell; do
    if [ -d "$REPO_DIR/$dir" ]; then
        mkdir -p "$CONFIG_DIR/$dir"
        cp -r "$REPO_DIR/$dir/." "$CONFIG_DIR/$dir/"
    fi
done

echo
echo "==> Instalando wallpapers..."

mkdir -p "$CONFIG_DIR/wallpapers"
cp -r "$REPO_DIR/wallpapers/." "$CONFIG_DIR/wallpapers/"

echo

echo
echo "==> Configurando Thunar como gerenciador padrão..."

xdg-mime default thunar.desktop inode/directory
xdg-mime default thunar.desktop application/zip
xdg-mime default thunar.desktop application/x-7z-compressed
xdg-mime default thunar.desktop application/x-tar

echo
echo "==> Configurando aww..."

mkdir -p "$HOME/.config/systemd/user"

cat > "$HOME/.config/systemd/user/awww-daemon.service" <<SERVICE
[Unit]
Description=awww wallpaper daemon
After=graphical-session.target

[Service]
ExecStart=/usr/bin/awww-daemon
Restart=on-failure

[Install]
WantedBy=graphical-session.target
SERVICE

systemctl --user daemon-reload
systemctl --user enable --now awww-daemon.service

echo
echo "==> Configurando permissões..."

find "$CONFIG_DIR/quickshell" -type f -name "*.sh" -exec chmod +x {} \; 2>/dev/null || true
find "$CONFIG_DIR/waybar" -type f -name "*.sh" -exec chmod +x {} \; 2>/dev/null || true

echo
echo "========================================"
echo "       INSTALAÇÃO CONCLUÍDA!"
echo "========================================"
echo

if [ -d "$BACKUP_DIR" ]; then
    echo "Backup criado em:"
    echo "$BACKUP_DIR"
    echo
fi

echo "Faça logout/login antes de testar o rice."
