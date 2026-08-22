-- Generated from legacy Hyprland .conf files.
-- Module: monitors
-- Sources:
--   monitors.conf

local H = HyprLua
local vars = H.vars
local expand = H.expand
local load_hypr_vars = H.load_hypr_vars


-- Source: monitors.conf
hl.monitor({
  output = "DP-3",
  mode = "3840x2160@160.0",
  position = "1440x282",
  scale = 1.0,
})
hl.monitor({
  output = "DP-2",
  mode = "2560x1440@59.95",
  position = "0x118",
  scale = 1.0,
})
hl.monitor({
  output = "DP-2",
  transform = 3,
})
