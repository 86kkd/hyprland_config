local H = HyprLua
local vars = H.vars
local expand = H.expand

vars.scriptsDir = expand("$HOME/.config/hypr/scripts")
vars.UserScripts = expand("$HOME/.config/hypr/UserScripts")
vars.lock = expand("$scriptsDir/LockScreen.sh")
vars.SwwwRandom = expand("$UserScripts/WallpaperAutoChange.sh")
vars.livewallpaper = ""
vars.wallDIR = expand("$HOME/Pictures/wallpapers")

local autostart = {
  "$scriptsDir/WallpaperBackend.sh start-daemon --format xrgb",
  "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP",
  "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP",
  "$scriptsDir/Dropterminal.sh kitty &",
  "$scriptsDir/Polkit.sh",
  "nm-applet --indicator",
  "nm-tray",
  "fcitx5 -d",
  "swaync",
  "waybar",
  "qs -c overview",
  "hypridle",
  "$scriptsDir/Hyprsunset.sh init",
  "wl-paste --type text --watch cliphist store",
  "wl-paste --type image --watch cliphist store",
}

for _, command in ipairs(autostart) do
  local startup_command = command
  hl.on("hyprland.start", function()
    hl.exec_cmd(expand(startup_command))
  end)
end
