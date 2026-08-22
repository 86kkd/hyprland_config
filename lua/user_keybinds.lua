local H = HyprLua
local vars = H.vars
local expand = H.expand

vars.mainMod = "SUPER"
vars.scriptsDir = expand("$HOME/.config/hypr/scripts")
vars.UserScripts = expand("$HOME/.config/hypr/UserScripts")
vars.UserConfigs = expand("$HOME/.config/hypr/UserConfigs")
hl.unbind("SUPER + SPACE")
hl.unbind("SUPER + H")
hl.unbind("SUPER + ALT + L")
hl.unbind("SUPER + CTRL + H")
hl.unbind("SUPER + CTRL + K")
hl.unbind("SUPER + CTRL + L")
hl.bind("SUPER + F9", hl.dsp.exec_cmd(expand("$scriptsDir/ScreenRecord.sh -s")), {
  description = "start screen recording (system audio)",
})
hl.bind("SUPER + F8", hl.dsp.exec_cmd(expand("pkill -INT -x wf-recorder")), {
  description = "stop screen recording",
})
hl.bind("CTRL + SHIFT + F", H.dispatch("togglefloating", ""), {
  description = "Float current window",
})
hl.bind("CTRL + Q", H.dispatch("killactive", ""), {
  description = "close active window",
})
hl.bind("CTRL + SHIFT + H", H.dispatch("movetoworkspace", "-1"), {
  description = "move to previous workspace",
})
hl.bind("CTRL + SHIFT + L", H.dispatch("movetoworkspace", "+1"), {
  description = "move to next workspace",
})
hl.bind("SUPER + ALT + h", H.dispatch("swapwindow", "l"), {
  description = "swap window left",
})
hl.bind("SUPER + ALT + j", H.dispatch("swapwindow", "d"), {
  description = "swap window down",
})
hl.bind("SUPER + ALT + k", H.dispatch("swapwindow", "u"), {
  description = "swap window up",
})
hl.bind("SUPER + ALT + l", H.dispatch("swapwindow", "r"), {
  description = "swap window right",
})
hl.bind("SUPER + CTRL + h", H.dispatch("movewindow", "l"), {
  description = "move window left",
})
hl.bind("SUPER + CTRL + j", H.dispatch("movewindow", "d"), {
  description = "move window down",
})
hl.bind("SUPER + CTRL + k", H.dispatch("movewindow", "u"), {
  description = "move window up",
})
hl.bind("SUPER + CTRL + l", H.dispatch("movewindow", "r"), {
  description = "move window right",
})
hl.bind("SUPER + F", H.dispatch("fullscreenstate", "2 0"), {
  description = "special fullscreenstate",
})
hl.bind("SUPER + Y", hl.dsp.exec_cmd(expand("$scriptsDir/ChangeLayout.sh")), {
  description = "cycle master/dwindle/scrolling layout",
})
hl.bind("SUPER + space", hl.dsp.exec_cmd(expand("pkill rofi || rofi -show drun -modi drun,filebrowser,run,window")), {
  description = "app launcher",
})
hl.bind("SUPER + O", hl.dsp.exec_cmd(expand("$term")), {
  description = "open terminal",
})
