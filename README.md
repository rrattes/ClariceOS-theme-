> Hotfix applied: GTK4 bridge now links `common.css` as well, fixing missing GTK4 theme rules in many apps.

# ClariceOS-Theme

**Version:** 1.0.0-rc1  
**Release type:** Release Candidate (RC1)  
**Target:** GNOME 50  
**Compatibility target:** GNOME 49

ClariceOS-Theme is a GNOME Shell + GTK theme package derived from the approved visual mockup.

## Scope

This package currently covers:
- GNOME Shell (`gnome-shell.css`, `gnome-shell-dark.css`, `gnome-shell-light.css`)
- GTK 3 (`gtk-3.0/`)
- GTK 4 (`gtk-4.0/`)
- a cleaned visual reference kit used to derive the theme

This package does **not** currently include a custom icon theme, cursor theme, or GDM theme.

## Target platform

- Primary target: latest GNOME generation in current project scope
- Practical support target for closing work: GNOME 49/50-era Shell + GTK

## Quick install

```bash
./scripts/install.sh
```

That helper:
- copies the theme into `~/.themes/ClariceOS-Theme`
- sets the GTK theme to `ClariceOS-Theme`
- bridges GTK4/libadwaita through `~/.config/gtk-4.0`
- activates the **dark** shell variant by default

## Shell setup

1. Install and enable the **User Themes** shell extension.
2. Select `ClariceOS-Theme` as the shell theme.
3. Switch shell flavor if desired:

```bash
./scripts/use-dark-shell.sh
# or
./scripts/use-light-shell.sh
```

## Manual helpers

```bash
./scripts/install-user-theme.sh
./scripts/apply-gtk4-symlink.sh
./scripts/uninstall.sh
```

## Reversal

```bash
./scripts/uninstall.sh
```

This removes the installed theme from `~/.themes/ClariceOS-Theme`, removes GTK4 bridge links that point to this theme, and resets the GTK theme to `Adwaita` when `gsettings` is available.

## Package layout

- `ClariceOS-Theme/` — runtime theme files
- `scripts/` — install/apply/switch/uninstall helpers
- `docs/` — design spec, compatibility notes, audits, selector matrices, checklists
- `extras/reference_visual_kit/` — approved reference assets, mockups and tokens
- `preview/` — visual previews

## Current project state

This package is now **consolidated for closing work**:
- visual reference frozen
- assets audited
- GNOME Shell consolidated
- GTK4/libadwaita consolidated
- GTK3 consolidated
- accessibility pass completed
- installation/reversal workflow documented

Runtime validation in a live GNOME session and release packaging still remain for final distribution.

## Official screenshots

- `screenshots/clariceos-theme-overview.png`
- `screenshots/clariceos-theme-files-light.png`
- `screenshots/clariceos-theme-settings-dark.png`
