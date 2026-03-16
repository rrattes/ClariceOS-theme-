#!/usr/bin/env bash
set -euo pipefail

THEME_NAME="ClariceOS-Theme"
SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/$THEME_NAME"
DEST_DIR="${HOME}/.themes/$THEME_NAME"

mkdir -p "${HOME}/.themes"
rm -rf "$DEST_DIR"
cp -a "$SRC_DIR" "$DEST_DIR"

echo "Installed $THEME_NAME into $DEST_DIR"
echo "Set GTK theme with:"
echo "  gsettings set org.gnome.desktop.interface gtk-theme '$THEME_NAME'"
echo
echo "For GNOME Shell, enable the User Themes extension and select '$THEME_NAME' as the shell theme."
