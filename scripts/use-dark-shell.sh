#!/usr/bin/env bash
set -euo pipefail
THEME_NAME="ClariceOS-Theme"
THEME_DIR="${HOME}/.themes/$THEME_NAME/gnome-shell"
[ -d "$THEME_DIR" ] || { echo "Theme not installed in $THEME_DIR" >&2; exit 1; }
cp "$THEME_DIR/gnome-shell-dark.css" "$THEME_DIR/gnome-shell.css"
echo "Dark shell variant activated for $THEME_NAME. Restart GNOME Shell or relogin to apply."
