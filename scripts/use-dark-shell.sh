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

# Clear GTK CSS cache so updated files are picked up immediately
rm -rf "${HOME}/.cache/glib-2.0" "${HOME}/.cache/gtk-4.0" "${HOME}/.cache/gtk-3.0" 2>/dev/null || true
echo "  ✓  GTK CSS cache cleared"

# Try to reload GNOME Shell
RELOADED=false
if [[ -n "${WAYLAND_DISPLAY:-}" ]] && command -v busctl >/dev/null 2>&1; then
  busctl --user call org.gnome.Shell /org/gnome/Shell \
    org.gnome.Shell Eval s 'Main.loadTheme()' >/dev/null 2>&1 \
    && { echo "  ✓  Shell reloaded (Wayland)"; RELOADED=true; } || true
fi
if ! $RELOADED && [[ -n "${DISPLAY:-}" ]] && command -v gdbus >/dev/null 2>&1; then
  gdbus call --session --dest org.gnome.Shell --object-path /org/gnome/Shell \
    --method org.gnome.Shell.Eval 'Main.loadTheme()' >/dev/null 2>&1 \
    && { echo "  ✓  Shell reloaded (X11)"; RELOADED=true; } || true
fi
$RELOADED || echo "  ⚠  Re-login to apply the shell theme"

echo
echo "Dark variant active."
