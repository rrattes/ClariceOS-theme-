#!/usr/bin/env bash
# Activate the dark shell variant and sync system color-scheme
set -euo pipefail

THEME_NAME="ClariceOS-Theme"
THEME_DIR="${HOME}/.themes/$THEME_NAME/gnome-shell"
GTK3_SETTINGS="${HOME}/.config/gtk-3.0/settings.ini"

[ -d "$THEME_DIR" ] || {
  echo "Theme not installed. Run ./scripts/install.sh first." >&2; exit 1
}

cp "$THEME_DIR/gnome-shell-dark.css" "$THEME_DIR/gnome-shell.css"
echo "  ✓  gnome-shell.css → gnome-shell-dark.css"

if command -v gsettings >/dev/null 2>&1; then
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'  2>/dev/null && \
    echo "  ✓  color-scheme = prefer-dark" || true
  gsettings set org.gnome.desktop.interface gtk-theme "$THEME_NAME"     2>/dev/null || true
fi

# Keep gtk-3.0/settings.ini in sync
if [ -f "$GTK3_SETTINGS" ]; then
  sed -i 's/^gtk-application-prefer-dark-theme=.*/gtk-application-prefer-dark-theme=1/' \
    "$GTK3_SETTINGS" && echo "  ✓  gtk-3.0/settings.ini updated" || true
fi

echo
echo "Dark variant active. Re-login (Wayland) or Alt+F2 → r (X11) to apply shell theme."
