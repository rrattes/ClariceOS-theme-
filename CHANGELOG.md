# Changelog

## 1.0.0-rc8-refined-depth
- introduced surface layering system (dark-deep → dark-chrome → dark-window → dark-card → dark-elevated → dark-floating)
- same layering for light mode (light-deep → light-chrome → light-window → light-card → light-elevated → light-floating)
- deepened dark mode base: window #232B36, chrome/sidebar #1E2633, view #1C2330, cards #293240, popovers #2F3A48
- cooled and refined light mode: window #ECF0F5, chrome #F0F4F8, sidebar #E2E8F1, cards #F8FAFC, popovers #FAFBFD
- multi-stop ambient window shadows on CSD windows (3 layers: near, mid, far)
- headerbar top-edge inset highlight (subtle glass effect)
- button gradient depth: subtle top-to-bottom gradient, pressed-in active state
- suggested-action button: richer vertical gradient + accent glow shadow
- sidebar row height +2px, rounder corners, distinct hover/selected states (selected now has inset ring)
- scrollbar handles thinned to 5px, removed border, more translucent
- menus/popovers: rounder (16px), menu items taller (32px) with more padding
- card shadow refined: tighter dual-stop (near + mid) instead of single far
- GNOME Shell dark panel deepened: rgba(18,23,31,0.92), softer at-rest icon opacity
- GNOME Shell light panel crisper: rgba(238,244,252,0.95), warmer clock pill treatment
- dark Quick Settings: container deepened rgba(22,28,38), tiles more layered, active tiles have glow
- light Quick Settings: cleaner glass cards, improved elevation shadows
- popovers/menus: deeper border and shadow for both light and dark shell
- notification cards: more padding, subtle depth shadow
- dash background: deeper, higher-contrast border

## 1.0.0-rc7-quicksettings-refined
- refined GNOME Shell Quick Settings surfaces
- improved control-box hierarchy in light and dark variants
- preserved RC6 continuous macOS-inspired top bar
