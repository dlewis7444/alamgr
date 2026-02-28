#!/usr/bin/env bash
set -euo pipefail

rm -f "$HOME/.local/bin/alamgr"
rm -f "$HOME/.local/share/applications/alamgr.desktop"
rm -f "$HOME/.local/share/icons/hicolor/256x256/apps/alamgr.png"

if command -v gtk-update-icon-cache &>/dev/null; then
    gtk-update-icon-cache -f -t "$HOME/.local/share/icons/hicolor/"
fi
if command -v update-desktop-database &>/dev/null; then
    update-desktop-database "$HOME/.local/share/applications/"
fi

echo "Uninstalled."
