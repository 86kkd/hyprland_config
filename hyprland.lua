-- Hyprland Lua config entrypoint.
-- Split modules mirror the old hyprland.conf source order.

local function load_module(name)
  require("lua/" .. name)
end

load_module("helpers")
load_module("boot")
load_module("user_defaults")
load_module("keybinds")
load_module("startup")
load_module("env")
load_module("laptops")
load_module("window_rules")
load_module("settings")
load_module("decorations")
load_module("animations")
load_module("user_keybinds")
load_module("user_settings")
load_module("user_defaults")
load_module("monitors")
load_module("workspaces")
load_module("migration_notes")
