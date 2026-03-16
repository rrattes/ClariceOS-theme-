
# ClariceOS-Theme — Phase 3 GNOME Shell Closure

This phase consolidates the GNOME Shell layer as the primary runtime-facing UI surface.

## What changed

- Expanded shell selector coverage beyond generic popup styling.
- Aligned dark and light variants around the same component map.
- Added dedicated styling coverage for:
  - top bar and panel buttons
  - popup menus and submenu items
  - calendar popover and day states
  - quick settings, quick toggles and sliders
  - notifications, messages and media controls
  - modal dialogs and end-session dialogs
  - overview search, app folders and workspace thumbnails
  - OSD / volume-like overlays

## Before / after line counts

- previous `gnome-shell.css`: 201 lines
- previous `gnome-shell-dark.css`: 201 lines
- previous `gnome-shell-light.css`: 200 lines
- current `gnome-shell.css`: 557 lines
- current `gnome-shell-dark.css`: 557 lines
- current `gnome-shell-light.css`: 554 lines

## Coverage status after Phase 3

PASS
- top bar base styling
- panel buttons and clock pill styling
- popup surface styling
- quick settings surfaces
- calendar base states
- notification/message cards
- modal shell surfaces
- overview search entry
- dash and workspace surfaces

PARTIAL
- exact runtime parity with specific GNOME builds still depends on live session testing
- iconography remains inherited from system icon theme
- any GNOME Shell upstream selector changes in a future release may still require patching

## Known limits intentionally deferred

- no GDM/login shell theming in this package
- no custom icon theme in this package
- no custom cursor theme in this package
- no guarantee of total visual override for every libadwaita-driven app surface (handled in later phases)

## Phase 3 acceptance

Accepted at source-package level:
- shell light/dark coverage is now symmetrical in scope
- critical shell surfaces are no longer relying only on broad generic selectors
- the package is ready to proceed to Phase 4 (GTK4/libadwaita closure)
