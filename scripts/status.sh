#!/usr/bin/env bash
# ClariceOS-Theme — show current installation status
set -euo pipefail

THEME_NAME="ClariceOS-Theme"
THEME_DEST="${HOME}/.themes/$THEME_NAME"
GTK4_CONFIG_DIR="${HOME}/.config/gtk-4.0"
GTK3_CONFIG_DIR="${HOME}/.config/gtk-3.0"

ok()   { echo "  ✓  $*"; }
fail() { echo "  ✗  $*"; }
info() { echo "  ·  $*"; }

echo
echo "ClariceOS-Theme — status"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Theme files
echo
echo "▸ Theme directory"
if [ -d "$THEME_DEST" ]; then
  ok "$THEME_DEST"
else
  fail "$THEME_DEST — not found (run ./scripts/install.sh)"
fi

if [ -d "/usr/share/themes/$THEME_NAME" ]; then
  ok "/usr/share/themes/$THEME_NAME (system-wide)"
fi

# Shell variant
echo
echo "▸ Shell variant"
SHELL_CSS="$THEME_DEST/gnome-shell/gnome-shell.css"
if [ -f "$SHELL_CSS" ]; then
  if diff -q "$SHELL_CSS" "$THEME_DEST/gnome-shell/gnome-shell-dark.css"  >/dev/null 2>&1; then
    ok "dark variant active"
  elif diff -q "$SHELL_CSS" "$THEME_DEST/gnome-shell/gnome-shell-light.css" >/dev/null 2>&1; then
    ok "light variant active"
  else
    info "custom gnome-shell.css (modified manually)"
  fi
else
  fail "gnome-shell.css missing"
fi

# GTK4 bridge
echo
echo "▸ GTK4 / libadwaita bridge"
for f in gtk.css gtk-dark.css common.css; do
  LINK="$GTK4_CONFIG_DIR/$f"
  if [ -L "$LINK" ] && [[ "$(readlink "$LINK")" == *"$THEME_NAME"* ]]; then
    ok "$LINK → $(readlink "$LINK")"
  else
    fail "$LINK — not linked to $THEME_NAME"
  fi
done

# GTK3 settings
echo
echo "▸ GTK3 settings.ini"
GTK3_INI="$GTK3_CONFIG_DIR/settings.ini"
if [ -f "$GTK3_INI" ]; then
  GTK_THEME_VAL=$(grep '^gtk-theme-name='             "$GTK3_INI" | cut -d= -f2 || echo "?")
  DARK_VAL=$(grep '^gtk-application-prefer-dark-theme=' "$GTK3_INI" | cut -d= -f2 || echo "?")
  LAYOUT_VAL=$(grep '^gtk-decoration-layout='         "$GTK3_INI" | cut -d= -f2 || echo "?")
  [ "$GTK_THEME_VAL" = "$THEME_NAME" ] \
    && ok "gtk-theme-name = $GTK_THEME_VAL" \
    || fail "gtk-theme-name = $GTK_THEME_VAL (expected $THEME_NAME)"
  info "gtk-application-prefer-dark-theme = $DARK_VAL"
  info "gtk-decoration-layout = $LAYOUT_VAL"
else
  fail "$GTK3_INI — not found"
fi

# gsettings
if command -v gsettings >/dev/null 2>&1; then
  echo
  echo "▸ gsettings"
  GTK_THEME=$(gsettings get org.gnome.desktop.interface gtk-theme     2>/dev/null | tr -d "'")
  COLOR_SCH=$(gsettings get org.gnome.desktop.interface color-scheme  2>/dev/null | tr -d "'")
  BTN_LAYOUT=$(gsettings get org.gnome.desktop.wm.preferences button-layout 2>/dev/null | tr -d "'")
  FONT_AA=$(gsettings get org.gnome.desktop.interface font-antialiasing 2>/dev/null | tr -d "'")

  [ "$GTK_THEME" = "$THEME_NAME" ] \
    && ok  "gtk-theme = $GTK_THEME" \
    || fail "gtk-theme = $GTK_THEME (expected $THEME_NAME)"

  info "color-scheme = $COLOR_SCH"

  [ "$BTN_LAYOUT" = "close,minimize,maximize:" ] \
    && ok  "button-layout = $BTN_LAYOUT (macOS style)" \
    || fail "button-layout = $BTN_LAYOUT (expected close,minimize,maximize:)"

  info "font-antialiasing = $FONT_AA"

  if gsettings get org.gnome.shell.extensions.user-theme name >/dev/null 2>&1; then
    SHELL_THEME=$(gsettings get org.gnome.shell.extensions.user-theme name 2>/dev/null | tr -d "'")
    [ "$SHELL_THEME" = "$THEME_NAME" ] \
      && ok  "shell theme = $SHELL_THEME" \
      || fail "shell theme = $SHELL_THEME (expected $THEME_NAME)"
  else
    info "User Themes extension not active — shell theme not checked"
  fi
fi

# Flatpak
if command -v flatpak >/dev/null 2>&1; then
  echo
  echo "▸ Flatpak"
  FLATPAK_LINK="${HOME}/.local/share/themes/$THEME_NAME"
  if [ -L "$FLATPAK_LINK" ] && [[ "$(readlink "$FLATPAK_LINK")" == *"$THEME_NAME"* ]]; then
    ok "~/.local/share/themes/$THEME_NAME linked"
  else
    fail "~/.local/share/themes/$THEME_NAME not linked"
  fi
  GTK_ENV=$(flatpak override --user --show 2>/dev/null | grep GTK_THEME || echo "")
  [ -n "$GTK_ENV" ] \
    && ok "Flatpak GTK_THEME override: $GTK_ENV" \
    || info "No GTK_THEME override for Flatpak (run install.sh to add)"
fi

echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo
