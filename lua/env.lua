-- Generated from legacy Hyprland .conf files.
-- Module: env
-- Sources:
--   configs/ENVariables.conf
--   UserConfigs/ENVariables.conf

local H = HyprLua
local vars = H.vars
local expand = H.expand
local load_hypr_vars = H.load_hypr_vars


-- Source: configs/ENVariables.conf
hl.env("DOTS_VERSION", expand("2.3.20"))
hl.env("GDK_BACKEND", expand("wayland,x11,*"))
hl.env("QT_QPA_PLATFORM", expand("wayland;xcb"))
hl.env("CLUTTER_BACKEND", expand("wayland"))
hl.env("XDG_CURRENT_DESKTOP", expand("Hyprland"))
hl.env("XDG_SESSION_DESKTOP", expand("Hyprland"))
hl.env("XDG_SESSION_TYPE", expand("wayland"))
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", expand("1"))
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", expand("1"))
hl.env("QT_QPA_PLATFORMTHEME", expand("qt5ct"))
hl.env("QT_QPA_PLATFORMTHEME", expand("qt6ct"))
hl.env("QT_QUICK_CONTROLS_STYLE", expand("org.hyprland.style"))
hl.env("GDK_SCALE", expand("1"))
hl.env("QT_SCALE_FACTOR", expand("1"))
hl.env("MOZ_ENABLE_WAYLAND", expand("1"))
hl.env("ELECTRON_OZONE_PLATFORM_HINT", expand("auto"))

-- Source: UserConfigs/ENVariables.conf
