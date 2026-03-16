# ClariceOS-Theme — Phase 4 Audit (GTK4 / libadwaita)

## Goal
Close the GTK4/libadwaita layer so modern GNOME applications rely less on generic fallback styling and more on explicit selectors aligned to the approved mockup.

## What changed
- `ClariceOS-Theme/gtk-4.0/common.css` was expanded substantially.
- Light and dark token files were preserved to keep the same approved palette.
- Coverage now explicitly includes GTK4/libadwaita patterns such as preferences windows/groups, boxed lists, split views, overlay split views, viewswitchers, tab views, status pages, emoji chooser and completion popovers.

## Coverage before / after
- `gtk-4.0/common.css`: 430 lines → 769 lines
- `gtk-4.0/gtk.css`: unchanged token layer
- `gtk-4.0/gtk-dark.css`: unchanged token layer

## Closed focus areas
- Headerbars and modern app chrome
- Buttons, splitbuttons, menubuttons and focus-visible states
- Entries, password entries, search bars and text selection
- Preferences windows, groups, boxed lists and cards
- Navigation sidebars, split views and overlay split views
- Switches, checks, radios, scales, progress bars and scrollbars
- Popovers, menus, emoji chooser and completion
- Notebooks, tabview/tabbar and calendar
- Status pages, links and utility semantic colors

## Honest compatibility note
GTK4/libadwaita on current GNOME is not a fully open-ended theming target. This phase improves practical visual consistency, but some modern apps may still retain Adwaita-driven behavior depending on how they ship their styles and how the theme is applied in the user session.

## Phase result
Phase 4 is considered CLOSED at the package-source level.
It still does **not** replace runtime validation on a live GNOME session.
