#!/usr/bin/env bash
# ClariceOS-Theme — full uninstaller
set -euo pipefail

THEME_NAME="ClariceOS-Theme"
THEME_DEST="${HOME}/.themes/$THEME_NAME"
GTK4_CONFIG_DIR="${HOME}/.config/gtk-4.0"
GTK3_CONFIG_DIR="${HOME}/.config/gtk-3.0"
FLATPAK_THEMES="${HOME}/.local/share/themes"

ok()      { echo "  ✓  $*"; }
warn()    { echo "  ⚠  $*"; }
section() { echo; echo "▸ $*"; }

# ── 1. Remove theme directory ──────────────────────────────────────────────────
section "Removing theme files"
if [ -d "$THEME_DEST" ]; then
  rm -rf "$THEME_DEST"
  ok "Removed $THEME_DEST"
else
  warn "$THEME_DEST not found — already removed?"
fi

# System-wide copy
SYSTEM_DEST="/usr/share/themes/$THEME_NAME"
if [ -d "$SYSTEM_DEST" ]; then
  sudo rm -rf "$SYSTEM_DEST" 2>/dev/null \
    && ok "Removed $SYSTEM_DEST" \
    || warn "Could not remove $SYSTEM_DEST (no sudo access)"
fi

# ── 2. GTK4 bridge symlinks ────────────────────────────────────────────────────
section "Removing GTK4 bridge symlinks"
remove_theme_link() {
  local path="$1"
  if [ -L "$path" ]; then
    local target
    target="$(readlink "$path")"
    case "$target" in
      *"/.themes/$THEME_NAME/"*|*"/local/share/themes/$THEME_NAME/"*)
        rm -f "$path" && ok "Removed $path" ;;
    esac
  fi
}
remove_theme_link "$GTK4_CONFIG_DIR/gtk.css"
remove_theme_link "$GTK4_CONFIG_DIR/gtk-dark.css"
remove_theme_link "$GTK4_CONFIG_DIR/common.css"

# ── 3. GTK3 settings.ini ──────────────────────────────────────────────────────
section "Restoring GTK3 settings"
if [ -f "$GTK3_CONFIG_DIR/settings.ini" ]; then
  # Reset only keys this theme set; leave any other user settings intact
  sed -i \
    -e 's/^gtk-theme-name=.*/gtk-theme-name=Adwaita/' \
    -e 's/^gtk-application-prefer-dark-theme=.*/gtk-application-prefer-dark-theme=0/' \
    -e 's/^gtk-decoration-layout=.*/gtk-decoration-layout=:minimize,maximize,close/' \
    "$GTK3_CONFIG_DIR/settings.ini" \
    && ok "settings.ini reset to Adwaita defaults" || warn "Could not edit settings.ini"
fi

# ── 4. gsettings ──────────────────────────────────────────────────────────────
if command -v gsettings >/dev/null 2>&1; then
  section "Resetting gsettings"

  gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'              2>/dev/null \
    && ok "gtk-theme = Adwaita" || warn "Could not reset gtk-theme"

  gsettings set org.gnome.desktop.interface color-scheme 'default'           2>/dev/null \
    && ok "color-scheme = default" || warn "Could not reset color-scheme"

  # Restore GNOME default button layout (right side)
  gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close' 2>/dev/null \
    && ok "button-layout = :minimize,maximize,close (restored)" || warn "Could not reset button-layout"

  # Reset font rendering to GNOME defaults
  gsettings reset org.gnome.desktop.interface font-antialiasing 2>/dev/null && true
  gsettings reset org.gnome.desktop.interface font-hinting      2>/dev/null && true
  ok "font-antialiasing and font-hinting reset to defaults"

  # Clear GNOME Shell custom theme (if User Themes extension is active)
  if gsettings get org.gnome.shell.extensions.user-theme name >/dev/null 2>&1; then
    gsettings set org.gnome.shell.extensions.user-theme name '' 2>/dev/null \
      && ok "shell theme cleared" || warn "Could not clear shell theme"
  fi
else
  warn "gsettings not found — desktop settings not reset"
fi

# ── 5. Flatpak cleanup ────────────────────────────────────────────────────────
if command -v flatpak >/dev/null 2>&1; then
  section "Cleaning up Flatpak overrides"
  # Remove the symlink in ~/.local/share/themes
  if [ -L "$FLATPAK_THEMES/$THEME_NAME" ]; then
    rm -f "$FLATPAK_THEMES/$THEME_NAME"
    ok "Removed ~/.local/share/themes/$THEME_NAME symlink"
  fi
  flatpak override --user --reset 2>/dev/null \
    && ok "Flatpak user overrides reset" \
    || warn "Could not reset Flatpak overrides (may need manual cleanup)"
fi

# ── Done ──────────────────────────────────────────────────────────────────────
echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  ClariceOS-Theme removed"
echo "  GTK/Shell theme restored to Adwaita"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo
