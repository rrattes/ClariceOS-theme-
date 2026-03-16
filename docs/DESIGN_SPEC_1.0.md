# ClariceOS-Theme — Design Spec 1.0

Status: **Phase 1 complete — reference visual frozen**  
Theme target: **GNOME latest (primary)** with pragmatic fallback to the immediately previous stable GNOME branch.  
Source of truth: `extras/reference_visual_kit/reference/original_mockup.png`

## 1. Objective

This document freezes the approved ClariceOS-Theme visual language so that all future fixes and implementations follow a single source of truth.

From this point forward, the theme **must not** change style direction, proportions, corner logic, shadow logic, or core palette unless Phase 1 is explicitly reopened.

## 2. Master reference

- Theme name: **ClariceOS-Theme**
- Master artboard: **1024 × 1536 px**
- Master preview: `preview/clean_preview.png`
- Installable theme root: `ClariceOS-Theme/`
- Frozen tokens file: `extras/reference_visual_kit/tokens/frozen_component_specs.json`

## 3. Visual intent

ClariceOS-Theme is defined by these non-negotiable traits:

- premium proprietary feel without visual excess
- restrained GNOME-friendly styling
- soft rounded geometry
- pale layered light surfaces
- deep blue-gray dark surfaces
- bright but controlled blue accent
- subtle borders instead of heavy outlines
- soft depth, never hard neon or glassmorphism overload

### Style references encoded into the theme
- Light mode should feel closer to a refined desktop productivity OS than a flat web UI.
- Dark mode should feel dense and calm, not blacked-out or high-contrast for its own sake.
- Interactive elements should look tactile through radius, border, and shadow — not through excessive gradients.

## 4. Frozen palette

### Light palette
- `light_bg`: `#F1F3F7`
- `light_surface`: `#FBFBFC`
- `light_surface_alt`: `#E8ECF3`
- `light_border`: `#C9D0DB`
- `light_text`: `#4A5260`
- `light_text_soft`: `#7D8796`

### Accent palette
- `accent_blue`: `#2A73D6`
- `accent_blue_soft`: `#AFC6E8`
- `accent_blue_lighter`: `#BCD3F3`
- `accent_blue_2`: `#4D99FD`

### Dark palette
- `dark_bg`: `#2E3642`
- `dark_bg_2`: `#3D4758`
- `dark_bg_3`: `#4A5667`
- `dark_bg_4`: `#7A8693`
- `dark_surface`: `#313947`
- `dark_surface_alt`: `#232A35`
- `dark_border`: `#5B6676`
- `dark_text`: `#F4F6F8`
- `dark_text_soft`: `#C7CDD6`

### Supporting colors
- `success_green`: `#4CB244`
- `warning_yellow`: `#F2D56F`
- `warning_orange`: `#E69A36`
- `danger_red`: `#E5534B`
- `pink`: `#E06798`
- `magenta`: `#D04D9B`
- `gray_chip`: `#7E8794`

## 5. Frozen geometry

These values are now official unless Phase 1 is reopened.

### GTK / app surfaces
- Window CSD radius: **14 px**
- Cards and grouped surfaces radius: **12 px**
- Buttons radius: **10 px**
- Entries/search/inputs radius: **12 px**
- Headerbar min height: **42 px**
- Button min height: **32 px**
- Button padding: **8 px vertical / 14 px horizontal**
- Entry min height: **34 px**
- Entry padding: **6 px vertical / 12 px horizontal**

### GNOME Shell
- Top panel height: **32 px**
- Panel button radius: **12 px**
- Popover / quick settings / calendar / modal radius: **16 px**
- Shell action button radius: **10 px**
- Shell action button min height: **36 px**
- Shell search entry min height: **38 px**
- Calendar day cell: **34 × 34 px**
- Calendar day radius: **10 px**
- Slider track height: **8 px**
- Slider handle radius: **10 px**
- Shell toggle body: **52 × 30 px**
- Dash background radius: **18 px**

### Roundness rule
- Buttons and input controls use **soft rounded rectangles**
- Pills and toggles use **fully rounded geometry**
- No sharp corners anywhere in the primary UI language

## 6. Frozen shadow logic

### Light mode
- soft control shadow: `0 3px 10px rgba(52,63,79,0.22)`
- card shadow: `0 6px 20px rgba(52,63,79,0.18)`
- headerbar elevation: `0 2px 10px rgba(52,63,79,0.15)`

### Dark mode / shell
- panel button shadow: `0 4px 10px rgba(23,29,38,0.35)`
- popup/modal shadow: `0 18px 36px rgba(23,29,38,0.40)`
- dash shadow: `0 12px 24px rgba(23,29,38,0.36)`

### Shadow rule
- shadows must be soft and atmospheric
- no clipped blur edges
- no heavy black halos
- no flat components where the mockup clearly indicates depth

## 7. Frozen component reference

The following canvases and proportions are frozen as reference points for future exports and audits.

### Buttons
- `button-light-default.png`: **170 × 51 px**
- `button-light-primary.png`: **202 × 53 px**
- `button-dark-default.png`: **154 × 53 px**
- `button-dark-primary.png`: **198 × 53 px**

### Toggles / pills / sliders
- toggle asset canvas: **76 × 42 px**
- shell pill asset canvas: **170 × 40 px**
- slider asset canvas: **374 × 44 px**

### Small controls
- checkbox canvas: **28 × 28 px**
- radio canvas: **26 × 26 px**

### Icons
- folder icon canvas: **70 × 52 px**
- search and gear icon canvases: **70 × 70 px**
- magnifier icon canvas: **74 × 74 px**
- clock icon canvas: **50 × 50 px**
- star icon canvas: **70 × 70 px**

### Folder icon proportion rule
Folder icons are visually sensitive and have already failed one audit.

Their canonical rule is now:
- keep the **70 × 52 px canvas**
- preserve the original mockup body proportion
- target visual body box should remain roughly in the **63–66 px width** and **46–48 px height** band
- do **not** re-export the earlier compressed shape that looked vertically flattened

## 8. Interaction states to preserve

All future implementations must preserve the following state logic:

- default
- hover
- active / pressed
- checked / selected
- disabled
- focus-visible

Rules:
- focus must be visible
- disabled must remain legible
- selected and accent states must use the frozen blue accent
- important state changes must not rely on extremely subtle tint differences

## 9. What is now frozen

The following items are officially frozen by Phase 1:

- theme name
- overall visual direction
- light and dark palette
- roundness model
- shadow model
- panel and popup geometry
- button, entry, slider, toggle, and pill size logic
- folder icon proportion rule
- master reference artboard and preview

## 10. What Phase 1 does not do

Phase 1 does **not** certify implementation quality by itself.

It only freezes the reference so that:
- Phase 2 can audit assets against fixed rules
- Phase 3 can finish GNOME Shell against a fixed target
- later GTK work can align to stable measurements

## 11. Files added by this phase

- `DESIGN_SPEC_1.0.md`
- `extras/reference_visual_kit/tokens/frozen_component_specs.json`

## 12. Acceptance

Phase 1 is complete when future work agrees to this rule:

> No visual correction may redefine the ClariceOS-Theme design language; corrections may only bring implementation closer to this frozen reference.
