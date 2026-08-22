-- Hyprland Lua config entrypoint.
-- Split modules mirror the old hyprland.conf source order.

local configHome = os.getenv("XDG_CONFIG_HOME") or ((os.getenv("HOME") or "") .. "/.config")
local hyprDir = configHome .. "/hypr"

local function load_module(name)
  dofile(hyprDir .. "/lua/" .. name .. ".lua")
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
