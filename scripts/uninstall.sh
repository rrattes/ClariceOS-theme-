#!/usr/bin/env bash
set -euo pipefail

THEME_NAME="ClariceOS-Theme"
THEME_DEST="${HOME}/.themes/$THEME_NAME"
GTK4_CONFIG_DIR="${HOME}/.config/gtk-4.0"
GTK_CSS_LINK="$GTK4_CONFIG_DIR/gtk.css"
GTK_DARK_CSS_LINK="$GTK4_CONFIG_DIR/gtk-dark.css"
GTK_COMMON_CSS_LINK="$GTK4_CONFIG_DIR/common.css"

remove_link_if_points_to_theme() {
  local path="$1"
  if [ -L "$path" ]; then
    local target
    target="$(readlink "$path")"
    case "$target" in
      *"/.themes/$THEME_NAME/gtk-4.0/"*) rm -f "$path" ;;
    esac
  fi
}

remove_link_if_points_to_theme "$GTK_CSS_LINK"
remove_link_if_points_to_theme "$GTK_DARK_CSS_LINK"
remove_link_if_points_to_theme "$GTK_COMMON_CSS_LINK"

rm -rf "$THEME_DEST"

if command -v gsettings >/dev/null 2>&1; then
  gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita' || true
fi

cat <<MSG
Removed $THEME_NAME from $THEME_DEST
Removed GTK4 bridge links that pointed to this theme
GTK theme reset to Adwaita when available through gsettings

If GNOME Shell is still using a custom shell theme, switch it back manually in your theme selector or User Themes workflow.
MSG
