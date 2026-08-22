-- Generated from legacy Hyprland .conf files.
-- Module: decorations
-- Sources:
--   UserConfigs/UserDecorations.conf
--   wallust/wallust-hyprland.conf

local H = HyprLua
local vars = H.vars
local expand = H.expand
local load_hypr_vars = H.load_hypr_vars


-- Source: UserConfigs/UserDecorations.conf
load_hypr_vars("/home/linda/.config/hypr/wallust/wallust-hyprland.conf")
hl.config({ general = { border_size = 2 } })
hl.config({ general = { gaps_in = 2 } })
hl.config({ general = { gaps_out = 4 } })
hl.config({ general = { ["col.active_border"] = expand("$color12") } })
hl.config({ general = { ["col.inactive_border"] = expand("$color10") } })
hl.config({ decoration = { rounding = 10 } })
hl.config({ decoration = { active_opacity = 1.0 } })
hl.config({ decoration = { inactive_opacity = 0.9 } })
hl.config({ decoration = { fullscreen_opacity = 1.0 } })
hl.config({ decoration = { dim_inactive = true } })
hl.config({ decoration = { dim_strength = 0.1 } })
hl.config({ decoration = { dim_special = 0.8 } })
hl.config({ decoration = { shadow = { enabled = true } } })
hl.config({ decoration = { shadow = { range = 3 } } })
hl.config({ decoration = { shadow = { render_power = 1 } } })
hl.config({ decoration = { shadow = { color = expand("$color12") } } })
hl.config({ decoration = { shadow = { color_inactive = expand("$color10") } } })
hl.config({ decoration = { blur = { enabled = true } } })
hl.config({ decoration = { blur = { size = 6 } } })
hl.config({ decoration = { blur = { passes = 3 } } })
hl.config({ decoration = { blur = { new_optimizations = true } } })
hl.config({ decoration = { blur = { xray = true } } })
hl.config({ decoration = { blur = { ignore_opacity = true } } })
hl.config({ decoration = { blur = { special = true } } })
hl.config({ decoration = { blur = { popups = true } } })
hl.config({ group = { ["col.border_active"] = expand("$color15") } })
hl.config({ group = { groupbar = { ["col.active"] = expand("$color0") } } })
