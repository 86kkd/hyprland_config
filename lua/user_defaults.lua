-- Generated from legacy Hyprland .conf files.
-- Module: user_defaults
-- Sources:
--   UserConfigs/01-UserDefaults.conf

local H = HyprLua
local vars = H.vars
local expand = H.expand
local load_hypr_vars = H.load_hypr_vars


-- Source: UserConfigs/01-UserDefaults.conf
vars["edit"] = H.expand("${EDITOR:-nvim}")
vars["term"] = H.expand("kitty")
vars["files"] = H.expand("thunar")
vars["Search_Engine"] = H.expand("https://www.google.com/search?q={}")
