#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Preflight: check runtime dependencies
missing=()
for dep in alacritty tmux zenity jq; do
    command -v "$dep" &>/dev/null || missing+=("$dep")
done
if [[ ${#missing[@]} -gt 0 ]]; then
    echo "Error: missing required dependencies: ${missing[*]}" >&2
    echo "Install them and re-run install.sh." >&2
    exit 1
fi

install -Dm755 "$SCRIPT_DIR/alamgr"         "$HOME/.local/bin/alamgr"
install -Dm644 "$SCRIPT_DIR/alamgr.desktop"  "$HOME/.local/share/applications/alamgr.desktop"
install -Dm644 "$SCRIPT_DIR/alamgr.png"      "$HOME/.local/share/icons/hicolor/256x256/apps/alamgr.png"

# Seed env config from example if not already present
config_dir="$HOME/.config/alamgr"
mkdir -p "$config_dir" && chmod 700 "$config_dir"
if [[ ! -f "$config_dir/env" ]]; then
    install -m644 "$SCRIPT_DIR/env.example" "$config_dir/env"
    echo "Created $config_dir/env — edit to configure."
fi

# Ensure index.theme exists for gtk-update-icon-cache
if [[ ! -f "$HOME/.local/share/icons/hicolor/index.theme" ]]; then
    cp /usr/share/icons/hicolor/index.theme "$HOME/.local/share/icons/hicolor/index.theme"
fi

if command -v gtk-update-icon-cache &>/dev/null; then
    gtk-update-icon-cache -f -t "$HOME/.local/share/icons/hicolor/"
fi
if command -v update-desktop-database &>/dev/null; then
    update-desktop-database "$HOME/.local/share/applications/"
fi

echo "Installed. You may need to log out and back in for the icon to appear."
