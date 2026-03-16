# ClariceOS-Theme 1.0.0-rc4-complete

## Fixed
- GTK4 bridge now also links `common.css` into `~/.config/gtk-4.0/`.
- This fixes a packaging bug where `gtk.css` and `gtk-dark.css` imported `common.css`, but the imported file was missing from the bridge directory.

## Expected impact
- GNOME Shell was already applying correctly.
- GTK4 / many modern GNOME apps should now pick up the ClariceOS theme rules instead of falling back close to Adwaita.

## After installing
Run the updated `scripts/install.sh` again, or rerun `scripts/apply-gtk4-symlink.sh`, then fully close and reopen the affected apps.
