local H = HyprLua
local expand = H.expand
local load_hypr_vars = H.load_hypr_vars

load_hypr_vars(expand("$HOME/.config/hypr/wallust/wallust-hyprland.conf"))

hl.config({
  general = {
    border_size = 2,
    gaps_in = 2,
    gaps_out = 4,
    ["col.active_border"] = expand("$color12"),
    ["col.inactive_border"] = expand("$color10"),
  },
  decoration = {
    rounding = 10,
    active_opacity = 1.0,
    inactive_opacity = 0.9,
    fullscreen_opacity = 1.0,
    dim_inactive = true,
    dim_strength = 0.1,
    dim_special = 0.8,
    shadow = {
      enabled = true,
      range = 3,
      render_power = 1,
      color = expand("$color12"),
      color_inactive = expand("$color10"),
    },
    blur = {
      enabled = true,
      size = 6,
      passes = 3,
      new_optimizations = true,
      xray = true,
      ignore_opacity = true,
      special = true,
      popups = true,
    },
  },
  group = {
    ["col.border_active"] = expand("$color15"),
    groupbar = { ["col.active"] = expand("$color0") },
  },
})
