local H = HyprLua
local vars = H.vars
local expand = H.expand

hl.on("hyprland.start", function()
  hl.exec_cmd(expand("$HOME/.config/hypr/initial-boot.sh"))
end)

vars.configs = expand("$HOME/.config/hypr/configs")
vars.UserConfigs = expand("$HOME/.config/hypr/UserConfigs")
