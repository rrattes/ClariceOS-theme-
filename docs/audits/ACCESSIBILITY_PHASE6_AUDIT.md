# ClariceOS-Theme — Phase 6 Accessibility Audit

Phase 6 focuses on contrast, focus visibility, disabled states, selection clarity, and semantic status colors for the latest GNOME target.

- PASS: **17**
- WARN: **0**
- FAIL: **0**

| Check | Foreground | Background | Ratio | Target | Status |
|---|---:|---:|---:|---|---|
| Light body text on window bg | `#4A5260` | `#F1F3F7` | **7.09:1** | AA text | **PASS** |
| Light secondary text on window bg | `#7D8796` | `#F1F3F7` | **3.27:1** | Large/secondary | **PASS** |
| Light link text on window bg | `#0F5FBF` | `#F1F3F7` | **5.54:1** | AA text | **PASS** |
| Light selected text on accent fill | `#FFFFFF` | `#2A73D6` | **4.64:1** | AA text | **PASS** |
| Light destructive text on destructive fill | `#FFFFFF` | `#C43A33` | **5.25:1** | AA text | **PASS** |
| Light success text on window bg | `#2F7D2C` | `#F1F3F7` | **4.62:1** | AA text | **PASS** |
| Light warning text on window bg | `#8B5B10` | `#F1F3F7` | **5.25:1** | AA text | **PASS** |
| Light error text on window bg | `#C43A33` | `#F1F3F7` | **4.73:1** | AA text | **PASS** |
| Dark body text on window bg | `#F4F6F8` | `#2E3642` | **11.25:1** | AA text | **PASS** |
| Dark secondary text on window bg | `#C7CDD6` | `#2E3642` | **7.62:1** | AA text | **PASS** |
| Dark link text on window bg | `#79B3FF` | `#2E3642` | **5.63:1** | AA text | **PASS** |
| Dark selected text on accent fill | `#FFFFFF` | `#2A73D6` | **4.64:1** | AA text | **PASS** |
| Dark success text on window bg | `#7FD67B` | `#2E3642` | **6.85:1** | AA text | **PASS** |
| Dark warning text on window bg | `#FFD166` | `#2E3642` | **8.46:1** | AA text | **PASS** |
| Dark error text on window bg | `#FF8A84` | `#2E3642` | **5.35:1** | AA text | **PASS** |
| Dark focus ring on window bg | `#79B3FF` | `#2E3642` | **5.63:1** | UI 3:1 | **PASS** |
| Light focus ring on window bg | `#0F5FBF` | `#F1F3F7` | **5.54:1** | UI 3:1 | **PASS** |

## Implemented changes

- Added dedicated `link_color` for light and dark to raise link legibility.
- Added `focus_ring_color` and routed focus outlines in GTK3/GTK4 to it.
- Split semantic text colors from fill colors with `success_text_color`, `warning_text_color`, and `error_text_color`.
- Added `destructive_bg_color` to keep destructive fills readable with white text.
- Increased disabled foreground visibility with solid theme-specific greys for both light and dark variants.
- Added GNOME Shell focus/checked-state overrides to strengthen keyboard focus visibility and selected-day boundaries.

## Residual watch item

- Dark accent-filled controls (`#2A73D6`) against the base dark window (`#2E3642`) measure **2.63:1** as a pure fill-vs-surface comparison. This is below the 3:1 non-text threshold in isolation, so Phase 6 compensates with stronger borders and focus/checked shadows in Shell and GTK. The fill itself stays unchanged to preserve mockup fidelity.

## Outcome

Phase 6 materially improves accessibility readiness and makes the package suitable for release-candidate testing, while preserving the approved visual direction.
