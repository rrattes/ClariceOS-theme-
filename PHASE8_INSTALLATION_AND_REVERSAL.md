# ClariceOS-Theme — Phase 8 Installation and Reversal Report

## What was added

- `scripts/install.sh` — recommended one-shot install helper
- `scripts/uninstall.sh` — formal uninstall/reversal helper
- `scripts/set-shell-theme-note.sh` — explicit shell-theme note helper

## What was improved

- install helpers now validate expected runtime paths
- shell variant switchers now fail clearly if the theme is not installed
- README and INSTALL now document both recommended install and reversal

## Install workflow status

- Theme copy helper: present
- GTK theme activation instruction: present
- GTK4 bridge helper: present
- Shell dark/light switchers: present
- Formal uninstall helper: present

## Reversal workflow status

- Removes installed theme directory: yes
- Removes GTK4 bridge links pointing to ClariceOS-Theme: yes
- Resets GTK theme to Adwaita when `gsettings` is available: yes
- Resets GNOME Shell theme automatically: no

## Reason shell theme is not forced automatically

This package intentionally does not force the GNOME Shell theme key. Shell-theme selection remains part of the user's GNOME Shell/User Themes workflow.

## Outcome

Phase 8 is closed at the package level: installation and reversal are now documented and supported by dedicated helper scripts.
