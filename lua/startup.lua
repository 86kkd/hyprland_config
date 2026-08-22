-- Generated from legacy Hyprland .conf files.
-- Module: startup
-- Sources:
--   configs/Startup_Apps.conf
--   UserConfigs/Startup_Apps.conf

local H = HyprLua
local vars = H.vars
local expand = H.expand
local load_hypr_vars = H.load_hypr_vars


-- Source: configs/Startup_Apps.conf
vars["scriptsDir"] = H.expand("$HOME/.config/hypr/scripts")
vars["UserScripts"] = H.expand("$HOME/.config/hypr/UserScripts")
vars["lock"] = H.expand("$scriptsDir/LockScreen.sh")
vars["SwwwRandom"] = H.expand("$UserScripts/WallpaperAutoChange.sh")
vars["livewallpaper"] = H.expand("")
vars["wallDIR"] = H.expand("$HOME/Pictures/wallpapers")
hl.on("hyprland.start", function()
  hl.exec_cmd(expand("$scriptsDir/WallpaperBackend.sh start-daemon --format xrgb"))
end)
hl.on("hyprland.start", function()
  hl.exec_cmd(expand("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"))
end)
hl.on("hyprland.start", function()
  hl.exec_cmd(expand("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"))
end)
hl.on("hyprland.start", function()
  hl.exec_cmd(expand("$HOME/.config/hypr/scripts/Dropterminal.sh kitty &"))
end)
hl.on("hyprland.start", function()
  hl.exec_cmd(expand("$scriptsDir/Polkit.sh"))
end)
hl.on("hyprland.start", function()
  hl.exec_cmd(expand("nm-applet --indicator"))
end)
hl.on("hyprland.start", function()
  hl.exec_cmd(expand("nm-tray"))
end)
hl.on("hyprland.start", function()
  hl.exec_cmd(expand("swaync"))
end)
hl.on("hyprland.start", function()
  hl.exec_cmd(expand("waybar"))
end)
hl.on("hyprland.start", function()
  hl.exec_cmd(expand("qs -c overview"))
end)
hl.on("hyprland.start", function()
  hl.exec_cmd(expand("hypridle"))
end)
hl.on("hyprland.start", function()
  hl.exec_cmd(expand("$scriptsDir/Hyprsunset.sh init"))
end)
hl.on("hyprland.start", function()
  hl.exec_cmd(expand("wl-paste --type text --watch cliphist store"))
end)
hl.on("hyprland.start", function()
  hl.exec_cmd(expand("wl-paste --type image --watch cliphist store"))
end)

-- Source: UserConfigs/Startup_Apps.conf
