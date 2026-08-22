-- Generated from legacy Hyprland .conf files.
-- Module: boot
-- Sources:
--   hyprland.conf

local H = HyprLua
local vars = H.vars
local expand = H.expand
local load_hypr_vars = H.load_hypr_vars


-- Source: hyprland.conf
hl.on("hyprland.start", function()
  hl.exec_cmd(expand("$HOME/.config/hypr/initial-boot.sh"))
end)
vars["configs"] = H.expand("$HOME/.config/hypr/configs")
vars["UserConfigs"] = H.expand("$HOME/.config/hypr/UserConfigs")
-- Legacy source handled by hyprland.lua load order: configs/Keybinds.conf
-- Legacy source handled by hyprland.lua load order: configs/Startup_Apps.conf
-- Legacy source handled by hyprland.lua load order: UserConfigs/Startup_Apps.conf
-- Legacy source handled by hyprland.lua load order: configs/ENVariables.conf
-- Legacy source handled by hyprland.lua load order: UserConfigs/ENVariables.conf
-- Legacy source handled by hyprland.lua load order: configs/Laptops.conf
-- Legacy source handled by hyprland.lua load order: UserConfigs/Laptops.conf
-- Legacy source handled by hyprland.lua load order: UserConfigs/LaptopDisplay.conf
-- Legacy source handled by hyprland.lua load order: configs/WindowRules.conf
-- Legacy source handled by hyprland.lua load order: UserConfigs/WindowRules.conf
-- Legacy source handled by hyprland.lua load order: configs/SystemSettings.conf
-- Legacy source handled by hyprland.lua load order: UserConfigs/UserDecorations.conf
-- Legacy source handled by hyprland.lua load order: UserConfigs/UserAnimations.conf
-- Legacy source handled by hyprland.lua load order: UserConfigs/UserKeybinds.conf
-- Legacy source handled by hyprland.lua load order: UserConfigs/UserSettings.conf
-- Legacy source handled by hyprland.lua load order: UserConfigs/01-UserDefaults.conf
-- Legacy source handled by hyprland.lua load order: monitors.conf
-- Legacy source handled by hyprland.lua load order: workspaces.conf
