ClariceOS-Theme RC4 complete package

This hotfix addresses the framed/background-heavy appearance visible in GNOME Settings and other libadwaita apps.

Changes:
- removed broad window background painting from generic containers like box, stack, clamp, content and preferences wrappers
- kept window background only on real window roots
- made preferencesgroup/adwpreferencesgroup wrappers transparent
- limited card styling to inner group surfaces instead of outer wrappers
- softened sidebar panel/background and selected row fills

Expected result:
- fewer gray/blue "frames" around Settings content
- cleaner separation between window background, sidebar and cards
- closer to the approved ClariceOS mockup without nested background blocks
