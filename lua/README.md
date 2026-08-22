# Hyprland Lua configuration

`hyprland.lua` loads these modules from top to bottom. Put personal overrides in
`user_*.lua`; later modules take precedence over earlier modules.

| File | Purpose |
| --- | --- |
| `user_defaults.lua` | Default terminal, editor, file manager and search engine |
| `keybinds.lua` | Distribution keybinds |
| `user_keybinds.lua` | Personal keybind overrides |
| `startup.lua` | Programs started with Hyprland |
| `env.lua` | Session environment variables |
| `laptops.lua` | Laptop keys and touchpad |
| `window_rules.lua` | Window tags and rules |
| `settings.lua` | Input, layout, gestures, cursor and general behavior |
| `decorations.lua` | Gaps, borders, shadows, blur and Wallust colors |
| `animations.lua` | Curves and animation preset |
| `monitors.lua` | Monitor layout |
| `workspaces.lua` | Workspace rules |

Use one nested `hl.config({...})` table per related group. Keep binds, monitors,
animations and rules as individual calls because their order and per-entry options
matter.
