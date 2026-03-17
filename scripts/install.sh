#!/usr/bin/env bash
# ClariceOS-Theme — comprehensive installer
# Usage: ./scripts/install.sh [--light] [--system]
#   --light   activate light shell variant (default: dark)
#   --system  also install to /usr/share/themes (requires sudo)
set -euo pipefail

THEME_NAME="ClariceOS-Theme"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
THEME_SRC="$ROOT_DIR/$THEME_NAME"
THEME_DEST="${HOME}/.themes/$THEME_NAME"
GTK4_CONFIG_DIR="${HOME}/.config/gtk-4.0"
GTK3_CONFIG_DIR="${HOME}/.config/gtk-3.0"

VARIANT="dark"
SYSTEM_INSTALL=false
for arg in "$@"; do
  case "$arg" in
    --light)  VARIANT="light" ;;
    --dark)   VARIANT="dark"  ;;
    --system) SYSTEM_INSTALL=true ;;
  esac
done

ok()      { echo "  ✓  $*"; }
warn()    { echo "  ⚠  $*"; }
section() { echo; echo "▸ $*"; }

# ── 1. Copy theme files ────────────────────────────────────────────────────────
section "Installing theme files"
mkdir -p "${HOME}/.themes"
rm -rf "$THEME_DEST"
# Use cp -r (not -a) so files get current timestamps — GNOME Shell uses mtime
# to detect CSS changes and may skip reload if timestamps look stale.
cp -r "$THEME_SRC" "$THEME_DEST"
# Stamp all CSS files with the current time to guarantee cache invalidation
find "$THEME_DEST" -name "*.css" -exec touch {} +
ok "Copied to $THEME_DEST"

if $SYSTEM_INSTALL; then
  SYSTEM_DEST="/usr/share/themes/$THEME_NAME"
  if sudo cp -r "$THEME_SRC" "$SYSTEM_DEST" 2>/dev/null; then
    sudo find "$SYSTEM_DEST" -name "*.css" -exec touch {} +
    ok "Copied to $SYSTEM_DEST (system-wide)"
  else
    warn "Could not install system-wide — skipping (no sudo access)"
  fi
fi

# ── 2. Shell variant ───────────────────────────────────────────────────────────
section "Setting shell variant: $VARIANT"
cp "$THEME_DEST/gnome-shell/gnome-shell-${VARIANT}.css" \
   "$THEME_DEST/gnome-shell/gnome-shell.css"
ok "gnome-shell.css → gnome-shell-${VARIANT}.css"

# ── 3. GTK4 / libadwaita bridge ───────────────────────────────────────────────
section "GTK4 / libadwaita bridge (~/.config/gtk-4.0)"
mkdir -p "$GTK4_CONFIG_DIR"
ln -sfn "$THEME_DEST/gtk-4.0/gtk.css"      "$GTK4_CONFIG_DIR/gtk.css"
ln -sfn "$THEME_DEST/gtk-4.0/gtk-dark.css" "$GTK4_CONFIG_DIR/gtk-dark.css"
ln -sfn "$THEME_DEST/gtk-4.0/common.css"   "$GTK4_CONFIG_DIR/common.css"
ok "gtk.css, gtk-dark.css, common.css linked"

# ── 4. GTK3 settings.ini ──────────────────────────────────────────────────────
section "GTK3 settings (~/.config/gtk-3.0/settings.ini)"
mkdir -p "$GTK3_CONFIG_DIR"
PREFER_DARK=$([ "$VARIANT" = "dark" ] && echo "1" || echo "0")
cat > "$GTK3_CONFIG_DIR/settings.ini" <<INI
[Settings]
gtk-theme-name=$THEME_NAME
gtk-application-prefer-dark-theme=$PREFER_DARK
gtk-font-name=Cantarell 11
gtk-icon-theme-name=Adwaita
gtk-cursor-theme-name=Adwaita
gtk-cursor-theme-size=24
gtk-enable-animations=true
gtk-decoration-layout=close,minimize,maximize:
INI
ok "settings.ini written"

# ── 5. gsettings ──────────────────────────────────────────────────────────────
if command -v gsettings >/dev/null 2>&1; then
  section "Applying gsettings"

  gsettings set org.gnome.desktop.interface gtk-theme        "$THEME_NAME"          \
    && ok "gtk-theme = $THEME_NAME"                                                  \
    || warn "Could not set gtk-theme"

  COLOR_SCHEME="prefer-${VARIANT}"
  gsettings set org.gnome.desktop.interface color-scheme     "$COLOR_SCHEME"        \
    && ok "color-scheme = $COLOR_SCHEME"                                             \
    || warn "Could not set color-scheme"

  # macOS-style: traffic lights on the left
  gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:' \
    && ok "button-layout = close,minimize,maximize: (macOS style)"                  \
    || warn "Could not set button-layout"

  # Font rendering — subpixel AA + slight hinting (closest to macOS feel)
  gsettings set org.gnome.desktop.interface font-antialiasing 'rgba'  2>/dev/null && true
  gsettings set org.gnome.desktop.interface font-hinting       'slight' 2>/dev/null && true
  ok "font-antialiasing = rgba, font-hinting = slight"

  # GNOME Shell theme (requires User Themes extension)
  if gsettings get org.gnome.shell.extensions.user-theme name >/dev/null 2>&1; then
    gsettings set org.gnome.shell.extensions.user-theme name "$THEME_NAME"          \
      && ok "shell theme = $THEME_NAME"                                              \
      || warn "Could not set shell theme (is the User Themes extension enabled?)"
  else
    warn "User Themes extension not active — set shell theme manually in GNOME Tweaks"
  fi
else
  warn "gsettings not found — desktop integration skipped"
fi

# ── 6. Flatpak bridge ─────────────────────────────────────────────────────────
if command -v flatpak >/dev/null 2>&1; then
  section "Flatpak theme bridge"
  FLATPAK_THEMES="${HOME}/.local/share/themes"
  mkdir -p "$FLATPAK_THEMES"
  ln -sfn "$THEME_DEST" "$FLATPAK_THEMES/$THEME_NAME"
  ok "Linked into ~/.local/share/themes/$THEME_NAME"
  flatpak override --user --filesystem="${HOME}/.themes"                2>/dev/null && true
  flatpak override --user --filesystem="${HOME}/.local/share/themes"   2>/dev/null && true
  flatpak override --user --env=GTK_THEME="$THEME_NAME"                2>/dev/null && true
  ok "Flatpak filesystem + env overrides applied"
fi

# ── 7. Clear GTK CSS cache ────────────────────────────────────────────────────
section "Clearing GTK CSS cache"
# GTK compiles CSS to a binary cache; stale cache ignores updated theme files
GTK_CACHE_DIRS=(
  "${HOME}/.cache/glib-2.0"
  "${HOME}/.cache/gtk-4.0"
  "${HOME}/.cache/gtk-3.0"
)
for d in "${GTK_CACHE_DIRS[@]}"; do
  if [ -d "$d" ]; then
    rm -rf "$d"
    ok "Removed $d"
  fi
done

# ── 8. Try to reload GNOME Shell ──────────────────────────────────────────────
section "Reloading GNOME Shell"
RELOADED=false

# Wayland: use busctl (works without --session restriction on most distros)
if [[ -n "${WAYLAND_DISPLAY:-}" ]]; then
  if command -v busctl >/dev/null 2>&1; then
    busctl --user call org.gnome.Shell /org/gnome/Shell \
      org.gnome.Shell Eval s 'Main.loadTheme()' >/dev/null 2>&1 \
      && { ok "Shell theme reloaded (Wayland/busctl)"; RELOADED=true; } \
      || true
  fi
fi

# X11: use gdbus
if ! $RELOADED && [[ -n "${DISPLAY:-}" ]]; then
  if command -v gdbus >/dev/null 2>&1; then
    gdbus call --session \
      --dest org.gnome.Shell \
      --object-path /org/gnome/Shell \
      --method org.gnome.Shell.Eval 'Main.loadTheme()' >/dev/null 2>&1 \
      && { ok "Shell theme reloaded (X11/gdbus)"; RELOADED=true; } \
      || true
  fi
fi

if ! $RELOADED; then
  warn "Could not reload shell automatically — re-login to apply the shell theme"
fi

# ── Done ──────────────────────────────────────────────────────────────────────
echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  ClariceOS-Theme installed  (variant: $VARIANT)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo
echo "  Switch variant:"
echo "    ./scripts/use-dark-shell.sh"
echo "    ./scripts/use-light-shell.sh"
echo
echo "  Check status:   ./scripts/status.sh"
echo "  Uninstall:      ./scripts/uninstall.sh"
echo
