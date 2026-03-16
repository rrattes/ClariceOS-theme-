> Note: the GTK4 bridge requires `gtk.css`, `gtk-dark.css`, and `common.css` in `~/.config/gtk-4.0/`. The included install script now creates all three links.

# INSTALL

This package is **ClariceOS-Theme 1.0.0-rc1**.

# ClariceOS-Theme — Installation and Reversal

## Recommended install

```bash
./scripts/install.sh
```

What it does:
1. Copies the theme into `~/.themes/ClariceOS-Theme`
2. Sets GTK theme to `ClariceOS-Theme`
3. Applies the GTK4/libadwaita bridge in `~/.config/gtk-4.0`
4. Sets the default shell variant to **dark**

## GNOME Shell activation

Enable the **User Themes** GNOME Shell extension and choose `ClariceOS-Theme` as the shell theme.

## Shell variant switching

```bash
./scripts/use-dark-shell.sh
# or
./scripts/use-light-shell.sh
```

## Manual step-by-step install

```bash
./scripts/install-user-theme.sh
gsettings set org.gnome.desktop.interface gtk-theme 'ClariceOS-Theme'
./scripts/apply-gtk4-symlink.sh
```

## Reversal / uninstall

```bash
./scripts/uninstall.sh
```

What it does:
1. Removes `~/.themes/ClariceOS-Theme`
2. Removes GTK4 bridge symlinks if they point to ClariceOS-Theme
3. Resets the GTK theme to `Adwaita` when `gsettings` is available

## Notes

- `gnome-shell.css` is the active shell file used by GNOME Shell.
- The helper scripts copy either `gnome-shell-dark.css` or `gnome-shell-light.css` onto `gnome-shell.css`.
- GTK4/libadwaita coverage is best-effort and depends on how each application ships and applies its own styles.
- This package does not force the shell-theme gsettings key automatically.
