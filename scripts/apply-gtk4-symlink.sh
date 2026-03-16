#!/usr/bin/env bash
set -euo pipefail

THEME_NAME="ClariceOS-Theme"
THEME_DIR="${HOME}/.themes/$THEME_NAME/gtk-4.0"
CONFIG_DIR="${HOME}/.config/gtk-4.0"

if [ ! -d "$THEME_DIR" ]; then
  echo "Theme directory not found: $THEME_DIR" >&2
  echo "Install the theme first with ./scripts/install-user-theme.sh or ./scripts/install.sh" >&2
  exit 1
fi

mkdir -p "$CONFIG_DIR"
ln -sfn "$THEME_DIR/gtk.css" "$CONFIG_DIR/gtk.css"
ln -sfn "$THEME_DIR/gtk-dark.css" "$CONFIG_DIR/gtk-dark.css"
ln -sfn "$THEME_DIR/common.css" "$CONFIG_DIR/common.css"

echo "Linked GTK 4 theme files into $CONFIG_DIR (gtk.css, gtk-dark.css, common.css)"
echo "This is the practical way to make many libadwaita apps follow the custom theme."
