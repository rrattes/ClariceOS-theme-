# ClariceOS-Theme — Accessibility Checklist 1.0

## Contrast
- [x] Body text passes AA in light and dark
- [x] Link text now uses dedicated accessible colors in light and dark
- [x] Destructive button fill keeps white text above AA
- [x] Semantic success / warning / error labels use dedicated accessible text colors
- [x] Focus ring colors exceed 3:1 against base window surfaces
- [ ] Accent-filled controls in dark mode should still be validated in live GNOME runtime with real iconography and adjacent borders

## Focus visibility
- [x] GTK3 focus ring routed to `focus_ring_color`
- [x] GTK4/libadwaita focus ring routed to `focus_ring_color`
- [x] GNOME Shell focus states receive explicit outline/shadow reinforcement

## Disabled states
- [x] Disabled foreground uses solid theme-specific greys instead of low-opacity color tokens
- [x] Disabled backgrounds remain visually distinct from active cards/buttons

## Selection and status
- [x] Selected text on accent fill remains readable
- [x] Calendar selected-day boundary reinforced in GNOME Shell
- [x] Checked-state boundaries reinforced for Shell toggles and checkboxes

## Release note to keep
- [x] Document that latest-GNOME runtime validation is still required before 1.0 distribution
