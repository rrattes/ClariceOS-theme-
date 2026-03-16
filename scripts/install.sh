#!/usr/bin/env bash
set -euo pipefail

THEME_NAME="ClariceOS-Theme"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
THEME_SRC="$ROOT_DIR/$THEME_NAME"
THEME_DEST="${HOME}/.themes/$THEME_NAME"
GTK4_CONFIG_DIR="${HOME}/.config/gtk-4.0"

mkdir -p "${HOME}/.themes"
rm -rf "$THEME_DEST"
cp -a "$THEME_SRC" "$THEME_DEST"

# Set GTK theme
if command -v gsettings >/dev/null 2>&1; then
  gsettings set org.gnome.desktop.interface gtk-theme "$THEME_NAME" || true
fi

# Bridge many GTK4/libadwaita apps through ~/.config/gtk-4.0
mkdir -p "$GTK4_CONFIG_DIR"
ln -sfn "$THEME_DEST/gtk-4.0/gtk.css" "$GTK4_CONFIG_DIR/gtk.css"
ln -sfn "$THEME_DEST/gtk-4.0/gtk-dark.css" "$GTK4_CONFIG_DIR/gtk-dark.css"
ln -sfn "$THEME_DEST/gtk-4.0/common.css" "$GTK4_CONFIG_DIR/common.css"

# Default shell variant: dark
cp "$THEME_DEST/gnome-shell/gnome-shell-dark.css" "$THEME_DEST/gnome-shell/gnome-shell.css"

cat <<MSG
Installed $THEME_NAME into $THEME_DEST
GTK theme set to $THEME_NAME
GTK4 bridge links applied under $GTK4_CONFIG_DIR (gtk.css, gtk-dark.css, common.css)
Default shell variant set to dark

Next steps:
  1. Enable the GNOME Shell 'User Themes' extension.
  2. Select '$THEME_NAME' as the shell theme.
  3. Use ./scripts/use-light-shell.sh if you want the light shell variant.
MSG
