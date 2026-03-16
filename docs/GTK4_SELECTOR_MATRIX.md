# ClariceOS-Theme — GTK4 / libadwaita Selector Matrix (Phase 4)

## Core surfaces
- `window`, `.background`, `dialog`, `messagedialog`, `toolbarview`, `preferenceswindow`
- `window.csd`, `dialog.background.csd`, `windowhandle`

## Headerbars and top chrome
- `headerbar`, `.titlebar`, `viewswitcherbar`, `tabbar`, `tabbox`
- `windowhandle > box > headerbar`, `toolbarview > headerbar`
- backdrop states for headerbars

## Interactive controls
- `button`, `.button`, `menubutton > button`, `splitbutton > button`
- `viewswitcher button`, `stackswitcher button`, `windowcontrols button`
- `suggested-action`, `destructive-action`, `focus-visible`, `disabled`

## Text inputs
- `entry`, `searchentry`, `passwordentry`, `spinbutton`, `dropdown > button`
- `searchbar entry`, `entry > text`, `text selection`

## Preferences / libadwaita structure
- `preferenceswindow`, `preferencespage`, `preferencesgroup`, `statuspage`, `clamp`
- `boxedlist`, `.boxed-list`, `.card`, `.frame`
- `adwpreferencesgroup`, `adwstatuspage`, `adwclamp`

## Navigation patterns
- `.navigation-sidebar`, `navigation-sidebar`, `splitview`, `overlay-split-view`
- `navigationview`, `leaflet`, `flap`, `carousel`

## Lists and rows
- `listview`, `listbox`, `columnview`, `row`, `activatable`, boxed rows
- hover and selected states

## Toggles and indicators
- `switch`, `switch slider`
- `check`, `radio`, `checkbutton > check`, `checkbutton > radio`
- `spinner`

## Sliders / bars / scrollbars
- `scale trough`, `scale slider`, `progressbar`, `levelbar`, `scrollbar`
- horizontal / vertical scrollbar sliders

## Popovers and menus
- `popover`, `menu`, `.popup-menu`, `.tooltip`, `emojichooser`, `completion`
- `popover contents`, `modelbutton`, `menuitem`

## Tabs and notebooks
- `notebook > header > tabs > tab`
- `tabview > tabbar`, `taboverview`, `viewswitcher`

## Calendar and status
- `calendar`, `calendar:selected`, `calendar.view header`
- `statuspage`, `.title`, `.description`

## Utility
- `link`, `.link`, `button.link`
- `.success`, `.warning`, `.error`
